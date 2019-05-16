<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/3
  Time: 14:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainCup20190407"/>
    <g:set var="entityName" value="Home"/>
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/os/${entityName}.js"/>
</head>

<body>

<div align="center" class="container-fluid">
    <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.logo}"/>
</div>

<div class="container-fluid">

    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a href="#div我的科研" class="nav-link active" data-toggle="tab">
                我的科研
            </a>
        </li>
        <li class="nav-item">
            <a href="#div我的教学" class="nav-link" data-toggle="tab">
                我的教学
            </a>
        </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的每个标签-->
        <div id="div我的科研" class="tab-pane active">
            <div id="display我的科研Div">
                <br class="panel text-white" id="display我的科研Div">
                <br> 在这里显示我的科研所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('我的科研')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="showCurrentPageHome我的科研"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('我的科研')">&raquo</a>
                </li>
            </ul>
        </div>
        <!--具体的我的教学标签-->
        <div id="div我的教学" class="tab-pane">
            <div id="display我的教学Div">
                <br class="panel text-white" id="display我的教学Div">
                <br> 在这里显示我的教学所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('我的教学')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="showCurrentPageHome我的教学"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('我的教学')">&raquo</a>
                </li>
            </ul>
        </div>

    </div>

</div>

</body>
</html>