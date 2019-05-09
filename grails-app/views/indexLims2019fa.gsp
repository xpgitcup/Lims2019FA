<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/28
  Time: 13:42
--%>

<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--设置布局模板-->
    <meta name="layout" content="mainCup20190407"/>
    %{--浏览器标签上的标题-kq--}%
    <title>${cn.edu.cup.basic.Caption.findByName("main")?.title}</title>
    %{--浏览器标签上的图标-kq--}%
    <asset:link rel="icon" href="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" type="image/x-ico"/>
    <!-- 设置标题，如果没有特殊情况，标题叫这样了。 -->
    <g:set var="entityName" value="Lims2019FA"/>
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/${entityName}.js"/>
</head>

<body>

<div class="container-fluid m-0 p-0">

    <!--第一行 -->
    <div class="row m-0 p-0">
        <div class="col-12">
            <div align="center">
                <div id="lims2019fa" class="carousel slide" data-ride="carousel">

                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司1')?.logo}"/>
                        </div>

                        <div class="carousel-item">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司2')?.logo}"/>
                        </div>

                        <div class="carousel-item">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司3')?.logo}"/>
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#lims2019fa" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#lims2019fa" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
        </div>
    </div>

    <!--第二行-->
    <div class="flex-row m-0 p-0">
        <div class="col-12">
            <div class="panel panel-default">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">菜鸟教程</a></li>
                    <li><a href="#ios" data-toggle="tab">iOS</a></li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="panel text-white">
                            <p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
                        </div>
                        <ul class="pagination">
                            <li><a href="#">&laquo;</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>

                    <div class="tab-pane fade text-white" id="ios">
                        <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                        TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
                        <ul class="pagination">
                            <li><a href="#">&laquo;</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>