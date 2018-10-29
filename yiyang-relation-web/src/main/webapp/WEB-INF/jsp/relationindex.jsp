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
        <div class="col-md-8">
            <div class="col-md-1 text-center"><a href="/"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded">
                <span>首页</span></a></div>
            <div class="col-md-1 text-center"><a href="/relation/parentinfo"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>老人信息</span></a></div>
            <div class="col-md-1 text-center"><a href="/relation/parentcustody"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>告警信息</span></a></div>
            <div class="col-md-1 text-center"><a href="/relation/locationmap"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>地图定位</span></a></div>
        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">个人信息</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">亲人绑定</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <form id="relativeform">
                    <table class="table " >
                        <col style="width: 10%" />
                        <col style="width: 10%" />
                        <col style="width: 32.5%" />
                        <col style="width: 10%" />
                        <col style="width: 37.5%" />
                       <tr> <td rowspan="4"><div style="width: 111px;height: 156px;">
                           <img id="mypicture" src="${item.tUserInfo.infoImg}" alt="..." >
                       </div> </td><td>姓名:&nbsp;</td><td> <input type="text" class="form-control" id="infoName" name="tUserInfo.infoName" value="${item.tUserInfo.infoName}" readonly></td><td>性别:&nbsp;</td><td><select class="form-control "  id="infoSex" name="tUserInfo.infoSex" disabled>
                           <option>男</option>
                           <option>女</option>

                       </select></td></tr>
                        <tr> <td>联系方式:&nbsp;</td><td><input type="text" class="form-control" value="${item.tUserInfo.infoTel}" id="infoTel" name="tUserInfo.infoTel" readonly></td><td>生日:</td><td><input type="text" class="form-control"  id="age" <%--name="tUserInfo.infoAge"--%> readonly></td></tr>
                        <tr> <td>社区编号:&nbsp;</td><td><div><input type="text" id="pCnum" name="rCnum" value="${item.rCnum}" class="form-control" readonly></div></td><td>年龄:&nbsp;</td><td><div><input type="text" class="form-control" id="age1" readonly></div></td></tr>
                        <tr> <td>居住地:&nbsp;</td><td> <input type="text" class="form-control" value="${item.rAddress}" id="rAddress" name="rAddress" readonly></td><td>所属社区:&nbsp;</td><td><select class="form-control " style="width:400px;" id="cName" name="cName"  disabled></select></td></tr>
                        <tr> <td><button type="button" class="btn btn-default" style="width:111px;" onclick="uplodebt()">上传图片</button> </td><td>民族:&nbsp;</td><td><select class="form-control " style="width:400px;" id="infoNation" name="tUserInfo.infoNation"  disabled>
                            <option>汉族</option>
                            <option>其他</option>

                        </select></td><td><button type="button" class="btn btn-default" style="width:111px;" id="ebt" onclick="editinfo()">修改</button>
                            <button type="button" class="btn btn-default hidden" style="width:111px;" id="sbt" onclick="saveinfo()">保存</button>
                        </td><td></td></tr>
                    </table>
                    </form>

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
                    <form class="form-horizontal" id="myform2">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="tinfoName" class="" style="line-height: 34px">姓名</label></div>
                                <div class="myselect">
                                    <input class="form-control" type="text" id="tinfoName" name="infoName">
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="tinfoTel" class="" style="line-height: 34px">联系方式</label></div>
                                <div class="myselect">
                                    <div class="myselect">
                                        <input class="form-control" type="text" id="tinfoTel" name="infoTel" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectParent" >查询</button>
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

<script src="../js/relationindex.js"></script>
<script>
    $(function () {
        var result=${item1}
        var community=${list}
        var opt=""
        for (var i=0;i<community.length;i++)
        {
            opt+=" <option value='"+community[i].cNum+"'>"+community[i].cName+"</option>"
        }
        $("#cName").append(opt);
        console.log(result)
        var date=new Date(result.tUserInfo.infoAge)
        $("#age").val(date.format('yyyy-MM-dd'))
        //infoSex
        $("#infoSex").val(result.tUserInfo.infoSex)
        $("#cName").val($("#pCnum").val())
        $("#infoNation").val(result.tUserInfo.infoNation)

        $("#age1").val(jsGetAge(date.format('yyyy-MM-dd')))

    })
    laydate.render({
        elem: '#age'

    });
</script>



</body>
</html>
