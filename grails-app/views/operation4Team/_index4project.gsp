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
            <div class="easyui-panel" title="可选：${currentTask}">
                <div id="operation4TeamDiv" class="easyui-tabs"></div>
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
