<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>健康检测</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="../css/parentaccount.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="sty">
</head>


<body>
<header>

    <div class="row">
        <div class="col-md-2">.col-md-8</div>
        <div class="col-md-8">
            <div class="col-md-1 text-center"><a href="/"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded">
                <span>首页</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentdetction"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>健康检测</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentcustody"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>健康监护</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentdocument"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>健康档案</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentservice"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>服务预定</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentdoctor"><img src="../img/layout_icon_doctor.jpg" alt="..." class="img-rounded">
                <span>家庭医生</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentaccount"><img src="../img/layout_icon_user.jpg" alt="..." class="img-rounded">
                <span>个人账户</span></a></div>
        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#xt" role="tab" data-toggle="tab" id="xtlist">血糖指标</a></li>
                <li role="presentation"><a href="#xy" role="tab" data-toggle="tab" id="xylist">血氧指标</a></li>
                <li role="presentation"><a href="#xl" role="tab" data-toggle="tab" id="xllist">心率指标</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <form class="form-horizontal" id="betweenTime">
                <div class="form-group">
                    <div class="col-md-1">
                        <button type="button" class="btn btn-info" style="width:100px" id="nearWeek">最近七天</button>
                    </div>
                    <div class="col-md-1" style="margin-left: 10px;">
                        <button type="button" class="btn btn-info" style="width:100px" id="nearMonth">最近三十天</button>
                    </div>

                    <div class="col-md-3" >
                        <div style="float: left;margin-left: 20px"><label for="startTime" class="" style="line-height: 34px">开始时间:</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="startTime" name="startTime">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div style="float: left;"><label for="endTime" class="" style="line-height: 34px">结束时间:</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="endTime" name="endTime">
                        </div>
                    </div>

                    <div class="col-md-3">
                        <button type="button" class="btn btn-info" style="width:70px" id="selectData">查询</button>
                    </div>
                    <div><input class="hidden" id="daItem" name="daItem"></div>



                </div>
            </form>
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="xt">

                    <div id="xtchart" style="width: 100%;height:400px;">

                    </div>

                </div>
                <div role="tabpanel" class="tab-pane" id="xy">
                    <div id="xychart" style="width: 100%;height:400px;">

                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="xl">
                    <div id="xlchart" style="width: 100%;height:400px;">

                    </div>
                </div>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/echart/echarts.min.js"></script>
<script src="../js/laydate/laydate.js"></script>

<script src="../js/parentdetction.js"></script>
<script>
    laydate.render({
        elem: '#startTime'
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#endTime'
        ,type: 'datetime'
    });
</script>
</body>
</html>
