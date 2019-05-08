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

<div class="container-fluid">
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

<div class="easyui-tabs" id="listLims2019EBDiv">
    <div title="进度" data-options="closeable:false">
        <div id="list进度Div"></div>

        <div id="paginationLims2019EB进度Div" class="easyui-pagination"></div>
    </div>

    <div title="登录" data-options="closeable:false">
        <div id="list登录Div"></div>

        <div id="paginationLims2019EB登录Div" class="easyui-pagination"></div>
    </div>

    <div title="近7天进度" data-options="closeable:false">
        <div id="list近7天进度Div"></div>

        <div id="paginationLims2019EB近7天进度Div" class="easyui-pagination"></div>
    </div>

    <div title="近7天登录" data-options="closeable:false">
        <div id="list近7天登录Div"></div>

        <div id="paginationLims2019EB近7天登录Div" class="easyui-pagination"></div>
    </div>

</div>

</body>

</html>