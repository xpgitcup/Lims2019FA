<!DOCTYPE html>
<html>
<head>
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="${message(code: 'queryStatementA.label', default: 'QueryStatementA')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>

</head>

<body>

<div class="card">
    <div class="card-header">
        <h2>
            <g:message code="default.edit.label" args="[entityName]"/>
            ${this.queryStatementA.actionName}.${this.queryStatementA.keyString}
        </h2>
    </div>

    <div id="edit-queryStatementA" class="card-body">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.queryStatementA}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.queryStatementA}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form id="${this.queryStatementA.id}" action="update" controller="${params.controller}" method="PUT">
            <g:hiddenField name="version" value="${this.queryStatementA?.version}"/>
            <div>
                <!--f:all bean="queryStatementA"/-->
                <div class="form-group">
                    <label for='paramsString'>参数列表：</label>
                    ${this.queryStatementA.paramsString}
                </div>

                <div class='form-group'>
                    <label for='queryString'>Query String</label>
                    <g:textArea name="queryString" value="${this.queryStatementA.queryString}" id="queryString"
                                style="width:80em; rows:10"/>
                </div>

                <div class='form-group'>
                    <label for='viewName'>View Name</label>
                    <g:textField name="viewName" value="${this.queryStatementA.viewName}" id="viewName"/>
                </div>

                <div class='form-check'>
                    <label for='isSQL'>Is SQL</label><input type="hidden" name="_isSQL"/>
                    <input type="checkbox" name="isSQL" id="isSQL"/>
                </div>

                <div class='form-check'>
                    <label for='needToQuery'>是否需要执行</label><input type="hidden" name="_needToQuery"/>
                    <input type="checkbox" name="needToQuery" id="needToQuery"
                           checked="${this.queryStatementA.needToQuery}" value="${this.queryStatementA.needToQuery}"/>
                </div>

                <g:hiddenField name="nextController" value="${params.nextController}"/>
                <g:hiddenField name="nextAction" value="${params.nextAction}"/>
            </div>
            <fieldset class="buttons">
                <input class="save" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <a href="operation4QueryStatementA/index">返回</a>
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>
