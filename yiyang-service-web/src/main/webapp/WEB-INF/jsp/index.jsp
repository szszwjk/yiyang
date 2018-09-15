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
            <div class="col-md-8">.col-md-8</div>
            <div class="col-md-2">.col-md-4</div>
        </div>

    </header>
    <section class="content">



        <div class="col-md-2">
            <div class="tabTip">
                <ul class="nav nav-pills nav-stacked" role="tablist">
                    <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">Home</a></li>
                    <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">Profile</a></li>
                    <li role="presentation"><a href="#messages" role="tab" data-toggle="tab">Messages</a></li>
                    <li role="presentation"><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
                </ul>
            </div>
        </div>

        <div class="col-md-10">


            <div class="tabContent">
                <!-- 面板区 -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <table class="table" id="" title="待处理工单">
                            <thead id="thead">
                            <tr><th ><input type="checkbox"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务状态</th><th >操作</th></tr>
                            </thead>
                            <%--<c:forEach items="${result.roes}" var="item">
                                <tr>
                                    <th ><input type="checkbox"></th>
                                    <td>${item.siId }</td>
                                    <td>${item.siName}</td>
                                    <td>${item.siLarge}</td>
                                    <td>${item.siLittle}</td>
                                    <td>${item.siItem}</td>
                                    <td>${item.siPrice}</td>
                                    <td><a href="#">查看详情</a> <a href="#">预定</a></td>
                                    </tr>
                            </c:forEach>--%>
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">2</div>
                    <div role="tabpanel" class="tab-pane" id="messages">3</div>
                    <div role="tabpanel" class="tab-pane" id="settings">4</div>
                </div>
            </div>
        </div>


    </section>


    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/service.js"></script>
    </body>
</html>
