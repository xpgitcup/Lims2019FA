$(function(){
    console.info(document.title + "加载了...")
    $.setupPaginationBootStrap();
    setupTabsBootStrap();
})

/*
* 生成附加参数
* */
function appendParamsBootStrap(Team, title) {
    return "";
}

var tabsTitleRightCase = {
    "科研任务.教师": ["我领导的", "我参与的"],
    "科研任务.学生": ["我领导的", "我参与的"],
    "教学任务.教师": ["我的课程"],
    "教学任务.学生": ["我领导的", "我参与的"]
}


/*
* 解散团队
* */
function disband(id) {
    ajaxExecute("operation4Team/disband/" + id)
    location.reload();
}

/*
* 解聘队员
* */
function dismiss(id) {
    var ids = loadAllDisplayTitleId(jsTitleTeam);
    ajaxExecute("operation4Team/dismiss/?person=" + id + "&currentTeam=" + ids[1])
    console.info("解聘：" + id);
    location.reload();
}

function quitTeam(id) {
    ajaxExecute("operation4Team/quitTeam/" + id);
    operation4TeamDiv.tabs("select", "相关队员");
    location.reload();
}

function joinTeam(id) {
    ajaxExecute("operation4Team/joinTeam/" + id)
    selectCurrentItem(id)
    operation4TeamDiv.tabs("select", "队员列表");
    operation4TeamRightDiv.tabs("select", "我参与的")
}

function createTeam(id) {
    console.info("创建团队...");
    selectCurrentItem(id)
    ajaxExecute("operation4Team/createTeam/" + id)
    operation4TeamDiv.tabs("select", "相关团队");
    location.reload();
}

function listTeam(id) {
    selectCurrentItem(id)
    operation4TeamDiv.tabs("select", "相关团队");
}

function selectCurrentItem(id) {
    var title = getCurrentTabTitle(operation4TeamDiv)
    $.cookie("currentKey" + title, id);
}

function listMembers(id) {
    selectCurrentItem(id)
    operation4TeamDiv.tabs("select", "队员列表");
}

/*
* 在这里构建参数
* */
function shiftDisplay(title) {
    console.info("显示当前提示...")
    var key = "currentKey";
    var id;
    var param = ""
    switch (title) {
        case "我领导的":
            break;
        case "可选题目":
            tipsOperation4Team.html("可以创建团队，也可以查看团队！");
            break;
        case "相关团队":
            key += "可选题目";
            id = readCookie(key, 0);
            console.info("当前id:" + key + "=" + id);
            if (id > 0) {
                param = "&currentThing=" + id;
                tipsOperation4Team.html("查看当前任务相关团队：" + id);
            } else {
                tipsOperation4Team.html("请先选择任务！");
            }
            break;
        case "队员列表":
            key += "相关团队";
            id = readCookie(key, 0);
            console.info("当前id:" + key + "=" + id);
            if (id > 0) {
                param = "&currentTeam=" + id;
                tipsOperation4Team.html("查看当前团队：" + id);
            } else {
                tipsOperation4Team.html("请先选择团队！");
            }
            break
    }
    return param
}

/*
* 统计函数
* */
function countTeam(title) {
    console.info(jsTitleTeam + "+统计......");
    var append = shiftDisplay(title);
    var total = ajaxCalculate("operation4Team/count?key=" + title + append);
    return total
}

/*
* 数据加载函数
* */
function loadTeam(title, page, pageSize) {
    console.info(jsTitleTeam + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var append = shiftDisplay(title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4Team/list" + params + "&key=" + title + append, 0, "list" + title + "Div");
}