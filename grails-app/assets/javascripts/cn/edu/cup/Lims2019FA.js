$(function(){
    console.info(document.title + "加载了...")

    loadHomeCurrentPage("进展情况");
})

function getCurrentPage(title) {
    var currentPageName = "currentPageHome" + title
    var currentPage = $("#currentPageHome" + title)
    var currentPageNumber
    if (currentPage) {
        currentPageNumber = currentPage.text()
    } else {
        currentPageNumber = 1;
    }
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
