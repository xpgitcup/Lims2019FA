//全局变量定义
var titleSystemAttribute= "权限维护"
var echartsSystemAttributeDiv;

$(function () {
    console.info(document.title + "加载了...")
    echartsSystemAttributeDiv = echarts.init(document.getElementById('echartsSystemAttributeDiv'));
    // 指定图表的配置项和数据
    var treeData = loadTreeViewDataSystemAttribute();
    console.info(treeData);
    var option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        legend: {
            top: '2%',
            left: '3%',
            orient: 'vertical',
            data: [{name: '权限维护', icon: 'rectangle'}],
            borderColor: '#c23531'
        },
        series: [
            {
                type: 'tree',
                name: '权限维护',
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
    echartsSystemAttributeDiv.setOption(option);
    // 事件处理
    echartsSystemAttributeDiv.on('click', function (params) {
            //console.info(params.name); 节点的名称
            var node = params.value // 附加的属性，很有用的
            //请根据需要替换
            treeNodeSelectedSystemAttribute(node);
        }
    )
})

function loadTreeViewDataSystemAttribute()
{
    var url = "operation4SystemAttribute/getTreeViewData"
    var json = ajaxCall(url)
    console.info(json)
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedSystemAttribute(node) {
    console.info("选择" + node);
    var id
    if (node) {
        var id = node[0];
        ajaxRun("operation4SystemAttribute/show", id, "showSystemAttributeDiv");
        $("#createSystemAttribute").attr('href', 'javascript: createSystemAttribute(' + id + ')');
    }
}

/*
* 新建
* */
function createSystemAttribute(id) {
    console.info("创建SystemAttribute. 上级节点：" + id);
    ajaxRun("operation4SystemAttribute/createSystemAttribute", id, "showSystemAttributeDiv");
}

/*
* 编辑
* */
function editSystemAttribute(id) {
    console.info("编辑SystemAttribute." + id);
    ajaxRun("operation4SystemAttribute/edit", id, "showSystemAttributeDiv");
}

