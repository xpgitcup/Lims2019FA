var titlePersonTitle= "人员类型维护"
var echartsPersonTitleDiv;

$(function () {
    console.info(document.title + "加载了...")
    echartsPersonTitleDiv = echarts.init(document.getElementById('echartsPersonTitleDiv'));
    // 指定图表的配置项和数据
    var treeData = loadTreeViewDataPersonTitle();
    var option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        legend: {
            top: '2%',
            left: '3%',
            orient: 'vertical',
            data: [{name: '人员类型维护', icon: 'rectangle'}],
            borderColor: '#c23531'
        },
        series: [
            {
                type: 'tree',
                name: '人员类型维护',
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
    echartsPersonTitleDiv.setOption(option);
    // 事件处理
    echartsPersonTitleDiv.on('click', function (params) {
            //console.info(params.name); 节点的名称
            var node = params.value // 附加的属性，很有用的
            //请根据需要替换
            treeNodeSelectedPersonTitle(node);
        }
    )
})

function loadTreeViewDataPersonTitle()
{
    var url = "operation4PersonTitle/getTreeViewData"
    var json = ajaxCall(url)
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedPersonTitle(node) {
    console.info("选择" + node);
    var nodeid = node[0]
    $("#createItem").attr('href', 'javascript: createItem(' + nodeid + ')');
    $("#createItem").html("创建" + nodeid + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + nodeid + ')');
    $("#editItem").html("编辑" + nodeid + '节点');
    $("#deleteItem").attr('href', 'javascript: deleteItem(' + nodeid + ')');
    $("#deleteItem").html("删除" + nodeid + '节点');
    $("#currentTitle").html(node.text);
    showPersonTitle(node);
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4PersonTitle/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

function editItem(id) {
    ajaxRun("operation4PersonTitle/edit", id, "showPersonTitleDiv");
}

/*
* 新建
* */
function createItem(id) {
    ajaxRun("operation4PersonTitle/create?upTitle=" + id, 0, "showPersonTitleDiv");
}

function createPersonTitle(id) {
    console.info("创建PersonTitle. 上级节点：" + id);
    ajaxRun("operation4PersonTitle/createPersonTitle", id, "showPersonTitleDiv");
}

/*
* 编辑
* */
function editPersonTitle(id) {
    console.info("编辑PersonTitle." + id);
    ajaxRun("operation4PersonTitle/editPersonTitle", id, "showPersonTitleDiv");
}

/*
* 显示节点信息
* */
function showPersonTitle(node) {
    if (node) {
        var id = node[0];
        ajaxRun("operation4PersonTitle/show", id, "showPersonTitleDiv");
    }
}

/*
* 统计函数
* */
function countPersonTitle(title) {
    console.info(jsTitle + "+统计......");
    var total = ajaxCalculate("operation4PersonTitle/count?key=" + title);
    return total
}

/*
* 数据加载函数
* */
function loadPersonTitle(title, page, pageSize) {
    console.info(jsTitle + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4PersonTitle/list" + params + "&key=" + title, 0, "list" + title + "Div");
}