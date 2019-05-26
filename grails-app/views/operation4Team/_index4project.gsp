<div class="container-fluid">
    <div class="card">
        <ul class="nav navbar">
            <li id="currentCase">${currentCase}</li>
            <li>操作指示：</li>
            <li id="currentTask">${currentTask}</li>
            <li>==></li>
            <li>选择任务</li>
            <li>==></li>
            <li>完成任务</li>
            <li></li>
            <li></li>
            <li class="icon-help">&nbsp&nbsp&nbsp&nbsp：</li>
            <li><a id="tipsOperation4Team"></a></li>
        </ul>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <div class="card">
                <!-- 选项卡 -->
                <ul class="nav nav-tabs" role="tablist" title="科研">
                    <li class="nav-item">
                        <a href="#div可选项目" class="nav-link" data-toggle="tab">
                            可选项目
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#div相关团队" class="nav-link" data-toggle="tab">
                            相关团队
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#div队员列表" class="nav-link" data-toggle="tab">
                            队员列表
                        </a>
                    </li>

                </ul>

                <!-- 具体卡片-->
                <div class="tab-content">
                    <!--具体的可选项目标签-->
                    <div id="div可选项目" class="tab-pane">
                        <div id="display可选项目Div">
                            <br class="panel text-white" id="display可选项目Div">
                            <br> 在这里显示可选项目所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam可选项目"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadFirstPage('可选项目')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadPreviousPage('可选项目')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam可选项目"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam可选项目"></a>
                            </li>
                            <li>
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadNextPage('可选项目')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: pagination4BootStrap.loadLastPage('可选项目')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的可选项目标签结束======-->
                    <!--具体的相关团队标签-->
                    <div id="div相关团队" class="tab-pane">
                        <div id="display相关团队Div">
                            <br class="panel text-white" id="display相关团队Div">
                            <br> 在这里显示相关团队所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam相关团队"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadFirstPage('相关团队')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadPreviousPage('相关团队')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam相关团队"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam相关团队"></a>
                            </li>
                            <li>
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadNextPage('相关团队')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: pagination4BootStrap.loadLastPage('相关团队')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的相关团队标签结束======-->
                    <!--具体的队员列表标签-->
                    <div id="div队员列表" class="tab-pane">
                        <div id="display队员列表Div">
                            <br class="panel text-white" id="display队员列表Div">
                            <br> 在这里显示队员列表所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam队员列表"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadFirstPage('队员列表')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadPreviousPage('队员列表')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam队员列表"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam队员列表"></a>
                            </li>
                            <li>
                                <a class="page-link"
                                   href="javascript: pagination4BootStrap.loadNextPage('队员列表')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: pagination4BootStrap.loadLastPage('队员列表')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的队员列表标签结束======-->
                </div>
            </div>
        </div>

        <div class="col-6">
            <div class="easyui-panel" title="已选：${currentTask}">
                <div id="operation4TeamRightDiv" class="easyui-tabs"></div>
            </div>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>
