package cn.edu.cup.operation

import cn.edu.cup.basic.Person
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.TeamController
import cn.edu.cup.lims.Thing

class Operation4TeamCommonController extends TeamController {

    /*
     * 招聘
     * */
    def recruit() {
        def person = Person.findByName(params.name)
        def team = teamService.get(params.team)
        if (!team.members.contains(person)) {
            team.members.add(person)
            teamService.save(team)
        } else {
            flash.message = "已经加入了!"
        }
        chain(action: "index")
    }

    def disband(Team team) {
        if (team) {
            teamService.delete(team.id)
        }
        redirect(action: "index")
    }

    def dismiss() {
        println("${params}")
        def person = Person.get(params.person)
        def team = Team.get(params.currentTeam)
        if (team) {
            if (team.members.contains(person)) {
                team.members.remove(person)
                teamService.save(team)
            }
        }
        chain(action: "index")
    }

    def quitTeam(Team team) {
        def myself = session.systemUser.person()
        if (team.members.contains(myself)) {
            team.members.remove(myself)
            teamService.save(team)
        } else {
            flash.message = "不属于该团队!"
        }
        chain(action: "index")
    }

    def joinTeam(Team team) {
        def myself = session.systemUser.person()
        if (!team.members.contains(myself)) {
            team.members.add(myself)
            teamService.save(team)
        } else {
            flash.message = "已经加入了!"
        }
        chain(action: "index")
    }

    def createTeam(Thing thing) {
        println("${params}")
        def leader = session.systemUser.person()
        if (leader) {
            if (!Team.findAllByThingAndLeader(thing, leader)) {
                def team = new Team(leader: leader, thing: thing)
                teamService.save(team)
                println("create ok ${team}")
            } else {
                flash.message = "不能重复！"
            }
        } else {
            flash.message = "找不到这个成员！"
        }
        chain(action: "index")
    }

    def index() {}
}
