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
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>健康检测</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>健康监护</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>健康档案</span></div>
            <div class="col-md-1 text-center"><a href="/parentservice"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>服务预定</span></a></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_doctor.jpg" alt="..." class="img-rounded">
                <span>家庭医生</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_user.jpg" alt="..." class="img-rounded">
                <span>个人账户</span></div>
        </div>
        <div class="col-md-2">.col-md-4</div>
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
                                        <%--<option class="" value="热水器维修"> 热水器维修</option>--%>
                                        <%--<option class="" value="气功"> 气功</option>--%>
                                        <%--<option class="" value="浴室维修"> 浴室维修</option>--%>
                                        <%--<option class="" value="城乡居民医疗保险"> 城乡居民医疗保险</option>--%>
                                        <%--<option class="" value="缝纫设备维修"> 缝纫设备维修</option>--%>
                                        <%--<option class="" value="针灸"> 针灸</option>--%>
                                        <%--<option class="" value="太极拳"> 太极拳</option>--%>
                                        <%--<option class="" value="微波炉维修"> 微波炉维修</option>--%>
                                        <%--<option class="" value="酒店代订"> 酒店代订</option>--%>
                                        <%--<option class="" value="洗衣机维修"> 洗衣机维修</option>--%>
                                        <%--<option class="" value="城乡居民养老保险"> 城乡居民养老保险</option>--%>
                                        <%--<option class="" value="政策咨询"> 政策咨询</option>--%>
                                        <%--<option class="" value="拔火罐"> 拔火罐</option>--%>
                                        <%--<option class="" value="旅游资讯查询"> 旅游资讯查询</option>--%>
                                        <%--<option class="" value="墙缝修补"> 墙缝修补</option>--%>
                                        <%--<option class="" value="政策宣传"> 政策宣传</option>--%>
                                        <%--<option class="" value="不住家保姆"> 不住家保姆</option>--%>
                                        <%--<option class="" value="申请廉租房"> 申请廉租房</option>--%>
                                        <%--<option class="" value="墙面粉刷"> 墙面粉刷</option>--%>
                                        <%--<option class="" value="宠物医疗"> 宠物医疗</option>--%>
                                        <%--<option class="" value="代订机票"> 代订机票</option>--%>
                                        <%--<option class="" value="优抚优待"> 优抚优待</option>--%>
                                        <%--<option class="" value="电视机维修"> 电视机维修</option>--%>
                                        <%--<option class="" value="老人陪护"> 老人陪护</option>--%>
                                        <%--<option class="" value="宠物托管"> 宠物托管</option>--%>
                                        <%--<option class="" value="宠物美容"> 宠物美容</option>--%>
                                        <%--<option class="" value="空调维修"> 空调维修</option>--%>
                                        <%--<option class="" value="搬家服务"> 搬家服务</option>--%>
                                        <%--<option class="" value="钟点工"> 钟点工</option>--%>
                                        <%--<option class="" value="租车"> 租车</option>--%>
                                        <%--<option class="" value="冰箱维修"> 冰箱维修</option>--%>
                                        <%--<option class="" value="住家保姆"> 住家保姆</option>--%>
                                        <%--<option class="" value="水电代缴"> 水电代缴</option>--%>
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

                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">2</div>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/parentservice.js"></script>
</body>
</html>
