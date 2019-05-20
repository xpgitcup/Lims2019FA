var titleSystemMenu= "菜单维护"
var echartsSystemMenuDiv;

$(function () {
    console.info(document.title + "加载了...")
    echartsSystemMenuDiv = echarts.init(document.getElementById('echartsSystemMenuDiv'));
    // 指定图表的配置项和数据
    var treeData = loadTreeViewDataSystemMenu();
    var option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        legend: {
            top: '2%',
            left: '3%',
            orient: 'vertical',
            data: [{name: '菜单维护', icon: 'rectangle'}],
            borderColor: '#c23531'
        },
        series: [
            {
                type: 'tree',
                name: '菜单维护',
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
    echartsSystemMenuDiv.setOption(option);
    // 事件处理
    echartsSystemMenuDiv.on('click', function (params) {
            //console.info(params.name); 节点的名称
            var node = params.value // 附加的属性，很有用的
            //请根据需要替换
            treeNodeSelectedSystemMenu(node);
        }
    )
})

function loadTreeViewDataSystemMenu()
{
    var url = "operation4SystemMenu/getTreeViewData"
    var json = ajaxCall(url)
    console.info(json)
    return json
}


/*
* 节点选择
* */
function treeNodeSelectedSystemMenu(node) {
    console.info("选择" + node);
    if (node) {
        $("#createSystemMenu").attr('href', 'javascript: createSystemMenu(' + node[0] + ')');
        var id = node[0];
        ajaxRun("operation4SystemMenu/getSystemMenu", id, "showSystemMenuDiv");
    }
}

/*
 * 新建
 * */
function createSystemMenu(id) {
    console.info("创建SystemMenu. 上级节点：" + id);
    ajaxRun("operation4SystemMenu/createSystemMenu", id, "showSystemMenuDiv");
}

/*
 * 编辑
 * */
function editSystemMenu(id) {
    console.info("编辑SystemMenu." + id);
    ajaxRun("operation4SystemMenu/edit", id, "showSystemMenuDiv");
}