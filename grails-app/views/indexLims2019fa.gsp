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


            <!-- 选项卡 -->
            <ul class="nav nav-tabs text-center" role="tablist">
                <li class="nav-item active"><a href="#div进展" class="text-white" data-toggle="tab">进展</a></li>
                <li class="nav-item"><a href="#div登录" class="text-white" data-toggle="tab">登录</a></li>
            </ul>

            <!-- 具体卡片-->
            <div class="tab-content">
                <div id="div进展" class="tab-pane active">
                    <div class="panel text-white" role="tabpanel">
                        <br>在这里显示进展所需的信息</br>
                        <br>在这里显示进展所需的信息</br>
                        <br>在这里显示进展所需的信息</br>
                    </div>
                    <ul class="pagination">
                        <li><a>&laquo</a></li>
                        <li>${currentPage进展}</li>
                        <li><a>&raquo</a></li>
                    </ul>
                </div>

                <div id="div登录" class="tab-pane" role="tabpanel">
                    <div class="panel text-white">
                        <br>在这里显示登录所需的信息</br>
                        <br>在这里显示登录所需的信息</br>
                        <br>在这里显示登录所需的信息</br>
                    </div>
                    <ul class="pagination">
                        <li><a>&laquo</a></li>
                        <li>${currentPage登录}</li>
                        <li><a>&raquo</a></li>
                    </ul>
                </div>
            </div>

            <div class="panel panel-default">
            </div>

        </div>
    </div>
</div>

</body>

</html>