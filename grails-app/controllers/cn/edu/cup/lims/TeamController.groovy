package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TeamController extends cn.edu.cup.common.CommonController {

    TeamService teamService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.teamTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.teamJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond teamService.list(params), model:[teamCount: teamService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def team = teamService.get(id)

        if (request.xhr) {
            render(template: view, model: [team: team])
        } else {
            respond team
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def team = new Team(params)

        if (request.xhr) {
            render(template: view, model: [team: team])
        } else {
            respond team
        }
    }

    def save(Team team) {

        if (team == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = params.controller
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            teamService.save(team)
            flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), team.id])
        } catch (ValidationException e) {
            flash.message = team.errors
        }

        withFormat {
            js { render "alert('team创建成功!')" }

            json { render team as JSON }

            '*' {
                if (params.url) {
                    redirect(params.url)
                } else {
                    redirect(controller: controller, action: action, params: params)
                }
            }
        }

    }

    def edit(Long id) {
        def view = "edit"
        if (params.view) {
            view = params.view
        }

        def team = teamService.get(id)

        if (request.xhr) {
            render(template: view, model: [team: team])
        } else {
            respond team
        }
    }

    def update(Team team) {
        if (team == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            teamService.save(team)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), team.id])
        } catch (ValidationException e) {
            flash.message = team.errors
        }

        if (controller == "")
        {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        teamService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), id])

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "")
        {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def importFromJsonFile() {

        def fileName = "${commonService.webRootPath}/${params.fileName}"
        def objectList = commonService.importObjectArrayFromJsonFileName(fileName, Team.class)
        if (objectList.size()>0) {
            // 先清空
            Team.list().each { e ->
                teamService.delete(e.id)
            }
            objectList.each { e ->
                teamService.save(e)
            }
        }

        def action = "index"
        if (params.nextAction) {
           action = params.nextAction
         }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def exportToJsonFile() {

        def fileName = "${commonService.webRootPath}/${params.fileName}"

       def fjson = commonService.exportObjects2JsonString(Team.list())
        def printer = new File(fileName).newPrintWriter('utf-8')    //写入文件
        printer.println(fjson)
        printer.close()

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "")
        {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
