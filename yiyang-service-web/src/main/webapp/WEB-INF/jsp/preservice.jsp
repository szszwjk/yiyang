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
    <title>工单管理</title>

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
            <div class="col-md-1 text-center"><a href="/index"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded" >
                <span>首页</span></a></div>
            <div class="col-md-1 text-center"><a href="/serviceinfo"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>信息管理</span></a></div>
            <div class="col-md-1 text-center"><a href="/serviceitem"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span> 服务项目</span></a></div>
            <div class="col-md-1 text-center"><a href="/preservice"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>工单管理</span></a></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>评价管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_doctor.jpg" alt="..." class="img-rounded">
                <span>投诉管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_user.jpg" alt="..." class="img-rounded">
                <span>订单流水</span></div>
        </div>
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="dcllist">待处理工单</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="yjslist">已接收工单</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="ywclist">已完成工单</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="psUname1" class="" style="line-height: 34px">老人姓名</label></div>
                                <div class="myselect">
                                    <input  type="text" class="form-control" id="psUname1">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="psTelnumber1" class="" style="line-height: 34px">电话号码</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="psTelnumber1">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info" style="width:70px" id="selectdcllist">查询</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="psUname2" class="" style="line-height: 34px">老人姓名</label></div>
                                <div class="myselect">
                                    <input  type="text" class="form-control" id="psUname2">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="psTelnumber2" class="" style="line-height: 34px">电话号码</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="psTelnumber2">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info" style="width:70px" id="selectyjdlist">查询</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="message">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="psUname3" class="" style="line-height: 34px">老人姓名</label></div>
                                <div class="myselect">
                                    <input  type="text" class="form-control" id="psUname3">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="psTelnumber3" class="" style="line-height: 34px">电话号码</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="psTelnumber3">
                                    </input>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info" style="width:70px" id="selectywclist">查询</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/preservicedcl.js"></script>
<script src="../js/preserviceyjd.js"></script>
<script src="../js/preserviceywc.js"></script>
</body>
</html>
