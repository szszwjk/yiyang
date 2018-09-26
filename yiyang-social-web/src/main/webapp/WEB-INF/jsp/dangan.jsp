<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../css/parentindex.css">

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
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>档案管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>工单管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>投诉管理</span></div>
            <div class="col-md-1 text-center"><a href="/parentservice"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>预警管理</span></a></div>

        </div>
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">老人档案</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="Dlist">家庭医生</a></li>
                <li role="presentation"><a href="#profile1" role="tab" data-toggle="tab" id="Slist">服务商</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px "><div>


        </div>

            <!-- 面板区 -->
            <div class="tab-content">

                <div role="tabpanel" class="tab-pane active" id="home" >
                    <h1> <small>老人档案</small></h1>
                    <table class="table table-condensed table-striped" id="" title="待处理工单">
                        <thead>
                        <tr><th ><input type="checkbox"></th><th>序号</th> <th>姓名</th><th >性别</th><th>年龄</th><th>身份证号</th><th >手机号码</th><th >民族</th><th >婚姻</th><th >健康档案</th><th >操作</th></tr>
                        </thead>
                        <%--var size = ${list.size()};--%>


                        <tr><th ><input type="checkbox"></th><th>   ${list[0].infoId} </th> <th> ${list[0].infoName} </th>
                            <th > ${list[0].infoSex}  </th>
                            <th>   ${ 2018-list[0].infoAge.year-1900}  </th><th>   ${list[0].tParent.pIdnum}  </th><th >   ${list[0].infoTel}  </th>
                            <th >   ${list[0].infoNation}  </th><th >   ${list[0].infoMarriage}  </th><th >  <a href="#" >健康档案</a>  </th><th >  <a href="#">操作</a>  </th></tr>

                    </table>

                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <h1> <small>家庭医生</small></h1>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile1">
                    <h1> <small>服务商</small></h1>
                </div>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/parentindex.js"></script>
</body>
</html>
