var titleThingType= "项目类型维护"
var echartsThingTypeDiv;

$(function () {
    console.info(document.title + "加载了...")
    echartsThingTypeDiv = echarts.init(document.getElementById('echartsThingTypeDiv'));
    // 指定图表的配置项和数据
    var treeData = loadTreeViewDataThingType();
    var option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        legend: {
            top: '2%',
            left: '3%',
            orient: 'vertical',
            data: [{name: '项目类型维护', icon: 'rectangle'}],
            borderColor: '#c23531'
        },
        series: [
            {
                type: 'tree',
                name: '项目类型维护',
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
})

function loadTreeViewDataThingType()
{
    var url = "operation4ThingType/getTreeViewData"
    var json = ajaxCall(url)
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedThingType(nodeData) {
    var node = nodeData.id
    var name = nodeData.name
    console.info("选择" + node);
    $("#createItem").attr('href', 'javascript: createItem(' + node + ')');
    $("#createItem").html("创建" + node + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node + ')');
    $("#editItem").html("编辑" + node + '节点');
    $("#currentTitle").html(name);
    showThingType(nodeData);
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4ThingType/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

function editItem(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    ajaxRun("operation4ThingType/edit", id, "showThingTypeDiv");
}

function createItem(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/create?upType=" + id, 0, "showThingTypeDiv");
}

function createProject(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/createProject", id, "showThingTypeDiv");
}

function createCourse(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/createCourse", id, "showThingTypeDiv");
}

/*
* 显示节点信息
* */
function showThingType(node) {
    if (node) {
        var id = node.id;
        ajaxRun("operation4ThingType/show", id, "showThingTypeDiv");
    }
}
