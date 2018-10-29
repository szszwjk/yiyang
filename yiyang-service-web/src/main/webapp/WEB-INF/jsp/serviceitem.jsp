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
            <div class="col-md-1 text-center" ><a href="/serviceitem"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span> 服务项目</span></a></div>
            <div class="col-md-1 text-center"><a href="/preservice"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>工单管理</span></a></div>

        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" id="showlist">服务项目</a></li>
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
                                        <option class="" value="交通旅游"> 交通旅游</option>
                                        <option class="" value="医疗救助"> 医疗救助</option>
                                        <option class="" value="法律宣传"> 法律宣传</option>
                                        <option class="" value="家政服务"> 家政服务</option>
                                        <option class="" value="申请低保"> 申请低保</option>
                                        <option class="" value="设备维修"> 设备维修</option>
                                        <option class="" value="房屋工程"> 房屋工程</option>
                                        <option class="" value="医疗保险"> 医疗保险</option>
                                        <option class="" value="代购代缴"> 代购代缴</option>
                                        <option class="" value="教学工程"> 教学工程</option>
                                        <option class="" value="宠物工程"> 宠物工程</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="float: left;"><label for="littlelist" class="" style="line-height: 34px">服务小类名称</label></div>
                                <div class="myselect">
                                    </select> <select class="form-control" id="littlelist">
                                    <option class="" value="" selected="selected"> --请选择--</option>
                                    <option class="" value="热水器维修"> 热水器维修</option>
                                    <option class="" value="气功"> 气功</option>
                                    <option class="" value="浴室维修"> 浴室维修</option>
                                    <option class="" value="城乡居民医疗保险"> 城乡居民医疗保险</option>
                                    <option class="" value="缝纫设备维修"> 缝纫设备维修</option>
                                    <option class="" value="针灸"> 针灸</option>
                                    <option class="" value="太极拳"> 太极拳</option>
                                    <option class="" value="微波炉维修"> 微波炉维修</option>
                                    <option class="" value="酒店代订"> 酒店代订</option>
                                    <option class="" value="洗衣机维修"> 洗衣机维修</option>
                                    <option class="" value="城乡居民养老保险"> 城乡居民养老保险</option>
                                    <option class="" value="政策咨询"> 政策咨询</option>
                                    <option class="" value="拔火罐"> 拔火罐</option>
                                    <option class="" value="旅游资讯查询"> 旅游资讯查询</option>
                                    <option class="" value="墙缝修补"> 墙缝修补</option>
                                    <option class="" value="政策宣传"> 政策宣传</option>
                                    <option class="" value="不住家保姆"> 不住家保姆</option>
                                    <option class="" value="申请廉租房"> 申请廉租房</option>
                                    <option class="" value="墙面粉刷"> 墙面粉刷</option>
                                    <option class="" value="宠物医疗"> 宠物医疗</option>
                                    <option class="" value="代订机票"> 代订机票</option>
                                    <option class="" value="优抚优待"> 优抚优待</option>
                                    <option class="" value="电视机维修"> 电视机维修</option>
                                    <option class="" value="老人陪护"> 老人陪护</option>
                                    <option class="" value="宠物托管"> 宠物托管</option>
                                    <option class="" value="宠物美容"> 宠物美容</option>
                                    <option class="" value="空调维修"> 空调维修</option>
                                    <option class="" value="搬家服务"> 搬家服务</option>
                                    <option class="" value="钟点工"> 钟点工</option>
                                    <option class="" value="租车"> 租车</option>
                                    <option class="" value="冰箱维修"> 冰箱维修</option>
                                    <option class="" value="住家保姆"> 住家保姆</option>
                                    <option class=""  value="水电代缴"> 水电代缴</option>
                                </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                            <button type="button" class="btn btn-info" style="width:70px" id="selectlist">查询</button>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-info" style="width:70px" id="add" >新增</button>
                                <button type="button" class="btn btn-info" style="width:70px" id="delete">批量删除</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">2</div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade bs-example-modal-lg show-desc1" id="show-desc1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">服务项目</h4>
            </div>
            <form id="form2" method="post">
            <div class="modal-body">
                <table class="table table-condensed table-striped table-bordered ">
                    <input type="text" id="siName" name="siName"  hidden>
                    <tr><td>
                    <div><span>服务大类：</span><input type="text" id="siLarge" name="siLarge" disabled ></div></td><td>
                        <div><span>服务小类：</span><input type="text" id="siLittle" name="siLittle" disabled ></div></td>
                        </tr>
                    <tr> <td>
                    <div><span>服务项目：</span><input type="text" id="siItem" name="siItem" disabled ></div></td><td>
                    <div><span>收费模式：</span><select id="siType"  name="siType">
                        <option value="">--请选择--</option>
                        <option value="1" selected="selected">按小时</option>
                        <option value="2">按次数</option>
                        <option value="3">免费</option>
                    </select>
                    </div>
                        </td></tr>
                        <tr><td><div><span>收费单价：</span><input type="text" id="siPrice" name="siPrice" ></div></td>
                      <td>
                          <div><span>服务内容：</span><textarea   rows="10" cols="30"  id="siDesc" name="siDesc" ></textarea></div>
                        </td>
                      </tr>
                    <tr>
                        <td>
                            <input class="hidden" id="siId2" name="siId" type="text">
                        </td>
                    </tr>
                </table>
            </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveupdate">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade bs-example-modal-lg insert" id="insert" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">服务项目</h4>
            </div>
            <div class="modal-body">
                <form id="form1" method="post">
                    <table class="table table-condensed table-striped table-bordered ">
                    <tr><td>
                    <div>服务大类：
                        <select class="form-control" id="siLarge1"  name="siLarge" >
                            <option class="" value="" selected="selected"> --请选择--</option>
                            <option class="" value="交通旅游"> 交通旅游</option>
                            <option class="" value="医疗救助"> 医疗救助</option>
                            <option class="" value="法律宣传"> 法律宣传</option>
                            <option class="" value="家政服务"> 家政服务</option>
                            <option class="" value="申请低保"> 申请低保</option>
                            <option class="" value="设备维修"> 设备维修</option>
                            <option class="" value="房屋工程"> 房屋工程</option>
                            <option class="" value="医疗保险"> 医疗保险</option>
                            <option class="" value="代购代缴"> 代购代缴</option>
                            <option class="" value="教学工程"> 教学工程</option>
                            <option class="" value="宠物工程"> 宠物工程</option>
                        </select>
                    </div></td>
                    <td><div>服务小类：
                            </select> <select class="form-control" id="siLittle1" name="siLittle">
                            <option class="" value="" selected="selected"> --请选择--</option>
                            <option class="" value="热水器维修"> 热水器维修</option>
                            <option class="" value="气功"> 气功</option>
                            <option class="" value="浴室维修"> 浴室维修</option>
                            <option class="" value="城乡居民医疗保险"> 城乡居民医疗保险</option>
                            <option class="" value="缝纫设备维修"> 缝纫设备维修</option>
                            <option class="" value="针灸"> 针灸</option>
                            <option class="" value="太极拳"> 太极拳</option>
                            <option class="" value="微波炉维修"> 微波炉维修</option>
                            <option class="" value="酒店代订"> 酒店代订</option>
                            <option class="" value="洗衣机维修"> 洗衣机维修</option>
                            <option class="" value="城乡居民养老保险"> 城乡居民养老保险</option>
                            <option class="" value="政策咨询"> 政策咨询</option>
                            <option class="" value="拔火罐"> 拔火罐</option>
                            <option class="" value="旅游资讯查询"> 旅游资讯查询</option>
                            <option class="" value="墙缝修补"> 墙缝修补</option>
                            <option class="" value="政策宣传"> 政策宣传</option>
                            <option class="" value="不住家保姆"> 不住家保姆</option>
                            <option class="" value="申请廉租房"> 申请廉租房</option>
                            <option class="" value="墙面粉刷"> 墙面粉刷</option>
                            <option class="" value="宠物医疗"> 宠物医疗</option>
                            <option class="" value="代订机票"> 代订机票</option>
                            <option class="" value="优抚优待"> 优抚优待</option>
                            <option class="" value="电视机维修"> 电视机维修</option>
                            <option class="" value="老人陪护"> 老人陪护</option>
                            <option class="" value="宠物托管"> 宠物托管</option>
                            <option class="" value="宠物美容"> 宠物美容</option>
                            <option class="" value="空调维修"> 空调维修</option>
                            <option class="" value="搬家服务"> 搬家服务</option>
                            <option class="" value="钟点工"> 钟点工</option>
                            <option class="" value="租车"> 租车</option>
                            <option class="" value="冰箱维修"> 冰箱维修</option>
                            <option class="" value="住家保姆"> 住家保姆</option>
                            <option class=""  value="水电代缴"> 水电代缴</option>
                        </select>
                    </div></td></tr>
                    <tr><td>
                        <div>服务项目：<input type="text" id="siItem1" name="siItem" ></div></td>
                        <td>
                    <div>收费模式：<select id="siType1" name="siType">
                        <option value="">--请选择--</option>
                        <option value="1" selected="selected">按小时</option>
                        <option value="2">按次数</option>
                        <option value="3">免费</option>
                    </select>
                    </div></td></tr>
                        <tr><td>
                    <div>收费单价：<input type="text" id="siPrice1" name="siPrice" ></div></td>
                     <td>
                    <div>服务内容：<input type="text" id="siDesc1" name="siDesc" ></div></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="saveadd">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div>
    <div class="modal fade bs-example-modal-lg shanchu" id="shanchu" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <form action="/item/shanchu" method="post"></form>
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">信息</h4>
                </div>
                <div class="modal-body">
                    <span> 确定要删除<span id="siId"/>服务么？</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" id="saveshanchu">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/serviceitem.js"></script>

</body>
</html>
