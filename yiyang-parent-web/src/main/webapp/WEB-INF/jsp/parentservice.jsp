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
    <title>服务预定</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
    <link href="../css/bootstrapdate/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/parentservice.css">

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
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">服务预定</a></li>
                <li role="presentation"><a href="#profile" role="tab" data-toggle="tab" id="hlist">预定记录</a></li>
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
                                <div style="float: left;"><label for="largelist" class="" style="line-height: 34px">服务大类名称</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="largelist">
                                        <option class="" value="" selected="selected"> --请选择--</option>
                                        <option class="" value="0"> 交通旅游</option>
                                        <option class="" value="1"> 医疗救助</option>
                                        <option class="" value="2"> 法律宣传</option>
                                        <option class="" value="3"> 家政服务</option>
                                        <option class="" value="4"> 申请低保</option>
                                        <option class="" value="5"> 设备维修</option>
                                        <option class="" value="6"> 房屋工程</option>
                                        <option class="" value="7"> 医疗保险</option>
                                        <option class="" value="8"> 代购代缴</option>
                                        <option class="" value="9"> 教学工程</option>
                                        <option class="" value="10"> 宠物工程</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="littlelist" class="" style="line-height: 34px">服务小类名称</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="littlelist">
                                        <option class="" value="" selected="selected" id="startop"> --请选择--</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info" style="width:70px" id="selectlist">查询</button>
                            </div>



                        </div>
                    </form>
                    <div class="modal fade bs-example-modal-lg show-desc" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >详细信息</span>
                                </div>
                                <table class="table table-condensed table-striped table-bordered ">
                                    <col style="width: 10%" />
                                    <col style="width: 30%" />
                                    <col style="width: 10%" />
                                    <col style="width: 25%" />
                                    <col style="width: 10%" />
                                    <col style="width: 15%" />

                                    <tr><td>商家名称:</td><td><span id="siName"></span></td><td>地址:</td><td><span id="sAddress"></span></td><td>服务电话:</td><td><span id="infoTel"></span></td></tr>
                                    <tr><td>服务项目:</td><td><span id="siItem"></span></td><td>收费方式:</td><td><span id="siPrice"></span></td><td>周末服务:</td><td><span id="sInfo3"></span></td></tr>
                                    <tr><td>内容简介:</td><td colspan="5"><span id="siDesc"></span></td></tr>
                                    <tr><td>执照编号:</td><td colspan="5"><span id="sNumber"></span></td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade bs-example-modal-lg accept-services" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >服务预定</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="preServices">
                                    <table class="table">
                                        <col style="width: 15%" />
                                        <col style="width: 35%" />
                                        <col style="width: 10%" />
                                        <col style="width: 40%" />
                                        <tr><td class="text-right">姓名:</td><td> <input type="text" class="form-control"id="psUser" name="psUname"></td><td class="text-right">联系电话:</td><td><div id="telgroup"><input type="text" class="form-control" name="psTelnumber" id="psTelnumber"></div></td></tr>
                                        <tr><td class="text-right">服务地址</td><td colspan="3"><input type="text" class="form-control" id="psAddres" name="psAddres"></td></tr>
                                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" id="serviceName" readonly></td><td class="text-right">服务项目:</td><td> <input type="text" class="form-control" id="psItem" name="psItem" readonly></td></tr>
                                        <tr><td class="text-right">商家电话:</td><td> <input type="text" class="form-control" id="serviceTel" readonly></td><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" id="servicePrice" readonly></td></tr>
                                        <tr><td class="text-right"> <span id="serviceType">服务时长:</span></td><td> <select class="form-control" id="serviceNum">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select></td><td class="text-right">服务总价:</td><td> <input type="text" class="form-control" id="serviceSum" name="psPrice" readonly></td></tr>
                                        <tr><td class="text-right">预约服务时间:</td><td>


                                            <div class="form-group">
                                                <div class="input-group date form_datetime col-md-5"  data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                                                    <input class="form-control" size="16" type="text" value="" id="todate" name="psTotime" readonly>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>
                                            </div>
                                        </td><td><input type="hidden" id="psPeople" name="psPeople"></td><td><input type="hidden" id="psItemId" name="psItemId"></td></tr>
                                        <tr><td class="text-right">服务要求</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;" id="serviceDesc" name="psDesc"></textarea></div>
                                        </td></tr>
                                    </table>
                                    </form>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default" onclick="preServices()">保存</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="hid" class="" style="line-height: 34px">订单编号:</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="hid">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="hitem" class="" style="line-height: 34px">服务项目:</label></div>
                                <div class="myselect">
                                    <input type="text" class="form-control" id="hitem">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info" style="width:70px" id="hselect">查询</button>
                            </div>



                        </div>
                    </form>
                    <div class="modal fade bs-example-modal-lg h-services" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >详细情况</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <table class="table">
                                        <col style="width: 15%" />
                                        <col style="width: 35%" />
                                        <col style="width: 10%" />
                                        <col style="width: 40%" />
                                        <tr><td class="text-right">订单编号:</td><td> <input type="text" class="form-control" readonly id="hpsNumber" ></td><td class="text-right">客户姓名:</td><td><div ><input type="text" class="form-control" readonly id="hpsUname"></div></td></tr>
                                        <tr><td class="text-right">服务商家:</td><td> <input type="text" class="form-control" readonly id="hsName"></td><td class="text-right">服务项目:</td><td><div ><input type="text" class="form-control" id="hpsItem" readonly></div></td></tr>
                                        <tr><td class="text-right">下单时间:</td><td> <input type="text" class="form-control" readonly id="hpsTime"></td><td class="text-right">服务时间:</td><td><div ><input type="text" class="form-control" readonly id="hpsTotime" ></div></td></tr>
                                        <tr><td class="text-right">服务地址:</td><td colspan="3"> <input type="text" class="form-control" readonly id="hpsAddres"></td></tr>
                                        <tr><td class="text-right">服务单价:</td><td> <input type="text" class="form-control" readonly id="hsiPrice"></td><td class="text-right">服务总价:</td><td><div ><input type="text" class="form-control" readonly id="hpsPrice" ></div></td></tr>
                                        <tr><td class="text-right">服务要求:</td><td colspan="3"><div > <textarea class="form-control" rows="3" style="resize: none;"  readonly id="hpsDesc"></textarea></div></td></tr>
                                        <tr><td class="text-right">服务人员:</td><td> <input type="text" class="form-control" readonly id="hinfoName"></td><td class="text-right">商家电话:</td><td><div ><input type="text" class="form-control" readonly id="hinfoTel" ></div></td></tr>
                                        <tr><td class="text-right">订单状态:</td><td> <input type="text" class="form-control" readonly id="hpsFlag"></td><td class="text-right"></td><td></td></tr>

                                    </table>
                                </div>

                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <%--<button type="button" class="btn btn-default" onclick="preServices()">保存</button>--%>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>

                                </div>


                            </div>
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
<script src="../js/bootstrapdate/bootstrap-datetimepicker.js"></script>
<script src="../js/bootstrapdate/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="../js/parentservice.js"></script>
<script src="../js/hservice.js"></script>
<script type="text/javascript">
    $.fn.datetimepicker.defaults = {
        //默认语言
        language: 'zh-CN',
        //默认选择格式
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        todayBtn: true,
        //选择板所在输入框位置
        pickerPosition: "bottom-left"
    };
  $(function () {

      $('.form_datetime').datetimepicker({
          weekStart: 0, //一周从哪一天开始
          todayBtn:  1, //
          autoclose: 1,
          todayHighlight: 1,
          startView: 2,
          forceParse: 0,
          showMeridian: 1
      });


    });

   </script>
</body>
</html>
