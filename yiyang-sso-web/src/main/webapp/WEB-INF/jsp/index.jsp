<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../css/main.css">

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
            <div class="col-md-2 bord">1。。。。。。。。。。。</div>
            <div class="col-md-8 bord">2。。。。。。。。。。。</div>
            <div class="col-md-2 bord">3。。。。。。。。。。。</div>
        </div>
    </div>
</header>

<section id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-8 bord"><img src="../img/bg1.jpg" alt="..." class="img-rounded "></div>
            <div class="col-md-4 bord ">
                <form class="myform" method="post" action="/login" id="logform">
                    <div class="form-group" id="user">
                        <label for="inputusername">用户名</label>
                        <input type="text" class="form-control" id="inputusername" name="username" placeholder="" aria-describedby="inputError2Status">

                    </div>
                    <div class="form-group" id="pass">
                        <label for="inputpassword">密码</label>
                        <input type="password" class="form-control" id="inputpassword" name="password" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="sec1">选择用户</label>
                        <select class="form-control" name="authority" id="sec1">
                            <option value="parent">老人</option>
                            <option value="doctor">医生</option>
                            <option value="service">服务商</option>
                            <option value="relation">亲人</option>
                            <option value="comadmin">社区管理员</option>
                        </select>
                    </div>


                    <div class="checkbox">
                        <label>
                            <input type="checkbox">记住密码
                        </label>
                    </div>

                    <button type="button" class="btn btn-info mybtn" onclick="onSubmitfun()">登录</button>
                </form>
            </div>

        </div>
    </div>
</section>
<footer></footer>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
    var redirectUrl ='${redirectUrl}';
</script>

</body>
</html>
