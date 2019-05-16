$(function(){
    console.info(document.title + "加载了...")

    loadHomeCurrentPage("当前进度");
    loadHomeCurrentPage("登录信息");
})

function getCurrentPage(title) {
    var currentPageName = "showCurrentPageHome" + title
    var currentPage = $("#currentPageHome" + title)
    console.info("当前页数据?" + currentPage[0] + " " + currentPage[1]);
    var currentPageNumber
    if (currentPage[0] != undefined) {
        currentPageNumber = currentPage.text()
    } else {
        currentPageNumber = 1;
    }
    $("#"+currentPageName).html(currentPageNumber)
    return currentPageNumber
}

function loadHomeCurrentPage(title) {
    var currentPage = getCurrentPage(title)
    loadDataHome(title, currentPage);
}

function loadHomePreviousPage(title) {
    var currentPage = getCurrentPage(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    } else {
        currentPage = 1;
    }
    loadDataHome(title, currentPage);
}

function loadHomeNextPage(title, currentPage) {
    var currentPageName = "currentPageHome" + title
    var currentPage = $("#currentPageHome" + title)
    if (currentPage) {
        currentPage = currentPage + 1;
    } else {
        currentPage = 1;
    }
    loadDataHome(title, currentPage);
}

function loadDataHome(title, currentPage) {
    var url = "home/list?key=" + title + "&currentPageHome" + title + "=" + currentPage;
    ajaxRun(url, 0, "display" + title + "Div");
}