$(function(){
    console.info(document.title + "加载了...")
    setupTabsHome();
})

function setupTabsHome() {
    // 每个标签绑定数据加载函数
    $("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem("currentTabHome", title); //记录缺省标签
        loadHomeCurrentPage(title)
    })
    // 处理缺省标签
    if (localStorage.hasOwnProperty("currentTabHome")) {
        var title = localStorage.getItem("currentTabHome");
        console.info("激活" + title);
        var url = "a.nav-link:contains('" + title + "')"
        var tab = $(url)
        if (tab != undefined) {
            tab.click()
        } else {
            // 激活第一个
            $("a.nav-link:first").click()
        }
    } else {
        // 激活第一个
        $("a.nav-link:first").click()
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