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
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="../css/parentaccount.css">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="sty">
    <title>个人账户</title>
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
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">账户信息</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home" style="overflow-x:auto;height: 640px;">
                    <form id="saveparent">
                        <h4>基本信息</h4>
                        <table class="table">
                            <col style="width: 10%" />
                            <col style="width: 35%" />
                            <col style="width: 10%" />
                            <col style="width: 45%" />
                            <tr><td >姓名:</td><td><input type="text" id="infoId" name="tUserInfo.infoName" class="form-control" value="${data1.tUserInfo.infoName}" readonly> </td><td >性别:</td><td><select class="form-control " style="width:400px;" id="infoSex" name="tUserInfo.infoSex" disabled>
                                <option>男</option>
                                <option>女</option>

                            </select></td></tr>
                            <tr><td >电话:</td><td><input type="text" id="infoTel" name="tUserInfo.infoTel"  class="form-control" value="${data1.tUserInfo.infoTel}" readonly> </td><td >出生年月:</td><td><input type="text" id="infoAge" name="tUserInfo.infoAge"  class="form-control"   disabled></td></tr>
                            <tr><td >国籍:</td><td><select class="form-control " style="width:400px;" id="pNationality" name="pNationality" disabled>
                                <option >中国</option>
                                <option>日本</option>
                                <option>美国</option>
                                <option>其他</option>
                            </select> </td><td >婚姻:</td><td><select class="form-control " style="width:400px;" id="infoMarriage" name="tUserInfo.infoMarriage" disabled>
                                <option>已婚</option>
                                <option>未婚</option>

                            </select></td></tr>
                            <tr><td>民族:</td><td><select class="form-control " style="width:400px;" id="infoNation" name="tUserInfo.infoNation"  disabled>
                                <option>汉族</option>
                                <option>其他</option>

                            </select></td><td></td><td></td></tr>
                        </table>
                        <h4>详细信息</h4>
                        <table class="table" >
                            <col style="width: 10%" />
                            <col style="width: 35%" />
                            <col style="width: 10%" />
                            <col style="width: 45%" />
                            <tr><td >出生地:</td><td><input type="text" id="pBirthplace" class="form-control" name="pBirthplace" value="${data1.pBirthplace}"  readonly> </td><td >居住地:</td><td><input type="text" id="pAddress" class="form-control" name="pAddress" value="${data1.pAddress}" readonly></td></tr>
                            <tr><td >身份证:</td><td><input type="text" id="pIdnum" class="form-control" name="pIdnum" value="${data1.pIdnum}" readonly> </td><td >所属社区:</td><td><select class="form-control " style="width:400px;" id="cName" name="cName"  disabled>
                            </select></td></tr>
                            <tr><td >社区编号:</td><td><div><input type="text" id="pCnum" name="pCnum" class="form-control" readonly></div> </td><td >社保编号:</td><td><input type="text" id="pCno" name="pCno" class="form-control" value="${data1.pCno}" readonly></td></tr>
                            <tr><td >血型:</td><td> <select class="form-control " style="width:400px;" id="pBlood" name="pBlood" disabled>
                                <option>A</option>
                                <option>B</option>
                                <option>AB</option>
                                <option>O</option>
                            </select></td><td >学历:</td><td><select class="form-control " style="width:400px;" id="pEducational" name="pEducational" disabled>
                                <option>初中</option>
                                <option>高中</option>
                                <option>本科</option>
                                <option>硕士</option>
                                <option>博士</option>
                            </select></td></tr>
                        </table>
                        <h4>病历信息</h4>
                        <table class="table">
                            <col style="width: 10%" />
                            <col style="width: 35%" />
                            <col style="width: 10%" />
                            <col style="width: 45%" />
                            <tr><td >过敏史:</td><td><select id="pInfo1" name="pInfo1" class="form-control" style="width: 400px;"  disabled><option>无</option><option>是</option></select> </td><td >外伤:</td>
                                <td><select id="pInfo2" name="pInfo2" class="form-control" style="width: 400px;"  disabled><option>无</option><option>是</option></select></td></tr>
                            <tr><td >手术史:</td><td><select id="pInfo3" name="pInfo3" class="form-control" style="width: 400px;"  disabled><option>无</option><option>是</option></select></td><td >遗传病:</td>
                                <td><select id="pInfo4" name="pInfo4" class="form-control" style="width: 400px;" disabled><option>无</option><option>是</option></select></td></tr>

                        </table>

                    </form>
                    <div class="text-center">
                        <button type="button" class="btn btn-info" style="width:70px ;margin-right: 20px;" id="editbt">修改</button>
                        <button type="button" class="btn btn-info hidden" style="width:70px;" id="savebt" >保存</button>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane "id="profile">
                    <form class="form-horizontal" style="margin-left: 350px;margin-top: 100px" id="updatepass">
                        <div class="form-group">
                            <label for="oldpass" class="col-sm-2 control-label">旧密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="oldpass" name="password"  style="width: 200px">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newpass" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="newpass" name="oldpass" style="width: 200px" >
                            </div>
                        </div>

                    </form>
                    <div class="text-center">
                        <button type="button" class="btn btn-info" style="width:197px ;margin-right: 20px;" onclick="editpass()">修改</button>
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


<script src="../js/parentaccount.js"></script>
<script>
    $(function () {
        var result=${data}
        var community=${list}
        var opt=""
        for (var i=0;i<community.length;i++)
        {
             opt+=" <option value='"+community[i].cNum+"'>"+community[i].cName+"</option>"
        }
        $("#cName").append(opt);

        var date=new Date(result.tUserInfo.infoAge)
        $("#infoAge").val(date.format('yyyy-MM-dd'))
        $("#pEducational").val(result.pEducational);
        //infoSex
        $("#infoSex").val(result.tUserInfo.infoSex)
        $("#pNationality").val(result.pNationality)
        var marriage=result.tUserInfo.infoMarriage==1?"已婚":"未婚";
        $("#pCnum").val($("#cName").val())
        $("#infoMarriage").val(marriage)
        $("#infoNation").val(result.tUserInfo.infoNation)
        $("#pBlood").val(result.pBlood)
        $("#pInfo1").val(result.pInfo1)
        $("#pInfo2").val(result.pInfo2)
        $("#pInfo3").val(result.pInfo3)
        $("#pInfo4").val(result.pInfo4)
    })
    laydate.render({
        elem: '#infoAge'

    });


</script>
</body>
</html>
