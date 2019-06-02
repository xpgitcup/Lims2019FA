<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/6/2
  Time: 11:27
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
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
    <g:set var="entityName" value="TeamStudentProject"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <g:render template="projectLeft"/>
        </div>

        <div class="col-6">
            <g:render template="projectRight"/>
        </div>
    </div>
</div>
</body>
</html>