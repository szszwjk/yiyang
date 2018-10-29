<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="col-md-8">
                <div class="col-md-1 text-center"><a href="/"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded">
                    <span>首页</span></a></div>
                <div class="col-md-1 text-center"><a href="/dangan" ><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                    <span>档案管理</span></a></div>
                <div class="col-md-1 text-center"><a href="/gongdan" ><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                    <span>工单管理</span></a></div>
                <%--<div class="col-md-1 text-center"><a href="/tousu" ><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">--%>
                    <%--<span>投诉管理</span></a></div>--%>
                <%--<div class="col-md-1 text-center"><a href="/yujing"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">--%>
                    <%--<span>预警信息</span></a></div>--%>

        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>
    </div>
</header>
<section class="content">

    <%--页面左栏子菜单栏--%>
    <div class="col-md-2">
        <div class="tabTip">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" ><a href="#home" role="tab" data-toggle="tab" id="showlist">老人档案</a></li>
                <li role="presentation" ><a href="#profile" role="tab" data-toggle="tab" id="Dlist">家庭医生</a></li>
                <li role="presentation"><a href="#profile1" role="tab" data-toggle="tab" id="Slist">服务商</a></li>
            </ul>
        </div>
    </div>

    <div class="col-md-10" >

        <div class="tabContent" style="padding: 10px ">
            <%--<div style="font-size: 20px;color: red ;text-align:center;">功能已全部实现 如若发现异常 不妨多点几下 </div>--%>
            <!-- 面板区 -->
            <div class="tab-content">
                <%--档案页面之老人档案DIV--%>
                <div role="tabpanel" class="tab-pane active" id="home"  >
                    <h1> <small>老人档案</small></h1>
                    <%--页面中上部进行查询的div--%>
                        <div  >
                        <form action="/chaxun" method="get">
                         &nbsp &nbsp &nbsp
                        姓名：<input type="text" width="50px" name="userName" value="${name}">
                        手机号码：<input type="text" width="50px" name="phoneNum"  value="${tel}">
                         &nbsp &nbsp &nbsp
                         <button  type="submit" class="btn btn-default">查询</button>

                        </form>
                    </div>
                        <div >

                            <%--进行显示操作的模态框--%>
                            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel1">老人详细信息</h4>
                                        </div>

                                            <div class="modal-body">
                                                <div >身份证：<input type="text " value ="${tparent.pIdnum}" readonly/>  &nbsp; &nbsp; &nbsp;出生地：<input type="text " value ="${tparent.pBirthplace}" readonly/></div>
                                                <hr/>
                                                <div >居住地：<input type="text " value ="${tparent.pAddress}" readonly/>  &nbsp; &nbsp; &nbsp;社区号：<input type="text " value ="${tparent.pCnum}"readonly /></div>
                                                <hr/>
                                                <div >过敏史：<input type="text " value ="${tparent.pInfo1}" readonly/>  &nbsp; &nbsp; &nbsp;外 &nbsp; &nbsp;伤：<input type="text " value ="${tparent.pInfo2}" readonly/></div>
                                                <hr/>
                                                <div >手术史：<input type="text " value ="${tparent.pInfo3}" readonly/>  &nbsp; &nbsp; &nbsp;遗传病：<input type="text " value ="${tparent.pInfo4}" readonly/></div>
                                                <hr/>
                                                <div >国 &nbsp; &nbsp;籍：<input type="text " value ="${tparent.pNationality}" readonly/>  &nbsp; &nbsp; &nbsp;血 &nbsp; &nbsp;型：<input type="text " value ="${tparent.pBlood}"readonly /></div>
                                                <hr/>
                                                <div >学 &nbsp; &nbsp;历：<input type="text " value ="${tparent.pEducational}" readonly/></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>


                                            </div>

                                    </div>
                                </div>
                            </div>

                            <%--进行更新的模态框--%>
                            <div class="modal fade" id="myModa12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel2">老人信息</h4>
                                        </div>
                                        <form action="UD" method="post">
                                            <div class="modal-body">

                                                <div >学 &nbsp; &nbsp;历：<input type="text " value ="${update.pEducational}" name="xueli"/> &nbsp; &nbsp; &nbsp;出生地：<input type="text " value ="${update.pBirthplace}" name="chushengdi"/></div>
                                                <hr/>
                                                <div >居住地：<input type="text " value ="${update.pAddress}" name="juzhudi"/>  &nbsp; &nbsp; &nbsp;社区号：<input type="text " value ="${update.pCnum}" name="shequhao"/></div>
                                                <hr/>
                                                <div >过敏史：<input type="text " value ="${update.pInfo1}" name = "guominshi"/>  &nbsp; &nbsp; &nbsp;外 &nbsp; &nbsp;伤：<input type="text " value ="${update.pInfo2}" name="waishang"/></div>
                                                <hr/>
                                                <div >手术史：<input type="text " value ="${update.pInfo3}" name = "shoushushi"/>  &nbsp; &nbsp; &nbsp;遗传病：<input type="text " value ="${update.pInfo4}" name="yichuanbing"/></div>
                                                <hr/>
                                                <div >国 &nbsp; &nbsp;籍：<input type="text " value ="${update.pNationality}" name="guoji"/>  &nbsp; &nbsp; &nbsp;血 &nbsp; &nbsp;型：<input type="text " value ="${update.pBlood}" name="xuexing"/></div>
                                                <hr/>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <button type="submit" class="btn btn-primary" >保存</button>
                                    </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                    <table class="table table-condensed table-striped" >
                        <thead>
                        <tr><th ></th><th style="text-align: center">序号</th> <th style="text-align: center">姓名</th><th style="text-align: center" >性别</th><th style="text-align: center">年龄</th><th style="text-align: center">身份证号</th><th  style="text-align: center">手机号码</th><th  style="text-align: center">民族</th><th  style="text-align: center">婚姻</th><th  style="text-align: center ;width: 107px">健康档案</th><th  style="text-align: center">操作</th></tr>
                        </thead>
                        <%--<c:if test = "${!empty list}">--%>
                        <%--循环输出从后台获取到的值，并且在按钮上绑定数据--%>
                        <c:forEach items="${list}"  var="TUserInfo" >
                         <tr>   <th style="width: 50px" style="text-align: center"><input type="checkbox"></th>
                                <th style="text-align:center">${TUserInfo.infoId}  </th>
                                <th style="text-align: center">${TUserInfo.infoName} </th>
                                <th style="text-align: center">${TUserInfo.infoSex} </th>
                                <th style="text-align: center">${118-TUserInfo.infoAge.year} </th>
                                <th width="200px" style="text-align: center">${TUserInfo.tParent.pIdnum} </th>
                                <th width="150px" style="text-align: center">${TUserInfo.infoTel} </th>
                                <th style="text-align: center">${TUserInfo.infoNation} </th>
                                <th style="text-align: center">${TUserInfo.infoMarriage} </th>
                             <th style="text-align: center ;width: 107px" ><form action="#" method="get" ><button  name = "ID" style="float: inherit; " type="submit" class=" btn btn-success" data-toggle="modal" data-target="#myModal1" value="${TUserInfo.tParent.pIdnum}">健康档案</button></form></th>
                             <th style="text-align: center ;width: 107px" ><form action="#" method="get" ><button  name = "act" style="float: inherit; " type="submit" class=" btn btn-success" data-toggle="modal" data-target="#myModa12"  value="${TUserInfo.tParent.pIdnum}">编辑</button></form></th>
                        </tr>
                        </c:forEach>

                    </table>
                </div>
                <%--档案页面之医生档案DIV--%>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <h1> <small>家庭医生</small></h1>
                    <div  >
                        <form action="/chaxunYS" method="get">
                            &nbsp &nbsp &nbsp
                            姓名：<input type="text" width="50px" name="DoctorName">
                            医院：<input type="text" width="50px" name="HospitalName" >
                            &nbsp &nbsp &nbsp
                            <button  type="submit" class="btn btn-default">查询</button>
                        </form>
                        <hr/>

                        <table class="table table-condensed table-striped" >
                            <thead>
                            <tr><th ></th> <th style="text-align: center">姓名</th><th style="text-align: center" >所属医院</th><th style="text-align: center">社区编号</th><th style="text-align: center">所属科室</th><th  style="text-align: center">居住地</th></tr>
                            </thead>


                            <c:forEach items="${result}"  var="TDoctor" >
                                <tr>
                                    <th style="width: 50px" style="text-align: center"><input type="checkbox"></th>
                                    <th style="text-align:center">${TDoctor.dUser}  </th>
                                    <th style="text-align: center">${TDoctor.dHname} </th>
                                    <th style="text-align: center">${TDoctor.dCnum} </th>
                                    <th style="text-align: center">${TDoctor.dInfo1} </th>
                                    <th style="text-align: center">${TDoctor.dAddress} </th>
                                    <%--<th style="text-align: center ;width: 107px" ><form action="#" method="get" ><button  name = "bianji" style="float: inherit; " type="submit" class=" btn btn-success" data-toggle="modal" data-target="#myModal3" value="${TDoctor.dUser}">编辑</button></form></th>--%>

                                </tr>
                            </c:forEach>
                        </table>

                    </div>

                </div>
                <%--档案页面之服务商DIV--%>
                <div role="tabpanel" class="tab-pane" id="profile1">
                    <h1> <small>服务商</small></h1>

                <div>
                    <form action="/chaxunFW" method="get" id = "123">
                        &nbsp &nbsp &nbsp
                        姓名：<input type="text" width="50px" name="ServiceName">
                        医院：<input type="text" width="50px" name="ServiceNumber" >
                        &nbsp &nbsp &nbsp
                        <button  type="submit" class="btn btn-default">查询</button>
                    </form>
                    <hr/>

                    <table class="table table-condensed table-striped" >
                        <thead>
                        <tr><th ></th> <th style="text-align: center">服务商名称</th><th style="text-align: center" >执照号码</th><th style="text-align: center">所属编号</th><th style="text-align: center">服务状态</th><th  style="text-align: center">所在地</th><th  style="text-align: center">周末是否服务</th></tr>
                        </thead>


                        <c:forEach items="${ServiceResult}"  var="TService" >
                            <tr>
                                <th style="width: 50px" style="text-align: center"><input type="checkbox"></th>
                                <th style="text-align:center">${TService.sUser}  </th>
                                <th style="text-align: center">${TService.sNumber} </th>
                                <th style="text-align: center">${TService.sCnum} </th>
                                <th style="text-align: center">${TService.sInfo2} </th>
                                <th style="text-align: center">${TService.sAddress} </th>
                                <th style="text-align: center">${TService.sInfo2} </th>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
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
