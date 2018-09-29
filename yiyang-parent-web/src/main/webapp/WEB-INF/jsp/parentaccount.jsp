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
    <title>首页</title>

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
            <div class="col-md-1 text-center"><a href=""><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>健康监护</span></a></div>
            <div class="col-md-1 text-center"><a href=""><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>健康档案</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentservice"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>服务预定</span></a></div>
            <div class="col-md-1 text-center"><a href=""><img src="../img/layout_icon_doctor.jpg" alt="..." class="img-rounded">
                <span>家庭医生</span></a></div>
            <div class="col-md-1 text-center"><a href="/parent/parentaccount"><img src="../img/layout_icon_user.jpg" alt="..." class="img-rounded">
                <span>个人账户</span></a></div>
        </div>
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">账户信息</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active pre-scrollable" id="home">
                    <table class="table">
                        <col style="width: 15%" />
                        <col style="width: 35%" />
                        <col style="width: 10%" />
                        <col style="width: 40%" />
                        <tr><td class="text-right">订单编号:</td><td> <input type="text" class="form-control" readonly id="hpsNumber" ></td><td class="text-right">客户姓名:</td><td><div ><input type="text" class="form-control" readonly id="hpsUname"></div></td></tr>
                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" readonly id="hsName"></td><td class="text-right">服务项目:</td><td><div ><input type="text" class="form-control" id="hpsItem" readonly></div></td></tr>
                        <tr><td class="text-right">下单时间:</td><td> <input type="text" class="form-control" readonly id="hpsTime"></td><td class="text-right">服务时间:</td><td><div ><input type="text" class="form-control" readonly id="hpsTotime" ></div></td></tr>
                        <tr><td class="text-right">服务地址:</td><td colspan="3"> <input type="text" class="form-control" readonly id="hpsAddres"></td></tr>
                        <tr><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" readonly id="hsiPrice"></td><td class="text-right">服务总价:</td><td><div ><input type="text" class="form-control" readonly id="hpsPrice" ></div></td></tr>
                        <tr><td class="text-right">服务要求:</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;"  readonly id="hpsDesc"></textarea></div></td></tr>
                        <tr><td class="text-right">服务人员:</td><td> <input type="text" class="form-control" readonly id="hinfoName"></td><td class="text-right">商家电话:</td><td><div ><input type="text" class="form-control" readonly id="hinfoTel" ></div></td></tr>
                        <tr><td class="text-right">订单状态:</td><td> <input type="text" class="form-control" readonly id="hpsFlag"></td><td class="text-right"></td><td></td></tr>
                        <tr><td class="text-right">订单编号:</td><td> <input type="text" class="form-control" readonly id="hpsNumber" ></td><td class="text-right">客户姓名:</td><td><div ><input type="text" class="form-control" readonly id="hpsUname"></div></td></tr>
                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" readonly id="hsName"></td><td class="text-right">服务项目:</td><td><div ><input type="text" class="form-control" id="hpsItem" readonly></div></td></tr>
                        <tr><td class="text-right">下单时间:</td><td> <input type="text" class="form-control" readonly id="hpsTime"></td><td class="text-right">服务时间:</td><td><div ><input type="text" class="form-control" readonly id="hpsTotime" ></div></td></tr>
                        <tr><td class="text-right">服务地址:</td><td colspan="3"> <input type="text" class="form-control" readonly id="hpsAddres"></td></tr>
                        <tr><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" readonly id="hsiPrice"></td><td class="text-right">服务总价:</td><td><div ><input type="text" class="form-control" readonly id="hpsPrice" ></div></td></tr>
                        <tr><td class="text-right">服务要求:</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;"  readonly id="hpsDesc"></textarea></div></td></tr>
                        <tr><td class="text-right">服务人员:</td><td> <input type="text" class="form-control" readonly id="hinfoName"></td><td class="text-right">商家电话:</td><td><div ><input type="text" class="form-control" readonly id="hinfoTel" ></div></td></tr>
                        <tr><td class="text-right">订单状态:</td><td> <input type="text" class="form-control" readonly id="hpsFlag"></td><td class="text-right"></td><td></td></tr>
                        <tr><td class="text-right">订单编号:</td><td> <input type="text" class="form-control" readonly id="hpsNumber" ></td><td class="text-right">客户姓名:</td><td><div ><input type="text" class="form-control" readonly id="hpsUname"></div></td></tr>
                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" readonly id="hsName"></td><td class="text-right">服务项目:</td><td><div ><input type="text" class="form-control" id="hpsItem" readonly></div></td></tr>
                        <tr><td class="text-right">下单时间:</td><td> <input type="text" class="form-control" readonly id="hpsTime"></td><td class="text-right">服务时间:</td><td><div ><input type="text" class="form-control" readonly id="hpsTotime" ></div></td></tr>
                        <tr><td class="text-right">服务地址:</td><td colspan="3"> <input type="text" class="form-control" readonly id="hpsAddres"></td></tr>
                        <tr><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" readonly id="hsiPrice"></td><td class="text-right">服务总价:</td><td><div ><input type="text" class="form-control" readonly id="hpsPrice" ></div></td></tr>
                        <tr><td class="text-right">服务要求:</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;"  readonly id="hpsDesc"></textarea></div></td></tr>
                        <tr><td class="text-right">服务人员:</td><td> <input type="text" class="form-control" readonly id="hinfoName"></td><td class="text-right">商家电话:</td><td><div ><input type="text" class="form-control" readonly id="hinfoTel" ></div></td></tr>
                        <tr><td class="text-right">订单状态:</td><td> <input type="text" class="form-control" readonly id="hpsFlag"></td><td class="text-right"></td><td></td></tr>
                        <tr><td class="text-right">订单编号:</td><td> <input type="text" class="form-control" readonly id="hpsNumber" ></td><td class="text-right">客户姓名:</td><td><div ><input type="text" class="form-control" readonly id="hpsUname"></div></td></tr>
                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" readonly id="hsName"></td><td class="text-right">服务项目:</td><td><div ><input type="text" class="form-control" id="hpsItem" readonly></div></td></tr>
                        <tr><td class="text-right">下单时间:</td><td> <input type="text" class="form-control" readonly id="hpsTime"></td><td class="text-right">服务时间:</td><td><div ><input type="text" class="form-control" readonly id="hpsTotime" ></div></td></tr>
                        <tr><td class="text-right">服务地址:</td><td colspan="3"> <input type="text" class="form-control" readonly id="hpsAddres"></td></tr>
                        <tr><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" readonly id="hsiPrice"></td><td class="text-right">服务总价:</td><td><div ><input type="text" class="form-control" readonly id="hpsPrice" ></div></td></tr>
                        <tr><td class="text-right">服务要求:</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;"  readonly id="hpsDesc"></textarea></div></td></tr>
                        <tr><td class="text-right">服务人员:</td><td> <input type="text" class="form-control" readonly id="hinfoName"></td><td class="text-right">商家电话:</td><td><div ><input type="text" class="form-control" readonly id="hinfoTel" ></div></td></tr>
                        <tr><td class="text-right">订单状态:</td><td> <input type="text" class="form-control" readonly id="hpsFlag"></td><td class="text-right"></td><td></td></tr>

                    </table>

                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    2
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
