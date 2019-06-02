package cn.edu.cup.operation

import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingTypeCircle

class Operation4TeamStudentProjectController extends Operation4TeamCommonController {

    def systemCommonService

    protected void prepareParams() {
        // 首先获取当前任务
        def parameters = systemCommonService.getParameters(request)
        def currentTask = "科研任务"

        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()

        def thingTypeList
        switch (currentTask) {
            case "科研任务":
                thingTypeList = ThingTypeCircle.allRelatedProjects(currentTitle)
                break
            case "教学任务":
                thingTypeList = ThingTypeCircle.allRelatedCourses(currentTitle)
                break
        }
        switch (params.key) {
            case "我参与的":
                def idlist = []
                thingTypeList.each { e ->
                    idlist.add(e.id)
                }
                params.thingTypeList = idlist
                params.myself = myself.id
                println("我参与：${myself.id} ${idlist}")
                break
            case "我领导的":
                params.thingTypeList = thingTypeList
                params.myself = myself
                break
            case "可选项目":
                params.thingTypeList = thingTypeList
                break
            case "相关团队":
                def currentThing = Thing.get(params.currentThing)
                params.currentThing = currentThing
                //params.thingTypeList = thingTypeList
                break
            case "所有课程":
                params.thingTypeList = thingTypeList
                break
            case "我的课程":
                params.myself = myself
                params.thingTypeList = thingTypeList
                break
            case "队员列表":
                break
        }
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "队员列表":
                def currentTeam = Team.get(params.currentTeam)
                if (currentTeam) {
                    result.objectList = [currentTeam]
                    result.team = currentTeam
                    result.members = currentTeam.members.sort() { a, b ->
                        a.code.compareTo(b.code)
                    }
                    //result.view = "listMember"
                    result.view = "listMemberLeft"
                }
                break
            case "我参与的":
                def teams = []
                println("结果：${result}")
                result.objectList.each { e ->
                    println("查找 ${e}")
                    teams.add(Team.get(e.team_members_id))
                }
                println("转换后：${teams}")
                result.objectList = teams
                break
        }
        return result
    }

    def index() {}
}
