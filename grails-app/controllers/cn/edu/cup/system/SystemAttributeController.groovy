package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemAttributeController extends cn.edu.cup.common.CommonController {

    SystemAttributeService systemAttributeService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemAttributeTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemAttributeJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemAttributeService.list(params), model:[systemAttributeCount: systemAttributeService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemAttribute = systemAttributeService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemAttribute = new SystemAttribute(params)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def save(SystemAttribute systemAttribute) {

        if (systemAttribute == null) {
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
            systemAttributeService.save(systemAttribute)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), systemAttribute.id])
        } catch (ValidationException e) {
            flash.message = systemAttribute.errors
        }

        withFormat {
            js { render "alert('systemAttribute创建成功!')" }

            json { render systemAttribute as JSON }

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

        def systemAttribute = systemAttributeService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def update(SystemAttribute systemAttribute) {
        if (systemAttribute == null) {
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
            systemAttributeService.save(systemAttribute)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), systemAttribute.id])
        } catch (ValidationException e) {
            flash.message = systemAttribute.errors
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

        systemAttributeService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), id])

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
        def objectList = commonService.importObjectArrayFromJsonFileName(fileName, SystemAttribute.class)
        if (objectList.size()>0) {
            // 先清空
            SystemAttribute.list().each { e ->
                systemAttributeService.delete(e.id)
            }
            objectList.each { e ->
                systemAttributeService.save(e)
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

       def fjson = commonService.exportObjects2JsonString(SystemAttribute.list())
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
