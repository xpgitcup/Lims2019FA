/*
* 初始化分页参数
* */
function setupPaginationBootStrap(identifier) {
    // 对每个标签进行操作
    var tabs = $("a.nav-link");
    tabs.each(function (e) {
        // 开头的提示
        var title = tabs[e].text.trim();
        console.info("处理：" + identifier + title + "!");
        // 页长度
        var pageSizeName = "pageSize" + identifier + title;
        var pageSize = 10;
        if (localStorage.hasOwnProperty(pageSizeName)) {
            pageSize = parseInt(localStorage.getItem(pageSizeName))
        } else {
            localStorage.setItem(pageSizeName, pageSize);
        }
        $("#" + pageSizeName).html(pageSize);
        // 总页数
        var total = countData(identifier, title);
        var totalPageName = "totalPage" + identifier + title;
        var totalPage = Math.ceil(total / pageSize)
        $("#" + totalPageName).html(totalPage)
        // 当前页
        var currentPageName = "currentPage" + identifier + title;
        var currentPage = 1;
        if (localStorage.hasOwnProperty(currentPageName)) {
            currentPage = parseInt(localStorage.getItem(currentPageName));
        }
        // 如果当前页大于总页数，跳到开头
        if (currentPage > totalPage) {
            currentPage = 1
        }
        $("#" + currentPageName).html(currentPage);
    })

}

/*
* 设置标签页的--事件处理
* */
function setupTabsBootStrap(identifier, loadDataFunctionName, countDataFunctionName) {
    var currentTabName = "currentTab" + identifier;
    // 每个标签绑定数据加载函数---
    $("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem(currentTabName, title); //记录缺省标签
        loadCurrentPageBootStrap(identifier, title)
    })
    // 处理缺省标签
    if (localStorage.hasOwnProperty(currentTabName)) {
        var title = localStorage.getItem(currentTabName);
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

/*
* 加载当前页数据
* */
function loadCurrentPageBootStrap(identifier, title) {
    var currentPage = getCurrentPageBootStrap(identifier, title)
    loadDataBootStrap(identifier, title, currentPage);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPageBootStrap(identifier, title) {
    var currentPageName = "currentPage" + identifier + title;
    var currentPageNumber
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPageNumber = parseInt(localStorage.getItem(currentPageName))
    } else {
        currentPageNumber = 1
        localStorage.setItem(currentPageName, currentPageNumber)
    }
    return currentPageNumber
}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumberBootStrap(identifier, title, currentPageNumber) {
    var currentPageName = "currentPage" + identifier + title
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}


/*
* 获取页码上限
* */
function getTotalPageBootStrap(identifier, title) {
    var totalPageName = "totalPage" + identifier + title;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSizeBootStrap(identifier, title) {
    var pageSizeName = "pageSize" + identifier + title;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载尾页数据
* */
function loadLastPageBootStrap(identifier, title) {
    var currentPage = 1;//getCurrentPage(title)
    var totalPageName = "totalPage" + identifier + title;
    currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumberBootStrap(title, currentPage);
    loadDataBootStrap(title, currentPage);
}

/*
* 加载首页数据
* */
function loadFirstPageBootStrap(identifier, title) {
    var currentPage = 1;//getCurrentPage(title)
    showCurrentPageNumberBootStrap(identifier, title, currentPage);
    loadDataBootStrap(title, currentPage);
}


/*
* 向前翻页
* */
function loadPreviousPageBootStrap(identifier, title) {
    var currentPage = getCurrentPageBootStrap(identifier, title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumberBootStrap(identifier, title, currentPage);
    loadDataBootStrap(identifier, title, currentPage);
}

/*
* 向后翻页
* */
function loadNextPageBootStrap(identifier, title, currentPage) {
    var currentPage = getCurrentPageBootStrap(identifier, title)
    var totalPage = getTotalPageBootStrap(identifier, title)
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumberBootStrap(identifier, title, currentPage);
    loadDataBootStrap(identifier, title, currentPage);
}

function loadDataBootStrap(identifier, title, currentPage) {
    var pageSize = getPageSizeBootStrap(identifier, title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParamsBootStrap(title)
    var url = "home/list" + pageParams + "&key=" + title + append;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataBootStrap(identifier, title) {
    var url = "home/count?key=" + title;
    var total = ajaxCalculate(url);
    return total;
}

function appendParamsBootStrap(identifier, title) {
    return "";
}