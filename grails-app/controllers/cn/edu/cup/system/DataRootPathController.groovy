package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class DataRootPathController extends cn.edu.cup.common.CommonController {

    DataRootPathService dataRootPathService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.dataRootPathTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.dataRootPathJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond dataRootPathService.list(params), model:[dataRootPathCount: dataRootPathService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def dataRootPath = dataRootPathService.get(id)

        if (request.xhr) {
            render(template: view, model: [dataRootPath: dataRootPath])
        } else {
            respond dataRootPath
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def dataRootPath = new DataRootPath(params)

        if (request.xhr) {
            render(template: view, model: [dataRootPath: dataRootPath])
        } else {
            respond dataRootPath
        }
    }

    def save(DataRootPath dataRootPath) {

        if (dataRootPath == null) {
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
            dataRootPathService.save(dataRootPath)
            flash.message = message(code: 'default.created.message', args: [message(code: 'dataRootPath.label', default: 'DataRootPath'), dataRootPath.id])
        } catch (ValidationException e) {
            flash.message = dataRootPath.errors
        }

        withFormat {
            js { render "alert('dataRootPath创建成功!')" }

            json { render dataRootPath as JSON }

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

        def dataRootPath = dataRootPathService.get(id)

        if (request.xhr) {
            render(template: view, model: [dataRootPath: dataRootPath])
        } else {
            respond dataRootPath
        }
    }

    def update(DataRootPath dataRootPath) {
        if (dataRootPath == null) {
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
            dataRootPathService.save(dataRootPath)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'dataRootPath.label', default: 'DataRootPath'), dataRootPath.id])
        } catch (ValidationException e) {
            flash.message = dataRootPath.errors
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

        dataRootPathService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'dataRootPath.label', default: 'DataRootPath'), id])

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
        def objectList = commonService.importObjectArrayFromJsonFileName(fileName, DataRootPath.class)
        if (objectList.size()>0) {
            // 先清空
            DataRootPath.list().each { e ->
                dataRootPathService.delete(e.id)
            }
            objectList.each { e ->
                dataRootPathService.save(e)
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

       def fjson = commonService.exportObjects2JsonString(DataRootPath.list())
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataRootPath.label', default: 'DataRootPath'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
