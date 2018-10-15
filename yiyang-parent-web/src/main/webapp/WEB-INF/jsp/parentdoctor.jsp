<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="../css/parentdoctor.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="sty">
    <title>家庭医生</title>
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
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">医生专家库</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">我的咨询</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home" style="height: 640px;">
                    <form class="form-horizontal" id="doctorform">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="dname" class="" style="line-height: 34px">姓名</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="dname" name="dname">
                                </div>
                            </div>
                            <div class="col-md-9">
                                <button type="button" class="btn btn-info" style="width:70px" id="selectlist" onclick="selectdoctor()">查询</button>
                            </div>
                        </div>
                    </form>
                    <div class="doctorcss">

                    </div>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg consult" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >添加</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="inspectionForm">
                                        <table class="table text-right">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr><td>姓名:</td><td><input type="text" class="form-control" id="tname" ></td><td>医院</td><td><input type="text" class="form-control" id="tdname"></td></tr>
                                            <tr><td>科室:</td><td><input type="text" class="form-control" id="tinfo" ></td><td>电话:</td><td><input type="text" class="form-control" id="telnum" ></td></tr>
                                            <tr><td>问题描述:</td><td colspan="3"><textarea class="form-control" rows="3" style="resize: none;" id="desc" name="cDesc" ></textarea></td></tr>
                                            <tr><td><input type="text" class="hidden" id="duser" name="cDuser"></td></tr>
                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" id="saveBt_i" class="btn btn-default" onclick="saveconsult()">保存</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>

                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <form class="form-horizontal" id="myform2">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="cDesc" class="" style="line-height: 34px">标题</label></div>
                                <div class="myselect">
                                    <input class="form-control" type="text" id="cDesc" name="cDesc">
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="cFlag" class="" style="line-height: 34px">状态</label></div>
                                <div class="myselect">
                                    <div class="myselect">
                                        <select class="form-control"  id="cFlag" name="cFlag">
                                            <option class="" value="" selected="selected"> --请选择--</option>
                                            <option class="" value="1" > 未回复</option>
                                            <option class="" value="2" > 已回复</option>
                                        </select>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectConsult" >查询</button>
                            </div>
                        </div>
                    </form>
                    <div id="mytable_i">
                    </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/laydate/laydate.js"></script>


<script src="../js/parentdoctor.js"></script>
<script>




</script>
</body>
</html>
