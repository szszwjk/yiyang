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
           <%-- <div class="col-md-1 text-center"><a href="/"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded">
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
                <span>个人账户</span></a></div>--%>
        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content">


    <div class="col-md-2">
        <div class="tabTip">

            <button class="btn btn-default" style="width: 199px" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                首页
            </button>
            <div class="collapse" id="collapseExample" >
                <div class="well" style="padding:10px 10px 10px 10px; margin-bottom: 10px;">
                    <ul class="nav nav-pills nav-stacked" role="tablist">
                        <li role="presentation"  ><a href="#home" role="tab" data-toggle="tab" id="showlist"  style="height: 30px;line-height: 15px;">个人信息</a></li>
                        <li role="presentation" ><a href="#profile" role="tab" data-toggle="tab" id="hlist" style="height: 30px;line-height: 15px; margin-top: 10px;">用户统计</a></li>
                    </ul>
                </div>
            </div>
            <button class="btn btn-default" style="width: 199px" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                权限管理
            </button>
            <div class="collapse" id="collapseExample1" >
                <div class="well" style="padding:10px 10px 10px 10px;">
                    <ul class="nav nav-pills nav-stacked" role="tablist">
                        <li role="presentation"  ><a href="#profile1" role="tab" data-toggle="tab" id="showlist1"  style="height: 30px;line-height: 15px;">用户查看</a></li>
                        <li role="presentation" ><a href="#profile2" role="tab" data-toggle="tab" id="hlist1" style="height: 30px;line-height: 15px; margin-top: 10px;">权限管理</a></li>
                    </ul>
                </div>
            </div>

           <%-- <ul class="nav nav-pills nav-stacked" role="tablist">
                <a class="btn btn-default" style="width: 199px" href="#profile1" role="tab" data-toggle="tab" id="showlist1">账户信息</a>
                <a class="btn btn-default" style="width: 199px" href="#profile2" role="tab" data-toggle="tab" id="hlist1">修改密码</a>
            </ul>--%>
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
                            <tr> <td>联系方式:&nbsp;</td><td><input type="text" class="form-control" value="${item.tUserInfo.infoTel}" id="infoTel" name="tUserInfo.infoTel" readonly></td><td>生日:</td><td><input type="text" class="form-control"  id="age" name="tUserInfo.infoAge" readonly></td></tr>
                            <tr> <td>所属部门:&nbsp;</td><td><input type="text"  value="${item.yDepartment}" class="form-control" readonly></td><td>年龄:&nbsp;</td><td><div><input type="text" class="form-control" id="age1" readonly></div></td></tr>
                            <tr> <td>民族:&nbsp;</td><td> <select class="form-control " style="width:400px;" id="infoNation" name="tUserInfo.infoNation"  disabled>
                                <option>汉族</option>
                                <option>其他</option>

                            </select></td><td>邮箱:&nbsp;</td><td><input type="text" class="form-control" value="${item.yEmail}" readonly></td></tr>
                            <tr> <td><button type="button" class="btn btn-default" style="width:111px;" onclick="uplodebt()">上传图片</button> </td><td><button type="button" class="btn btn-default" style="width:111px;" id="ebt" onclick="editinfo()">修改</button>
                                <button type="button" class="btn btn-default hidden" style="width:111px;" id="sbt" onclick="saveinfo()">保存</button></td><td></td><td>

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
                <div role="tabpanel" class="tab-pane" id="profile" style="overflow-x:auto;height: 700px; ">
                    <div id="container" style="height: 600px;width: 613px ;float:right"></div>
                    <div id="container2" style="height: 600px;width: 613px;float:right;"></div>

                </div>
                <div role="tabpanel" class="tab-pane" id="profile1" style="overflow-x:auto;height: 700px; ">
                    <form class="form-horizontal" id="myform1">
                        <div class="form-group">
                            <div class="col-md-3">
                                <div style="float: left;"><label for="iHname" class="" style="line-height: 34px">用户名</label></div>
                                <div class="myselect">
                                    <input class="form-control" type="text" id="iHname" name="tUserInfo.infoUser">
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="iInfo1" class="" style="line-height: 34px">用户类别</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="iInfo1" name="authorityGroup">
                                        <option value="">-请选择-</option>
                                        <option value="parent">老人</option>
                                        <option value="service">服务商</option>
                                        <option value="relation">子女</option>
                                        <option value="doctor">医生</option>
                                        <option value="cadmin">社区管理员</option>
                                        <option value="admin">后台管理员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectinspection">查询</button>
                            </div>
                        </div>
                    </form>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-sm addInspection" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-sm " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >权限查看</span>
                                </div>
                                <div style="margin-left: 30px;" class="checkbox">
                                    <table>
                                        <tr><td> <label >
                                            <input type="checkbox" id="inlineCheckbox1" value="parent" disabled>
                                        </label></td><td>老人</td></tr>
                                        <tr><td>  <label >
                                            <input type="checkbox" id="inlineCheckbox2" value="doctor" disabled>
                                        </label></td><td>医生</td></tr>
                                        <tr><td> <label >
                                            <input type="checkbox" id="inlineCheckbox3" value="service" disabled>
                                        </label></td><td>服务商</td></tr>
                                        <tr><td>  <label >
                                            <input type="checkbox" id="inlineCheckbox4" value="relation" disabled>
                                        </label></td><td>子女</td></tr>
                                        <tr><td>  <label >
                                            <input type="checkbox" id="inlineCheckbox5" value="cadmin" disabled>
                                        </label></td><td>社区管理员</td></tr>
                                        <tr><td>  <label >
                                            <input type="checkbox" id="inlineCheckbox6" value="admin" disabled>
                                        </label></td><td>后台管理员</td></tr>
                                        <tr><td><input type="text" id="username" class="hidden"></td></tr>
                                    </table>
                                </div>
                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default" id="editbt"  onclick="editauthority()">修改</button>
                                        <button type="button" class="btn btn-default hidden" id="savebt"  onclick="saveauthority()">保存</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile2" style="overflow-x:auto;height: 700px; ">
                    <form class="form-horizontal" id="myform2">
                        <div class="form-group">
                            <div class="col-md-3" >
                                <div style="float: left;"><label for="mInfo1" class="" style="line-height: 34px">用户类别</label></div>
                                <div class="myselect">
                                    <select class="form-control" id="mInfo1" name="authorityGroup">
                                        <option value="">-请选择-</option>
                                        <option value="parent">老人</option>
                                        <option value="service">服务商</option>
                                        <option value="relation">子女</option>
                                        <option value="doctor">医生</option>
                                        <option value="cadmin">社区管理员</option>
                                        <option value="admin">后台管理员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <button type="button" class="btn btn-info " style="width:70px;" id="selectauthority">查询</button>
                                <button type="button" class="btn btn-info " style="width:70px;" id="addauthority">新增</button>
                                <button type="button" class="btn btn-info " style="width:70px;float:right;" id="refresh">刷新</button>
                            </div>
                        </div>
                    </form>
                    <%--模态框--%>
                    <div class="modal fade bs-example-modal-lg addauthority" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg " role="document">
                            <div class="modal-content">
                                <div class="modal-header text-center">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <span class="modal-title " >权限查看</span>
                                </div>
                                <div style="margin-right: 30px;">
                                    <form id="aform">
                                        <table class="table text-right">
                                            <col style="width: 15%"/>
                                            <col style="width: 35%"/>
                                            <col style="width: 10%"/>
                                            <col style="width: 40%"/>
                                            <tr><td>类别:</td><td><select  class="form-control" id="tiHname" style="width: 300px" name="authorityGroup" disabled> <option value="">-请选择-</option>
                                                <option value="parent">老人</option>
                                                <option value="service">服务商</option>
                                                <option value="relation">子女</option>
                                                <option value="doctor">医生</option>
                                                <option value="cadmin">社区管理员</option>
                                                <option value="admin">后台管理员</option></select></td><td>地址:</td><td><input type="text" class="form-control" style="width: 300px" id="iItem" name="authorityCon" ></td></tr>
                                            <tr><td><input type="text" class="hidden" id="aid" name="aid"></td></tr>
                                        </table>
                                    </form>
                                </div>
                                <div class="modal-footer center">
                                    <div class="text-center">
                                        <button type="button" class="btn btn-default " id="addinfo">保存</button>
                                        <button type="button" class="btn btn-default " id="saveinfo">修改</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--end--%>

                </div>
            </div>
        </div>
    </div>


</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/echart/echarts.min.js"></script>
<script src="../js/laydate/laydate.js"></script>
<script src="../js/managerindex.js"></script>
<script>
$(function () {
    var info=${itemjson};
    var chartjson=${chartdata};
    var comunity=${comunitydata}
    $("#infoSex").val(info.tUserInfo.infoSex)
    var date=new Date(info.tUserInfo.infoAge)
    $("#age").val(date.format('yyyy-MM-dd'))
    $("#infoNation").val(info.tUserInfo.infoNation)

    $("#age1").val(jsGetAge(date.format('yyyy-MM-dd')))

    $("#hlist").click(function () {
        var arr=new Array()
        for(var i=0;i<chartjson.length;i++)
        {
            arr.push(chartjson[i].name)
        }
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title : {
                text: '用户类型统计',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: arr
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:chartjson,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
         arr=new Array()
        for(var i=0;i<comunity.length;i++)
        {
            arr.push(comunity[i].name)
        }
         dom = document.getElementById("container2");
         myChart = echarts.init(dom);
         app = {};
        option = {
            title : {
                text: '社区统计',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: arr
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:comunity,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }

    })
})
laydate.render({
    elem: '#age'

});
</script>
<script type="text/javascript">

</script>


</body>
</html>
