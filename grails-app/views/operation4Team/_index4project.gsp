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
            <div class="card small" id="operation4TeamLeft" title="左边">
                <!-- 选项卡 -->
                <ul class="nav nav-tabs" role="tablist" title="用户服务" id="左边">
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
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('可选项目')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('可选项目')">&laquo</a>
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
                                <a class="page-link" href="javascript: loadNextPageBootStrap('可选项目')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('可选项目')">尾页</a>
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
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('相关团队')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('相关团队')">&laquo</a>
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
                                <a class="page-link" href="javascript: loadNextPageBootStrap('相关团队')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('相关团队')">尾页</a>
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
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('队员列表')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('队员列表')">&laquo</a>
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
                                <a class="page-link" href="javascript: loadNextPageBootStrap('队员列表')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('队员列表')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的队员列表标签结束======-->

                </div>
            </div>
            <!--自动生成的代码结束-->
        </div>

        <div class="col-6">
            <div class="card small" id="operation4TeamRight" title="右边">
                <!-- 选项卡 -->
                <ul class="nav nav-tabs" role="tablist" title="科研服务">
                    <li class="nav-item">
                        <a href="#div我管理的" class="nav-link" data-toggle="tab">
                            我管理的
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#div我领导的" class="nav-link" data-toggle="tab">
                            我领导的
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#div我参与的" class="nav-link" data-toggle="tab">
                            我参与的
                        </a>
                    </li>

                </ul>

                <!-- 具体卡片-->
                <div class="tab-content">
                    <!--具体的我管理的标签-->
                    <div id="div我管理的" class="tab-pane">
                        <div id="display我管理的Div">
                            <br class="panel text-white" id="display我管理的Div">
                            <br> 在这里显示我管理的所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam我管理的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('我管理的')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('我管理的')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam我管理的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam我管理的"></a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadNextPageBootStrap('我管理的')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('我管理的')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的我管理的标签结束======-->
                    <!--具体的我领导的标签-->
                    <div id="div我领导的" class="tab-pane">
                        <div id="display我领导的Div">
                            <br class="panel text-white" id="display我领导的Div">
                            <br> 在这里显示我领导的所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam我领导的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('我领导的')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('我领导的')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam我领导的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam我领导的"></a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadNextPageBootStrap('我领导的')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('我领导的')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的我领导的标签结束======-->
                    <!--具体的我参与的标签-->
                    <div id="div我参与的" class="tab-pane">
                        <div id="display我参与的Div">
                            <br class="panel text-white" id="display我参与的Div">
                            <br> 在这里显示我参与的所需的信息</br>
                        </div>
                        <!-- 这里是分页设置-->
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link">页长</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="pageSizeTeam我参与的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadFirstPageBootStrap('我参与的')">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript: loadPreviousPageBootStrap('我参与的')">&laquo</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="currentPageTeam我参与的"></a>
                            </li>
                            <li class="page-item">
                                <a class="page-link">/</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" id="totalPageTeam我参与的"></a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadNextPageBootStrap('我参与的')">&raquo</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript: loadLastPageBootStrap('我参与的')">尾页</a>
                            </li>
                        </ul>
                    </div>
                    <!--具体的我参与的标签结束======-->

                </div>
            </div>
            <!--自动生成的代码结束-->
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>
