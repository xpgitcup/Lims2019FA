//全局变量定义
var title1 = "1"
var echarts1Div;

$(function(){
    console.info(document.title + "加载了...")
    echarts1Div = echarts.init(document.getElementById('echarts1Div'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    echarts1Div.setOption(option);
})

function loadTreeViewDataSystemMenu() {
    var url="operation4SystemMenu/getTreeViewData"
    var json = ajaxCall(url)
    //console.info(json)
    return json
}


/*
* 节点选择
* */
function treeNodeSelectedSystemMenu(node) {
    console.info("选择" + node);
    if (node) {
        $("#createSystemMenu").attr('href', 'javascript: createSystemMenu(' + node.attributes[0] + ')');
        var id = node.attributes[0];
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