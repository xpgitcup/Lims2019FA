$(function(){
    console.info(document.title + "加载了...")
    setupTabsHome();
})

function setupTabsHome() {
    // 首先获取各个标签
    var tabs = $("a.nav-link");
    tabs.each(function (e) {
        var tab = tabs[e]
        //tab.click(loadTabData(tab.innerText))
        tab.onclick=loadTabData(tab.innerText)
    })

    // 数据加载函数
    function loadTabData(title) {
        console.info("点击事件...")
        loadHomeCurrentPage(title)
    }
}

function showCurrentPageNumber(title, currentPageNumber) {
    var currentPageName = "showCurrentPageHome" + title
    $("#" + currentPageName).html(currentPageNumber)
    $("#currentPageHome" + title).html(currentPageNumber)
}

function getCurrentPage(title) {
    var currentPage = $("#currentPageHome" + title)
    var currentPageNumber
    if (currentPage != undefined) {
        currentPageNumber = parseInt(currentPage.text())
    } else {
        currentPageNumber = 1;
    }
    return currentPageNumber
}

function loadHomeCurrentPage(title) {
    var currentPage = getCurrentPage(title)
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

function loadHomePreviousPage(title) {
    var currentPage = getCurrentPage(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

function loadHomeNextPage(title, currentPage) {
    var currentPage = getCurrentPage(title)
    if (currentPage) {
        currentPage = currentPage + 1;
    } else {
        currentPage = 1;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

function loadDataHome(title, currentPage) {
    var url = "home/list?key=" + title + "&currentPageHome" + title + "=" + currentPage;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataHome(title) {
    var url = "home/count?key=" + title;
    var total = ajaxCalculate(url);

}
