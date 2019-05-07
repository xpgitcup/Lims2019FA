package cn.edu.cup.system

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QueryStatementAController {

    QueryStatementAService queryStatementAService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond queryStatementAService.list(params), model:[queryStatementACount: queryStatementAService.count()]
    }

    def show(Long id) {
        respond queryStatementAService.get(id)
    }

    def create() {
        respond new QueryStatementA(params)
    }

    def save(QueryStatementA queryStatementA) {
        if (queryStatementA == null) {
            notFound()
            return
        }

        try {
            queryStatementAService.save(queryStatementA)
        } catch (ValidationException e) {
            respond queryStatementA.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queryStatementA.label', default: 'QueryStatementA'), queryStatementA.id])
                redirect queryStatementA
            }
            '*' { respond queryStatementA, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond queryStatementAService.get(id)
    }

    def update(QueryStatementA queryStatementA) {
        if (queryStatementA == null) {
            notFound()
            return
        }

        try {
            queryStatementAService.save(queryStatementA)
        } catch (ValidationException e) {
            respond queryStatementA.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'queryStatementA.label', default: 'QueryStatementA'), queryStatementA.id])
                redirect queryStatementA
            }
            '*'{ respond queryStatementA, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        queryStatementAService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'queryStatementA.label', default: 'QueryStatementA'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryStatementA.label', default: 'QueryStatementA'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
