//全局变量定义
var treeViewSystemMenuDiv;

$(function(){
    console.info(document.title + "加载了...");
    treeViewSystemMenuDiv = $("#treeViewSystemMenuDiv");
    treeViewSystemMenuDiv.treeview({
        data: loadTreeViewDataSystemMenu(),
        collapseIcon: "glyphicon glyphicon-minus"
    });
    //treeViewSystemMenuDiv.treeview('collapseAll',{silent: false});
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