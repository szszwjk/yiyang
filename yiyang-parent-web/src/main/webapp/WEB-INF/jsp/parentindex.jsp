<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- #include file="include.jsp" -->
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
        <div class="col-md-2">
            <jsp:include  page="include.jsp"/>
        </div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">个人信息</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">医生评估</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <table class="table table-striped">
                        <col style="width: 10%" />
                        <col style="width: 42.5%" />
                        <col style="width: 47.5%" />
                        <tr> <td rowspan="4"><div style="width: 111px;height: 156px;">
                            <img id="mypicture" src="${item.infoImg}" alt="..." >
                        </div>
                        </td><td>性别:&nbsp;${item.infoSex}</td><td>身份证:&nbsp;${item.pIdnum}</td></tr>
                        <tr> <td>联系方式:&nbsp;${item.infoTel}</td><td>出生地:&nbsp;${item.pBirthplace}</td></tr>
                        <tr> <td>居住地:&nbsp;${item.pAddress}</td><td>年龄:&nbsp;${item.age}</td></tr>
                        <tr> <td>所属社区:&nbsp;${item.cName}</td><td>社保编号:&nbsp;${item.pCno}</td></tr>
                        <tr> <td><button type="button" class="btn btn-default" style="width:111px;height:22px;line-height: 11px;" onclick="uplodebt()">上传图片</button> </td><td>有无过敏史:&nbsp;${item.pInfo1}</td><td>有无手术史:&nbsp;${item.pInfo2}</td></tr>
                        <tr><td>姓名:&nbsp;${item.infoName}</td> <td>有无外伤:&nbsp;${item.pInfo3}</td><td>有无遗传病:&nbsp;${item.pInfo4}</td></tr>
                    </table>

                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-sm uplodeImg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-sm " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >添加</span>
                                </div>
                                <div  class="text-center">
                                    <form  method="post" enctype="multipart/form-data" id="pictureform">
                                        <div id="myhead"></div>
                                        <input type="file" name="uploadFile" id="input_file" style="margin-left: 60px;">
                                        <button type="button" class="btn btn-info" style="width:111px; margin-top: 10px;" onclick="uploadfile()">上传</button>

                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%--end--%>


                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <h4 style="border-bottom: 2px solid #000;" id="phead">医生评估</h4>

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
