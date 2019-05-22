//全局变量定义
var titleThingType = "通用计划"
var echartsThingTypeDiv;
var titlePlan = "通用计划"

$(function () {
    console.info(document.title + "加载了...")
    echartsThingTypeDiv = echarts.init(document.getElementById('echartsThingTypeDiv'));
    // 指定图表的配置项和数据
    var treeData = loadTreeViewDataThingType();
    var option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove',
            formatter: "{b}: {c}"
        },
        legend: {
            top: '2%',
            left: '3%',
            orient: 'vertical',
            data: [{name: '通用计划', icon: 'rectangle'}],
            borderColor: '#c23531'
        },
        series: [
            {
                type: 'tree',
                name: '通用计划',
                data: [treeData],
                top: '5%',
                left: '7%',
                bottom: '2%',
                right: '60%',
                symbolSize: 17,
                label: {
                    normal: {
                        position: 'left',
                        verticalAlign: 'middle',
                        align: 'right'
                    }
                },
                // 叶子设置
                leaves: {
                    label: {
                        normal: {
                            position: 'right',
                            verticalAlign: 'middle',
                            align: 'left'
                        }
                    }
                },

                expandAndCollapse: true,
                animationDuration: 550,
                animationDurationUpdate: 750
            }
        ]
    }
    // 使用刚指定的配置项和数据显示图表。
    echartsThingTypeDiv.setOption(option);
    // 事件处理
    echartsThingTypeDiv.on('click', function (params) {
            //console.info(params.name); 节点的名称
            var node = {
                name: params.name,
                id: params.value[0]
            } // 附加的属性，很有用的
            //请根据需要替换
            treeNodeSelectedThingType(node);
        }
    )

    setupPaginationPlan();
    loadPlanCurrentPage();

})

function loadTreeViewDataThingType() {
    var url = "operation4ThingType/getTreeViewData"
    var json = ajaxCall(url)
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedThingType(data) {
    var node = data.id
    var name = data.name
    console.info("选择" + node);
    $("#createItem").attr('href', 'javascript: createItemAuto(' + node + ')');
    $("#createItem").html("自动创建" + node + '的计划');
    $("#editItem").attr('href', 'javascript: editItem(' + node + ')');
    $("#editItem").html("编辑" + node + '计划');
    $("#currentTitle").html(name);

    sessionStorage.setItem("currentThingTypeId" + document.title, node);

    var localPageSizePlan = readLocalStorage("pageSize" + document.title, 10);
    var cPageNumber = readStorage("currentPage" + document.title, 1);
    var total = countPlan(document.title)
    loadPlan(document.title, cPageNumber, localPageSizePlan);
    paginationPlanDiv.pagination({total: total});
}

/*
* 统计函数
* */
function countPlan(title) {
    console.info(document.title + "+统计......");
    var append = setupAppendParamsPlan();
    var url = "operation4Plan/count?key=" + title + append
    console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    return total
}

/*
* 数据加载函数
* */
function loadPlan(title, page, pageSize) {
    console.info("数据加载：" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsPlan();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "operation4Plan/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsPlan() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    currentThingTypeId = readStorage("currentThingTypeId" + document.title, 1);
    var append = "&thingType=" + currentThingTypeId;
    return append;
}

function deleteItem(id) {
    ajaxExecuteWithMethod("operation4Plan/delete?id=" + id, 'DELETE');
    location.reload();
}

function editItem(id) {
    console.info("编辑计划...");
    ajaxRun("operation4Plan/edit?thingTypeId=" + id +
        "&view=editTypePlan",
        0, "operation4PlanDiv");
}

function showItem(id) {
    ajaxRun("operation4Plan/show?view=showTypePlan", id, "operation4PlanItemDiv");
}

function createItemAuto(id) {
    console.info("创建计划...");
    ajaxExecute("operation4Plan/createAuto?thingTypeId=" + id);
    location.reload();
}

function createItem(id) {
    console.info("创建计划...");
    ajaxRun("operation4Plan/create?thingTypeId=" + id +
        "&view=createTypePlan",
        0, "operation4PlanDiv");
}

function createPlanItem(id) {
    console.info("创建计划...");
    ajaxRun("operation4Plan/create?thingTypeId=" + id + "&view=createTypePlan",
        0, "operation4PlanDiv");
}


/*
* 初始化分页参数
* */
function setupPaginationPlan () {
    console.info("处理：" + titlePlan + "!");
    // 当前页
    var currentPageName = "currentPagePlan" + titlePlan;
    var currentPage = 1;
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPage = parseInt(localStorage.getItem(currentPageName));
    }
    $("#" + currentPageName).html(currentPage);
    // 页长度
    var pageSizeName = "pageSizePlan" + titlePlan;
    var pageSize = 10;
    if (localStorage.hasOwnProperty(pageSizeName)) {
        pageSize = parseInt(localStorage.getItem(pageSizeName))
    } else {
        localStorage.setItem(pageSizeName, pageSize);
    }
    $("#" + pageSizeName).html(pageSize);
    // 总页数
    var total = countDataPlan();
    var totalPageName = "totalPagePlan" + titlePlan;
    var totalPage =  Math.ceil(total/pageSize)
    $("#" + totalPageName).html(totalPage)
}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumber(currentPageNumber) {
    var currentPageName = "currentPagePlan" + titlePlan
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage() {
    var currentPageName ="currentPagePlan" + titlePlan;
    var currentPageNumber
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPageNumber = parseInt(localStorage.getItem(currentPageName))
    } else {
        currentPageNumber = 1
        localStorage.setItem(currentPageName, currentPageNumber)
    }
    return currentPageNumber
}

/*
* 获取页码上限
* */
function getTotalPage() {
    var totalPageName = "totalPagePlan" + titlePlan;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize() {
    var pageSizeName = "pageSizePlan" + titlePlan;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载末页数据
* */
function loadPlanLastPage() {
    var totalPageName = "totalPagePlan" + titlePlan;
    var currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(currentPage);
    loadDataPlan(currentPage);
}

/*
* 加载首页数据
* */
function loadPlanFirstPage() {
    var currentPage = 1
    showCurrentPageNumber(currentPage);
    loadDataPlan(currentPage);
}

/*
* 加载当前页数据
* */
function loadPlanCurrentPage() {
    var currentPage = getCurrentPage()
    loadDataPlan(currentPage);
}

/*
* 向前翻页
* */
function loadPlanPreviousPage() {
    var currentPage = getCurrentPage()
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(currentPage);
    loadDataPlan(currentPage);
}

/*
* 向后翻页
* */
function loadPlanNextPage() {
    var currentPage = getCurrentPage()
    var totalPage = getTotalPage()
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(currentPage);
    loadDataPlan(currentPage);
}

function loadDataPlan(currentPage) {
    var pageSize = getPageSize()
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams()
    var url = "operation4Plan/list" + pageParams + "&key=" + titlePlan + append;
    ajaxRun(url, 0, "display" + titlePlan + "Div");
}

function countDataPlan() {
    var append = appendParams()
    var url = "operation4Plan/count?key=" + titlePlan + append;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams() {
    return "";
}