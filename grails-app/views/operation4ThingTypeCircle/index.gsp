<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<!--meta name="layout" content="main"/-->
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
    <g:set var="entityName" value="ThingTypeCircle"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <div class="card bg-light m-0 p-0">
        <div class="card-header">
            <ul id="operation4ThingTypeCircleUl" class="nav navbar m-0 p-0">
                <li>
                    <g:form controller="operation4ThingTypeCircle" action="save">
                        <label>任务</label>
                        <g:textField name="thingType" value="" id="thingType"/>
                        <label>人员</label>
                        <g:textField name="personTitle" value="" id="personTitle"/>
                        <g:submitButton name="create"/>
                    </g:form>
                </li>
            </ul>
        </div>

        <div class="card-body">
            <!-- 选项卡 -->
            <ul class="nav nav-tabs" role="tablist" title="任务分配">
                <li class="nav-item">
                    <a href="#div任务类型" class="nav-link" data-toggle="tab">
                        任务类型
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#div人员类型" class="nav-link" data-toggle="tab">
                        人员类型
                    </a>
                </li>

            </ul>

            <!-- 具体卡片-->
            <div class="tab-content">
                <!--具体的任务类型标签-->
                <div id="div任务类型" class="tab-pane">
                    <div id="display任务类型Div">
                        <br class="panel text-white" id="display任务类型Div">
                        <br> 在这里显示任务类型所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizeThingTypeCircle任务类型"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingTypeCircleFirstPage('任务类型')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingTypeCirclePreviousPage('任务类型')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPageThingTypeCircle任务类型"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPageThingTypeCircle任务类型"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingTypeCircleNextPage('任务类型')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingTypeCircleLastPage('任务类型')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的任务类型标签结束======-->
                <!--具体的人员类型标签-->
                <div id="div人员类型" class="tab-pane">
                    <div id="display人员类型Div">
                        <br class="panel text-white" id="display人员类型Div">
                        <br> 在这里显示人员类型所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizeThingTypeCircle人员类型"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingTypeCircleFirstPage('人员类型')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingTypeCirclePreviousPage('人员类型')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPageThingTypeCircle人员类型"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPageThingTypeCircle人员类型"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingTypeCircleNextPage('人员类型')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingTypeCircleLastPage('人员类型')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的人员类型标签结束======-->
            </div>
        </div>
    </div>

    <!-- 任务类型，人员类型 -->
    <div class="row">
        <div class="col-6">
            <div class="card">
                <ul id="ztreeThingTypeUl" class="ztree" title="任务类型"></ul>
            </div>
        </div>

        <div class="col-6">
            <div class="card">
                <ul id="ztreePersonTitleUl" class="ztree" title="人员类型"></ul>
            </div>
        </div>
    </div>

</div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>

</body>
</html>
