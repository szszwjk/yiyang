<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>医生评估</title>

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
            <div class="col-md-1 text-center"><a href="/consult"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>咨询问题</span></a></div>
            <div class="col-md-1 text-center"><a href="/evaluate"><img src="../img/layout_icon_doctor.jpg" alt="..." class="img-rounded">
                <span>医生评估</span></a></div>
        </div>
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">老人身体评估</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <table class="table table-striped">
                        <tr>
                            <td>老人姓名</td>
                            <td>项目</td>
                            <td>身体评估</td>
                            <td>时间</td>
                        </tr>
                        <c:forEach items="${evaList}" var="item">
                            <tr>
                                <td>${item.dsPuser }</td>
                                <td>${item.dsItem }</td>
                                <td>${item.dsSuggest }</td>
                                <td><fmt:formatDate value="${item.dsDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                        </c:forEach>

                    </table>
                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        添加评估
                    </button>
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        个人信息
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form"id="addInfo">
                                        <div class="form-group">
                                            <label for="parname" class="col-sm-2 control-label">老人姓名</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="parname"
                                                       placeholder="请输入老人姓名" name="dsPuser">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="docname" class="col-sm-2 control-label">医生姓名</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="docname"
                                                       placeholder="请输入医生姓名" name="dsDuser">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="itemname" class="col-sm-2 control-label">项目</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="itemname"
                                                       placeholder="请输入项目" name="dsItem">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="phy" class="col-sm-2 control-label">身体评估</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="phy"
                                                       placeholder="请输入身体评估" name="dsSuggest">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <button type="button" class="btn btn-primary" onclick="submit_info()">
                                        提交
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
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
