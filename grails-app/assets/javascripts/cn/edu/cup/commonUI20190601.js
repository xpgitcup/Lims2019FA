var bootStrapPaginationSetting = {
    identifier: "",
    controller: ""
}

/*
* 初始化分页参数
* */
function setupPaginationBootStrap(tabsDiv) {
    // 对每个标签进行操作
    //var tabs = $("a.nav-link");
    console.info("设置当前Div:");
    console.info(tabsDiv.attr("title"));
    var tabs = tabsDiv.find("a.nav-link");
    tabs.each(function (e) {
        // 开头的提示
        var title = tabs[e].text.trim();
        console.info("处理：" + bootStrapPaginationSetting.identifier + title + "!");
        // 页长度
        var pageSizeName = "pageSize" + bootStrapPaginationSetting.identifier + title;
        var pageSize = 10;
        if (localStorage.hasOwnProperty(pageSizeName)) {
            pageSize = parseInt(localStorage.getItem(pageSizeName))
        } else {
            localStorage.setItem(pageSizeName, pageSize);
        }
        $("#" + pageSizeName).html(pageSize);
        // 总页数
        var total = countDataBootStrap(title);
        var totalPageName = "totalPage" + bootStrapPaginationSetting.identifier + title;
        var totalPage = Math.ceil(total / pageSize)
        $("#" + totalPageName).html(totalPage)
        // 当前页
        var currentPageName = "currentPage" + bootStrapPaginationSetting.identifier + title;
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
function setupTabsBootStrap(tabsDiv) {
    var tabsTitle = tabsDiv.attr("title");
    console.info(tabsTitle);
    var currentTabName = "currentTab" + tabsTitle + bootStrapPaginationSetting.identifier;
    // 每个标签绑定数据加载函数---
    tabsDiv.find("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem(currentTabName, title); //记录缺省标签
        loadCurrentPageBootStrap(title)
    })
    // 处理缺省标签
    if (localStorage.hasOwnProperty(currentTabName)) {
        var title = localStorage.getItem(currentTabName);
        console.info("激活" + title);
        var url = "a.nav-link:contains('" + title + "')"
        var tab = tabsDiv.find(url);
        if (tab != undefined) {
            tab.click()
        } else {
            // 激活第一个
            //$("a.nav-link:first").click()
            tabsDiv.find("a.nav-link:first").click();
        }
    } else {
        // 激活第一个
        //$("a.nav-link:first").click()
        tabsDiv.find("a.nav-link:first").click()
    }

}

/*
* 查找当前标题
* */
function getCurrentTabTitle(tabsDiv) {
    var url = "a.nav-link.active.show"
    var tab = tabsDiv.find(url);
    //console.info(tab);
    //console.info(tab[0].text);
    var title = tab[0].text.trim()
    return title;
}

/*
* 激活指定的标题
* */
function selectTabByTitle(title) {
    var url = "a.nav-link:contains('" + title + "')"
    var tab = $(url)
    if (tab != undefined) {
        tab.click()
    } else {
        // 激活第一个
        $("a.nav-link:first").click()
    }
}

/*
* 加载当前页数据
* */
function loadCurrentPageBootStrap(title) {
    var currentPage = getCurrentPageBootStrap(title)
    loadDataBootStrap(title, currentPage);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPageBootStrap(title) {
    var currentPageName = "currentPage" + bootStrapPaginationSetting.identifier + title;
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
function showCurrentPageNumberBootStrap(title, currentPageNumber) {
    var currentPageName = "currentPage" + bootStrapPaginationSetting.identifier + title
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}


/*
* 获取页码上限
* */
function getTotalPageBootStrap(title) {
    var totalPageName = "totalPage" + bootStrapPaginationSetting.identifier + title;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSizeBootStrap(title) {
    var pageSizeName = "pageSize" + bootStrapPaginationSetting.identifier + title;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载尾页数据
* */
function loadLastPageBootStrap(title) {
    var currentPage = 1;//getCurrentPage(title)
    var totalPageName = "totalPage" + bootStrapPaginationSetting.identifier + title;
    currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumberBootStrap(title, currentPage);
    loadDataBootStrap(title, currentPage);
}

/*
* 加载首页数据
* */
function loadFirstPageBootStrap(title) {
    var currentPage = 1;//getCurrentPage(title)
    showCurrentPageNumberBootStrap(title, currentPage);
    loadDataBootStrap(title, currentPage);
}


/*
* 向前翻页
* */
function loadPreviousPageBootStrap(title) {
    var currentPage = getCurrentPageBootStrap(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumberBootStrap(title, currentPage);
    loadDataBootStrap(title, currentPage);
}

/*
* 向后翻页
* */
function loadNextPageBootStrap(title, currentPage) {
    var currentPage = getCurrentPageBootStrap(title)
    var totalPage = getTotalPageBootStrap(title)
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumberBootStrap(title, currentPage);
    loadDataBootStrap(title, currentPage);
}

function loadDataBootStrap(title, currentPage) {
    var pageSize = getPageSizeBootStrap(title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParamsBootStrap(title)
    var url = bootStrapPaginationSetting.controller + "/list" + pageParams + "&key=" + title + append;
    console.info("列表：" + url);
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataBootStrap(title) {
    var append = appendParamsBootStrap(title)
    var url = bootStrapPaginationSetting.controller + "/count?key=" + title + append;
    //console.info("统计:" + url);
    var total = ajaxCalculate(url);
    return total;
}

function appendParamsBootStrap(title) {
    return "";
}