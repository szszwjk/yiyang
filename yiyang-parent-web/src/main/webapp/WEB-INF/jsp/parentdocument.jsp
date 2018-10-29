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
    <title>健康档案</title>
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
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#inspection" role="tab" data-toggle="tab" id="showlist">检验项目</a></li>
                <li role="presentation"><a href="#operation" role="tab" data-toggle="tab" id="hlist">手术记录</a></li>
                <li role="presentation"><a href="#medical" role="tab" data-toggle="tab" >住院病历</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px">
            <!-- 面板区 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="inspection" style="height: 640px;">
                    <form class="form-horizontal" id="myform1">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="iHname" class="" style="line-height: 34px">医院名称</label></div>
                                <div class="myselect">
                                   <input class="form-control" type="text" id="iHname">
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="iInfo1" class="" style="line-height: 34px">诊断科室</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="iInfo1">
                                        <option class="" value="" selected="selected" > --请选择--</option>
                                        <option class="" value=""> 选择医院科室</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="中西结合科"> 中西结合科</option>
                                        <option class="" value="体检科"> 体检科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="内科"> 内科</option>
                                        <option class="" value="功能科"> 功能科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="外科"> 外科</option>
                                        <option class="" value="妇科"> 妇科</option>
                                        <option class="" value="急诊科"> 急诊科</option>
                                        <option class="" value="放射科"> 放射科</option>
                                        <option class="" value="耳鼻咽喉科"> 耳鼻咽喉科</option>
                                        <option class="" value="外三科(胃肠、疝、甲状腺、儿外科)"> 外三科(胃肠、疝、甲状腺、儿外科)</option>
                                        <option class="" value="外二科(肝胆胰、乳腺、血管)"> 外二科(肝胆胰、乳腺、血管)</option>
                                        <option class="" value="外四科(骨科)"> 外四科(骨科)</option>
                                        <option class="" value="新生儿科"> 新生儿科</option>
                                        <option class="" value="普儿科"> 普儿科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="消化/风湿免疫科简介"> 消化/风湿免疫科简介</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="康复理疗科"> 康复理疗科</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="泌尿外科"> 泌尿外科</option>
                                        <option class="" value="病理科"> 病理科</option>
                                        <option class="" value="耳鼻喉科"> 耳鼻喉科</option>
                                        <option class="" value="药械科"> 药械科</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="内科"> 内科</option>
                                        <option class="" value="泌尿外科"> 泌尿外科</option>
                                        <option class="" value="疼痛科"> 疼痛科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="产科"> 产科</option>
                                        <option class="" value="医学整形美容"> 医学整形美容</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="眼耳鼻喉科"> 眼耳鼻喉科</option>
                                        <option class="" value="肛肠科"> 肛肠科</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="乳腺科"> 乳腺科</option>
                                        <option class="" value="康复科"> 康复科</option>
                                        <option class="" value="感染性疾病科"> 感染性疾病科</option>
                                        <option class="" value="肾脏内科"> 肾脏内科</option>
                                        <option class="" value="脊柱矫形科"> 脊柱矫形科</option>
                                        <option class="" value="颈腰椎病专科"> 颈腰椎病专科</option>
                                        <option class="" value="中药剂科"> 中药剂科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="心功能科"> 心功能科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="肿瘤科"> 肿瘤科</option>
                                        <option class="" value="西药剂科"> 西药剂科</option>
                                        <option class="" value="过敏反应科"> 过敏反应科</option>
                                        <option class="" value="重症医学科（ICU）"> 重症医学科（ICU）</option>
                                        <option class="" value="高压氧科"> 高压氧科</option>
                                        <option class="" value="中医肛肠科"> 中医肛肠科</option>
                                        <option class="" value="乳腺甲状腺外科"> 乳腺甲状腺外科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="医学检验科"> 医学检验科</option>
                                        <option class="" value="急诊医学科"> 急诊医学科</option>
                                        <option class="" value="手术室"> 手术室</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="病理科"> 病理科</option>
                                        <option class="" value="皮肤性病科"> 皮肤性病科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="药剂科"> 药剂科</option>
                                        <option class="" value="营养科"> 营养科</option>
                                        <option class="" value="超声医学科"> 超声医学科</option>
                                        <option class="" value="重症医学科"> 重症医学科</option>
                                        <option class="" value="骨科"> 骨科</option>
                                        <option class="" value="麻醉科"> 麻醉科</option>
                                        <option class="" value="呼吸科"> 呼吸科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="急诊科"> 急诊科</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="神经外科·胸外科"> 神经外科·胸外科</option>
                                        <option class="" value="骨科"> 骨科</option>
                                        <option class="" value="乳腺血管外科"> 乳腺血管外科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="心胸外科"> 心胸外科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="烧伤整形外科"> 烧伤整形外科</option>
                                        <option class="" value="皮肤科"> 皮肤科</option>
                                        <option class="" value="耳鼻喉科"> 耳鼻喉科</option>
                                        <option class="" value="肝胆胰科"> 肝胆胰科</option>
                                        <option class="" value="血液内科"> 血液内科</option>
                                        <option class="" value="住院部"> 住院部</option>
                                        <option class="" value="公共卫生科"> 公共卫生科</option>
                                        <option class="" value="康复科"> 康复科</option>
                                        <option class="" value="社区科"> 社区科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="普胸外科"> 普胸外科</option>
                                        <option class="" value="肛肠科"> 肛肠科</option>
                                        <option class="" value="血液科"> 血液科</option>
                                        <option class="" value="产科"> 产科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="心内科"> 心内科</option>
                                        <option class="" value="检 验 科"> 检 验 科</option>
                                        <option class="" value="神经外科"> 神经外科</option>
                                        <option class="" value="肾内科"> 肾内科</option>
                                        <option class="" value="超声医学科"> 超声医学科</option>
                                        <option class="" value="肿瘤中医科"> 肿瘤中医科</option>
                                        <option class="" value="肿瘤内科"> 肿瘤内科</option>
                                        <option class="" value="医养中心"> 医养中心</option>
                                        <option class="" value="CT室"> CT室</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="外一神经外科"> 外一神经外科</option>
                                        <option class="" value="外二肝胆外科"> 外二肝胆外科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="影像功能科"> 影像功能科</option>
                                        <option class="" value="特检科"> 特检科</option>
                                        <option class="" value="皮肤美容科"> 皮肤美容科</option>
                                        <option class="" value="肛肠病"> 肛肠病</option>
                                        <option class="" value="麻醉科"> 麻醉科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="全科医疗科"> 全科医疗科</option>
                                        <option class="" value="内分泌/血液科"> 内分泌/血液科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="肾病/风湿科"> 肾病/风湿科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="感染科"> 感染科</option>
                                        <option class="" value="耳鼻喉头颈外科"> 耳鼻喉头颈外科</option>
                                        <option class="" value="肾内科"> 肾内科</option>
                                        <option class="" value="血管·甲状腺外科"> 血管·甲状腺外科</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectinspection">查询</button>
                                <button type="button" class="btn btn-info " style="width:100px;margin-left: 10px" onclick="addinspection()">新增</button>
                            </div>
                        </div>
                    </form>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg addInspection" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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
                                            <tr><td>检查医院:</td><td><input type="text" class="form-control" id="tiHname" name="iHname" ></td><td>检查项目:</td><td><input type="text" class="form-control" id="iItem" name="iItem" ></td></tr>
                                            <tr><td>诊断科室:</td><td><input type="text" class="form-control" id="tiInfo1" name="iInfo1" ></td><td>检验医生:</td><td><input type="text" class="form-control" id="iDname" name="iDname"  ></td></tr>
                                            <tr><td>检验结果:</td><td colspan="3"><textarea class="form-control" rows="3" style="resize: none;" id="iDes" name="iDes"></textarea></td></tr>
                                            <tr><td><input type="text" class="hidden" id="iId" name="iId"></td></tr>
                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" id="saveBt_i" class="btn btn-default" onclick="saveInspection()">保存</button>
                                        <button type="button" id="editBt_i" class="btn btn-default hidden" onclick="editInspection()">修改</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>
                    <%----------------------------------%>
                </div>
                <div role="tabpanel" class="tab-pane" id="operation">
                    <form class="form-horizontal" id="myform2">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="opItem" class="" style="line-height: 34px">手术名称</label></div>
                                <div class="myselect">
                                    <input class="form-control" type="text" id="opItem" name="opItem">
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="opHname" class="" style="line-height: 34px">医院名称</label></div>
                                <div class="myselect">
                                    <div class="myselect">
                                        <input class="form-control" type="text" id="opHname" name="opHname" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectOperation" >查询</button>
                                <button type="button" class="btn btn-info " style="width:100px;margin-left: 10px" onclick="addOperation()">新增</button>
                            </div>
                        </div>
                    </form>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg addOperation" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >添加</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="operationForm">
                                        <table class="table text-right">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr><td>手术名称:</td><td colspan="3"><input type="text" class="form-control" id="topItem" name="opItem" ></td></tr>
                                            <tr><td>手术医院:</td><td><input type="text" class="form-control" id="topHname" name="opHname" ></td><td>手术时间:</td><td><input type="text" class="form-control" id="opDate" name="opDate" ></td></tr>
                                            <tr><td>手术详情情况:</td><td colspan="3"><textarea class="form-control" rows="3" style="resize: none;" id="topInfo1"  name="opInfo1"></textarea></td></tr>
                                            <tr><td>术后恢复情况:</td><td colspan="3"><textarea class="form-control" rows="3" style="resize: none;" id="topInfo2"  name="opInfo2"></textarea></td></tr>
                                            <tr><td><input type="text" class="hidden" id="opId" name="opId"></td></tr>
                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" id="saveBt" class="btn btn-default" onclick="saveOperation()">保存</button>
                                        <button type="button" id="editBt" class="btn btn-default hidden" onclick="editOperation()">修改</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>
                <%-------------------------------------------%>
                </div>
                <div role="tabpanel" class="tab-pane" id="medical">
                    <form class="form-horizontal" id="myform3">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="mHname" class="" style="line-height: 34px">医院名称</label></div>
                                <div class="myselect">
                                    <div >
                                        <input class="form-control" type="text" id="mHname" name="mHname">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3" >


                                <div style="float: left;"><label for="mInfo1" class="" style="line-height: 34px">住院科室</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="mInfo1" name="mInfo1">
                                        <option class="" value="" selected="selected" > --请选择--</option>
                                        <option class="" value=""> 选择医院科室</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="中西结合科"> 中西结合科</option>
                                        <option class="" value="体检科"> 体检科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="内科"> 内科</option>
                                        <option class="" value="功能科"> 功能科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="外科"> 外科</option>
                                        <option class="" value="妇科"> 妇科</option>
                                        <option class="" value="急诊科"> 急诊科</option>
                                        <option class="" value="放射科"> 放射科</option>
                                        <option class="" value="耳鼻咽喉科"> 耳鼻咽喉科</option>
                                        <option class="" value="外三科(胃肠、疝、甲状腺、儿外科)"> 外三科(胃肠、疝、甲状腺、儿外科)</option>
                                        <option class="" value="外二科(肝胆胰、乳腺、血管)"> 外二科(肝胆胰、乳腺、血管)</option>
                                        <option class="" value="外四科(骨科)"> 外四科(骨科)</option>
                                        <option class="" value="新生儿科"> 新生儿科</option>
                                        <option class="" value="普儿科"> 普儿科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="消化/风湿免疫科简介"> 消化/风湿免疫科简介</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="康复理疗科"> 康复理疗科</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="泌尿外科"> 泌尿外科</option>
                                        <option class="" value="病理科"> 病理科</option>
                                        <option class="" value="耳鼻喉科"> 耳鼻喉科</option>
                                        <option class="" value="药械科"> 药械科</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="内科"> 内科</option>
                                        <option class="" value="泌尿外科"> 泌尿外科</option>
                                        <option class="" value="疼痛科"> 疼痛科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="产科"> 产科</option>
                                        <option class="" value="医学整形美容"> 医学整形美容</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="眼耳鼻喉科"> 眼耳鼻喉科</option>
                                        <option class="" value="肛肠科"> 肛肠科</option>
                                        <option class="" value="中医科"> 中医科</option>
                                        <option class="" value="乳腺科"> 乳腺科</option>
                                        <option class="" value="康复科"> 康复科</option>
                                        <option class="" value="感染性疾病科"> 感染性疾病科</option>
                                        <option class="" value="肾脏内科"> 肾脏内科</option>
                                        <option class="" value="脊柱矫形科"> 脊柱矫形科</option>
                                        <option class="" value="颈腰椎病专科"> 颈腰椎病专科</option>
                                        <option class="" value="中药剂科"> 中药剂科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="心功能科"> 心功能科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="肿瘤科"> 肿瘤科</option>
                                        <option class="" value="西药剂科"> 西药剂科</option>
                                        <option class="" value="过敏反应科"> 过敏反应科</option>
                                        <option class="" value="重症医学科（ICU）"> 重症医学科（ICU）</option>
                                        <option class="" value="高压氧科"> 高压氧科</option>
                                        <option class="" value="中医肛肠科"> 中医肛肠科</option>
                                        <option class="" value="乳腺甲状腺外科"> 乳腺甲状腺外科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="医学检验科"> 医学检验科</option>
                                        <option class="" value="急诊医学科"> 急诊医学科</option>
                                        <option class="" value="手术室"> 手术室</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="病理科"> 病理科</option>
                                        <option class="" value="皮肤性病科"> 皮肤性病科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="药剂科"> 药剂科</option>
                                        <option class="" value="营养科"> 营养科</option>
                                        <option class="" value="超声医学科"> 超声医学科</option>
                                        <option class="" value="重症医学科"> 重症医学科</option>
                                        <option class="" value="骨科"> 骨科</option>
                                        <option class="" value="麻醉科"> 麻醉科</option>
                                        <option class="" value="呼吸科"> 呼吸科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="急诊科"> 急诊科</option>
                                        <option class="" value="普外科"> 普外科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="神经外科·胸外科"> 神经外科·胸外科</option>
                                        <option class="" value="骨科"> 骨科</option>
                                        <option class="" value="乳腺血管外科"> 乳腺血管外科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="心胸外科"> 心胸外科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="烧伤整形外科"> 烧伤整形外科</option>
                                        <option class="" value="皮肤科"> 皮肤科</option>
                                        <option class="" value="耳鼻喉科"> 耳鼻喉科</option>
                                        <option class="" value="肝胆胰科"> 肝胆胰科</option>
                                        <option class="" value="血液内科"> 血液内科</option>
                                        <option class="" value="住院部"> 住院部</option>
                                        <option class="" value="公共卫生科"> 公共卫生科</option>
                                        <option class="" value="康复科"> 康复科</option>
                                        <option class="" value="社区科"> 社区科</option>
                                        <option class="" value="口腔科"> 口腔科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="普胸外科"> 普胸外科</option>
                                        <option class="" value="肛肠科"> 肛肠科</option>
                                        <option class="" value="血液科"> 血液科</option>
                                        <option class="" value="产科"> 产科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="心内科"> 心内科</option>
                                        <option class="" value="检 验 科"> 检 验 科</option>
                                        <option class="" value="神经外科"> 神经外科</option>
                                        <option class="" value="肾内科"> 肾内科</option>
                                        <option class="" value="超声医学科"> 超声医学科</option>
                                        <option class="" value="肿瘤中医科"> 肿瘤中医科</option>
                                        <option class="" value="肿瘤内科"> 肿瘤内科</option>
                                        <option class="" value="医养中心"> 医养中心</option>
                                        <option class="" value="CT室"> CT室</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="内分泌科"> 内分泌科</option>
                                        <option class="" value="外一神经外科"> 外一神经外科</option>
                                        <option class="" value="外二肝胆外科"> 外二肝胆外科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="影像功能科"> 影像功能科</option>
                                        <option class="" value="特检科"> 特检科</option>
                                        <option class="" value="皮肤美容科"> 皮肤美容科</option>
                                        <option class="" value="肛肠病"> 肛肠病</option>
                                        <option class="" value="麻醉科"> 麻醉科</option>
                                        <option class="" value="儿科"> 儿科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="神经内科"> 神经内科</option>
                                        <option class="" value="全科医疗科"> 全科医疗科</option>
                                        <option class="" value="内分泌/血液科"> 内分泌/血液科</option>
                                        <option class="" value="呼吸内科"> 呼吸内科</option>
                                        <option class="" value="心血管内科"> 心血管内科</option>
                                        <option class="" value="消化内科"> 消化内科</option>
                                        <option class="" value="老年病科"> 老年病科</option>
                                        <option class="" value="肾病/风湿科"> 肾病/风湿科</option>
                                        <option class="" value="妇产科"> 妇产科</option>
                                        <option class="" value="感染科"> 感染科</option>
                                        <option class="" value="耳鼻喉头颈外科"> 耳鼻喉头颈外科</option>
                                        <option class="" value="肾内科"> 肾内科</option>
                                        <option class="" value="血管·甲状腺外科"> 血管·甲状腺外科</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectmedical">查询</button>
                                <button type="button" class="btn btn-info " style="width:100px;margin-left: 10px" onclick="addmedical()">新增</button>
                            </div>
                        </div>
                    </form>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg addMedical" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >添加</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="medicalForm">
                                        <table class="table text-right">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr><td>住院医院:</td><td ><input type="text" class="form-control" id="tmHname" name="mHname" ></td><td>住院科室:</td><td><input type="text" class="form-control" id="tmInfo1" name="mInfo1" ></td></tr>
                                            <tr><td>住院病房:</td><td><input type="text" class="form-control" id="mInfo2" name="mInfo2" ></td><td>住院号:</td><td><input type="text" class="form-control" id="mNum" name="mNum" ></td></tr>
                                            <tr><td>住院日期:</td><td><input type="text" class="form-control" id="mIndate" name="mIndate" ></td><td>出院日期:</td><td><input type="text" class="form-control" id="mOutdate" name="mOutdate" ></td></tr>
                                            <tr><td>术后恢复情况:</td><td colspan="3"><textarea class="form-control" rows="3" style="resize: none;" id="mDesc"  name="mDesc"></textarea></td></tr>
                                            <tr><td><input type="text" class="hidden" id="mId" name="mId"></td></tr>

                                        </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" id="saveBt_m" class="btn btn-default" onclick="saveMedical()">保存</button>
                                        <button type="button" id="editBt_m" class="btn btn-default hidden" onclick="editMedical()">修改</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>

                    <%-------------------------------------%>
                </div>
            </div>
        </div>

    </div>
</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/laydate/laydate.js"></script>
<script src="../js/parentdocument_i.js"></script>
<script src="../js/parentdocument_m.js"></script>
<script src="../js/parentdocument_o.js"></script>
<script>
    laydate.render({
        elem: '#opDate'
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#mIndate'
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#mOutdate'
        ,type: 'datetime'
    });

</script>
</body>
</html>




