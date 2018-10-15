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

    <link rel="stylesheet" href="../css/parentcustody.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="sty">
    <title>健康监护</title>
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
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">预警设置</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">异常指标</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home" style="overflow-x:auto;height: 640px;">
                    <table class="table table-condensed table-striped " id="optionTable" style="margin-top: 10px">

                        <thead><td>序号</td><td>预警项目</td><td>取值单位</td><td>最大值</td><td>最小值</td><td>操作</td></thead>
                        <c:forEach items="${list}" var="item">
                            <tr><td>${item.poId}</td><td >${item.poItem}</td><td>${item.poUnit}</td><td>${item.poMax}</td><td>${item.poMin}</td><td ><a href="#" onclick="editoption(this)">修改</a></td></tr>

                        </c:forEach>
                    </table>
                    <div style="width: 100%" class="text-right"><button type="button" class="btn btn-info " style="width:70px;" data-toggle="modal" data-target=".addoption">添加</button></div>
                    <div class="modal fade bs-example-modal-lg editoption" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >修改</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="formOption">
                                        <table class="table">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr>
                                                <td class="text-right">预警项目:</td>
                                                <td><span id="poItemText"></span></td>
                                                <td class="text-right">取值单位:</td>
                                                <td><span id="poUnitText"></span></td>
                                            </tr>
                                            <tr>
                                                <td class="text-right">最大值:</td>
                                                <td><input type="text" id="poMax" name="poMax" class="form-control"
                                                           oninput="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
                                                </td>
                                                <td class="text-right">最小值:</td>
                                                <td><input type="text" id="poMin" name="poMin" class="form-control"
                                                           oninput="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="hidden"><input type="text" id="poIdText" name="poId"></td>
                                            </tr>

                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default" onclick="saveedit()">保存</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade bs-example-modal-lg addoption" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >添加</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="addOption">
                                        <table class="table">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr>
                                                <td class="text-right">预警项目:</td>
                                                <td><select name="poItem" class="form-control" id="selectItem">
                                                    <option value="xt">血糖</option>
                                                    <option value="xy">血氧</option>
                                                    <option value="xl">心率</option>
                                                </select></td>
                                                <td class="text-right">取值单位:</td>
                                                <td><input type="text" id="unit" name="poUnit" class="form-control" value="mmol/L" readonly></td>
                                            </tr>
                                            <tr>
                                                <td class="text-right">最大值:</td>
                                                <td><input type="text" id="poMaxText"  name="poMax" class="form-control"
                                                           oninput="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
                                                </td>
                                                <td class="text-right">最小值:</td>
                                                <td><input type="text" id="poMinText" name="poMin" class="form-control"
                                                           oninput="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default" onclick="addoption()">保存</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <form class="form-horizontal" id="myform">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="sitem" class="" style="line-height: 34px">预警项目</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="sitem">
                                        <option class="" value="" selected="selected" > --请选择--</option>
                                        <option value="xt"> 血糖</option>
                                        <option value="xy"> 血氧</option>
                                        <option value="xl"> 心率</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="sflag" class="" style="line-height: 34px">状态</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="sflag">
                                        <option class="" value="" selected="selected" > --请选择--</option>
                                        <option value="2">已处理</option>
                                        <option value="1">未处理</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectlist">查询</button>

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
<script src="../js/laydate/laydate.js"></script>


<script src="../js/parentcustody.js"></script>
<script>




</script>
</body>
</html>
