function Pagination4BootStrap(controllerName, identifier, defaultPageSize) {
    // 属性定义
    this.defaultPageSize = defaultPageSize;
    this.identifier = identifier;
    this.controllerName = controllerName;

    this.test = function () {
        console.info("这只是一个测试！")
    }

    /*
    * 初始化分页参数
    * */
    this.setupPaginationBootStrap = function () {
        console.info("开始初始化标签对象...");
        // 对每个标签进行操作
        var tabs = $("a.nav-link");
        console.info("获取的对象:");
        console.info(tabs);
        tabs.each(function (e) {
            // 开头的提示
            var title = tabs[e].text.trim();
            console.info("处理：" + identifier + title + "!");
            // 页长度
            var pageSizeName = "pageSize" + this.identifier + title;
            var pageSize = this.defaultPageSize;
            if (localStorage.hasOwnProperty(pageSizeName)) {
                pageSize = parseInt(localStorage.getItem(pageSizeName))
            } else {
                localStorage.setItem(pageSizeName, pageSize);
            }
            $("#" + pageSizeName).html(pageSize);
            // 总页数
            var total = countData(this.identifier, title);
            var totalPageName = "totalPage" + this.identifier + title;
            var totalPage = Math.ceil(total / pageSize)
            $("#" + totalPageName).html(totalPage)
            // 当前页
            var currentPageName = "currentPage" + this.identifier + title;
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
    this.setupTabsBootStrap = function () {
        var currentTabName = "currentTab" + this.identifier;
        // 每个标签绑定数据加载函数---
        $("a.nav-link").on("click", function (e) {
            var title = $(e.target).text().trim();
            console.info("点击事件..." + title + "!")
            localStorage.setItem(currentTabName, title); //记录缺省标签
            this.loadCurrentPage(this.identifier, title)
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
    * 统计记录总数
    * */
    this.countData = function (title) {
        var append = appendParamsBootStrap(this.identifier, title)
        var url = controllerName + "/count?key=" + title + append;
        var total = ajaxCalculate(url);
        return total;
    }

    /*
    * 加载当前页数据
    * */
    this.loadCurrentPage = function (title) {
        var currentPage = getCurrentPage(title)
        this.loadData(title, currentPage);
    }

    /*
    * 获取当前页---从localStorage中获取
    * */
    this.getCurrentPage = function (title) {
        var currentPageName = "currentPage" + this.identifier + title;
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
    * 加载数据
    * */
    this.loadData = function (title, currentPage) {
        var pageSize = getPageSize(title)
        var pageParams = getParams(currentPage, pageSize)
        var append = appendParamsBootStrap(this.identifier, title)
        var url = controllerName + "/list" + pageParams + "&key=" + title + append;
        ajaxRun(url, 0, "display" + title + "Div");
    }


    /*
    * 同时存储到两个地方
    * */

    this.showCurrentPageNumber = function (title) {
        var currentPageName = "currentPage" + this.identifier + title
        $("#" + currentPageName).html(currentPageNumber);
        localStorage.setItem(currentPageName, currentPageNumber);
    }


    /*
    * 获取页码上限
    * */
    this.getTotalPage = function (title) {
        var totalPageName = "totalPage" + this.identifier + title;
        var totalPage = parseInt($("#" + totalPageName).html());
        return totalPage;
    }

    /*
    * 获取页面长度
    * */
    this.getPageSize = function (title) {
        var pageSizeName = "pageSize" + this.identifier + title;
        var pageSize = parseInt(localStorage.getItem(pageSizeName))
        return pageSize
    }


    /*
    * 加载尾页数据
    * */
    this.loadLastPage = function (title) {
        var currentPage = 1;//getCurrentPage(title)
        var totalPageName = "totalPage" + this.identifier + title;
        currentPage = parseInt($("#" + totalPageName).html())
        showCurrentPageNumberBootStrap(title, currentPage);
        loadData(title, currentPage);
    }

    /*
    * 加载首页数据
    * */
    this.loadFirstPage = function (title) {
        var currentPage = 1;//getCurrentPage(title)
        showCurrentPageNumber(title, currentPage);
        loadData(title, currentPage);
    }

    /*
    * 向前翻页
    * */
    this.loadPreviousPage = function (title) {
        var currentPage = getCurrentPage(title)
        currentPage = currentPage - 1;
        if (currentPage < 1) {
            currentPage = 1;
        }
        showCurrentPageNumber(title, currentPage);
        loadData(title, currentPage);
    }

    /*
    * 向后翻页
    * */
    this.loadNextPage = function (title) {
        var currentPage = getCurrentPage(title)
        var totalPage = getTotalPage(title)
        currentPage = currentPage + 1;
        if (currentPage > totalPage) {
            currentPage = totalPage;
        }
        showCurrentPageNumber(title, currentPage);
        loadDataBootStrap(title, currentPage);
    }

}

function appendParamsBootStrap(identifier, title) {
    return "";
}
