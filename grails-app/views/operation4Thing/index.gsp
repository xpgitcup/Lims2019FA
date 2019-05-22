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
    <g:set var="entityName" value="Thing"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <div class="card">
        <div class="card-header m-0 p-0">
            <ul id="operation4ThingUl" class="nav navbar bg-light">
                <li>
                    <a id="currentTemplate" href="">下载模板</a>
                </li>
                <li><a>||</a></li>
                <li><a id="currentImport">导入数据</a></li>
                <li>
                    <g:uploadForm method="post" action="importFromFile">
                        <ul>
                            <li>
                                <input type="file" name="uploadedFile"/>
                            </li>
                            <li>
                                <input type="hidden" name="key" value="" id="importKey"/>
                            </li>
                            <!--li>
                                <input type="checkbox" name="autoUpdateType" checked="checked"/>
                                <label>自动更新分类</label>
                            </li-->
                            <li>
                                <input type="submit" value="ok">
                            </li>
                        </ul>
                    </g:uploadForm>
                </li>
                <li><a>||</a></li>
                <li><a id="createItem" href=""></a></li>
            </ul>
        </div>

        <div class="card-body">
            <!-- 选项卡 -->
            <ul class="nav nav-tabs" role="tablist" title="项目数据">
                <li class="nav-item">
                    <a href="#div科研" class="nav-link" data-toggle="tab">
                        科研
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#div教学" class="nav-link" data-toggle="tab">
                        教学
                    </a>
                </li>

            </ul>

            <!-- 具体卡片-->
            <div class="tab-content">
                <!--具体的科研标签-->
                <div id="div科研" class="tab-pane">
                    <div id="display科研Div">
                        <br class="panel text-white" id="display科研Div">
                        <br> 在这里显示科研所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizeThing科研"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingFirstPage('科研')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingPreviousPage('科研')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPageThing科研"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPageThing科研"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingNextPage('科研')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingLastPage('科研')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的科研标签结束======-->
                <!--具体的教学标签-->
                <div id="div教学" class="tab-pane">
                    <div id="display教学Div">
                        <br class="panel text-white" id="display教学Div">
                        <br> 在这里显示教学所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizeThing教学"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingFirstPage('教学')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadThingPreviousPage('教学')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPageThing教学"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPageThing教学"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingNextPage('教学')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadThingLastPage('教学')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的教学标签结束======-->
            </div>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>

</body>
</html>
