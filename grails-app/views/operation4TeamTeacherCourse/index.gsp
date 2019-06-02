<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/6/1
  Time: 21:33
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
    <g:set var="entityName" value="TeamTeacherCourse"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <g:render template="courseLeft"/>
        </div>

        <div class="col-6">
            <g:render template="courseRight"/>
        </div>
    </div>
</div>
</body>
</html>