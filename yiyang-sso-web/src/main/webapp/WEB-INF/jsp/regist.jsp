<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/14
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../css/regist.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="sty">
</head>

<body>
<header id="header">
    <div class="container">
        <div class="row ">
            <div class="col-md-2 bord"><img src="../img/8-01_2568.jpg" alt="..." class="img-responsive myimg"></div>
            <div class="col-md-8 bord">
                <nav class="navbar navbar-itcast navbar-static-top" data-spy="affix" data-offset-top="260" data-offset-bottom="200">
                    <div class="container">
                        <div id="nav_list" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav ">
                                <li class="active"><a href="#">首页</a></li>
                                <li><a href="#">健康教育</a></li>
                                <li><a href="#">平台介绍</a></li>
                                <li><a href="#">视频资料</a></li>
                                <li><a href="#">最新动态</a></li>
                                <li><a href="#">联系我们</a></li>
                            </ul>

                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-md-2 bord"></div>
        </div>
    </div>
</header>
<section class="">
    <div class="center-block formsize">
        <form class="center-block" id="registerform">
            <div class="form-group" id="usergroup" >
                <label for="username">用户名 </label><span class="pull-right" id="sp1"></span>
                <input type="text" class="form-control" id="username" name="username" placeholder="请输入6-16位用户名">
            </div>
            <div class="form-group" id="telgroup">
                <label for="telnumber">电话</label><span class="pull-right" id="sp2"></span>
                <input type="text" class="form-control" id="telnumber" name="telnumber" placeholder="">
            </div>

            <div class="form-group" id="passgroup">
                <label for="password">密码</label><span class="pull-right" id="sp3"></span>
                <input type="password" class="form-control" id="password" name="password"  placeholder="密码由8-18位数字字母组合">
            </div>
            <div class="form-group" id="repassgroup">
                <label for="repassword">确认密码</label><span class="pull-right" id="sp4"></span>
                <input type="password" class="form-control" id="repassword" placeholder="">
            </div>
            <div class="form-group">
                <label for="authority">请选择角色</label>
                <select class="form-control" id="authority" name="authorityGroup">
                    <option value="parent">老人</option>
                    <option value="doctor">医生</option>
                    <option value="service">服务商</option>
                    <option value="relation">亲人</option>
                    <option value="cadmin">社区管理员</option>

                </select>
            </div>


            <button type="button" class="btn btn-info mybtn" onclick="register()">注册</button>
        </form>
    </div>
</section>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/regist.js"></script>
<script type="text/javascript">
    var redirectUrl ='${redirectUrl}';
</script>
</body>
</html>
