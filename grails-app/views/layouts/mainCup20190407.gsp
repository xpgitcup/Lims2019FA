<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/4/7
  Time: 20:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <!--设置Base-->
    <base href="<%=basePath%>"/>

    <!-- 加载石油大学的设置-->
    <asset:stylesheet src="cup/cup20190509.css"/>

    <!-- 先加载BootStrap-->
    <asset:stylesheet src="bootstrap.min.css"/>

    <asset:stylesheet src="application.css"/>

    <!--JS加载-->
    <asset:javascript src="jquery-3.3.1.min.js"/>

    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="bootstrap.js"/>

    <!-- 加载石油大学的设置-->
    <asset:javascript src="cn/edu/cup/common.js"/>
    <asset:javascript src="cn/edu/cup/commonUI20190429.js"/>
    <asset:javascript src="cn/edu/cup/os/homeUI.js"/>

    <g:layoutHead/>
</head>

<body>

<div class="container-fluid bgCup">
    <!--第一行的内容 -->
    <div class="row">
        <div class="col-4">
            <div class="navbar-header logo">
                <ul class="nav list-unstyled">
                    <li>
                        <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main")?.logo}" alt="程序Logo"/>
                    </li>
                    <li>
                        <h1>
                            <span class="text-white">${cn.edu.cup.basic.Caption.findByName("main")?.title}</span>
                        </h1>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-6">
            <g:if test="${session.systemUser}">
                <div id="applicationMenuDiv" class="application-menus"></div>
            </g:if>
            <g:else>
                <div class="application-message">
                    请先登录！
                </div>
            </g:else>
        </div>

        <div class="col-2">
            <ul class="list-unstyled">
                <g:if test="${session.systemUser}">
                    <li class="list-group-item m-0 p-0">
                        当前：${session.userName}
                    </li>
                    <li class="list-group-item m-0 p-0">
                        身份：${session.userTitle}
                    </li>
                    <li class="list-group-item m-0 p-0">
                        <a href="${createLink(uri: '/home/changePasswordUI')}">修改密码</a>
                    </li>
                    <li class="list-group-item m-0 p-0">
                        <a href="${createLink(uri: '/home/logout')}">退出</a>
                    </li>
                </g:if>
                <g:else>
                    <li class="list-group-item m-0 p-0">
                        <a href="${createLink(uri: '/home/loginUI')}">去登录</a>
                    </li>
                </g:else>
            </ul>
        </div>
    </div>


    <!--第3行-->
    <div class="row">
        <g:layoutBody/>
    </div>


    <!--第4行-->
    <div class="row">
        <div class="col-4">
            <div class="application-copyright">
                中国石油大学（北京），Copyright 2019, Ver 0.9
            </div>
        </div>

        <div class="col-4">
            <div class="application-footer">当前环境 ${grails.util.Environment.current}</div>
        </div>

        <div class="col-4">
            <div id="onlineCount" class="application-footer"></div>
        </div>
    </div>

</div>

<!--asset:javascript src="application.js"/-->

</body>
</html>