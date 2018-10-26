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
    <div class="tabContent" style="padding: 10px">
        <!-- 面板区 -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">

                <form class="form-horizontal" action="/chuli/" method="post">
                    <div class="form-head">工单管理</div>
                    <div class="form-group">
                        <div style="float:left;"><label for="psNumber" class="" style="line-height: 34px" >订单编号</label></div>
                        <div class="myselect">
                            <input  type="text" class="form-control" id="psNumber" name="psNumber" value="${tPreservice.psNumber}">
                            </input>
                        </div>
                        <div style="float: left;"><label for="psUname" class="" style="line-height: 34px">订单用户姓名</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psUname" value="${tPreservice.psUname}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="psTime" class="" style="line-height: 34px">下单时间</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psTime" value="${tPreservice.psTime}">
                            </input>
                        </div>
                        <div style="float: left;"><label for="psTelnumber" class="" style="line-height: 34px">电话号码</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psTelnumber" value="${tPreservice.psTelnumber}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="psAddres" class="" style="line-height: 34px">服务地址</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psAddres" value="${tPreservice.psAddres}">
                            </input>
                        </div>

                        <div style="float: left;"><label for="psTotime" class="" style="line-height: 34px">要求时间</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psTotime" value="${tPreservice.psTotime}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="siLarge" class="" style="line-height: 34px">服务大类</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="siLarge" value="${tPreservice.tServiceitem.siLarge}">
                            </input>
                        </div>

                        <div style="float: left;"><label for="siItem" class="" style="line-height: 34px">服务项</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="siItem" value="${tPreservice.tServiceitem.siItem}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="siType" class="" style="line-height: 34px">服务方式</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="siType" value="${tPreservice.tServiceitem.siType}">
                            </input>
                        </div>

                        <div style="float: left;"><label for="siName" class="" style="line-height: 34px">服务商名称</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="siName" value="${tPreservice.tServiceitem.siName}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="siPrice" class="" style="line-height: 34px">服务单价</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="siPrice" value="${tPreservice.tServiceitem.siPrice}">
                            </input>
                        </div>

                        <div style="float: left;"><label for="psPeople" class="" style="line-height: 34px">服务人员</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psPeople" value="${tPreservice.psPeople}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: left;"><label for="psDesc" class="" style="line-height: 34px">服务要求</label></div>
                        <div class="myselect">
                            <input type="text" class="form-control" id="psDesc" value="${tPreservice.psDesc}">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-info" style="width:70px" id="return" ><a href="javascript:" onclick="self.location=document.referrer;">返回</a></button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/preserviceywc.js"></script>
</body>
</html>
