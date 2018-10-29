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
            <div class="col-md-1 text-center"><a href="/serviceitem"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span> 服务项目</span></a></div>
            <div class="col-md-1 text-center"><a href="/preservice"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>工单管理</span></a></div>

        </div>
        <div class="col-md-2"><jsp:include  page="include.jsp"/></div>
    </div>

</header>
<section class="content" >
    <div class="col-md-12">
        <form class="form" id="form" method="post" action="/serviceInfo">
        <fieldset class="fieldest">
        <legend class="fieldest-legend">
           <span class="span">服务商基本信息</span>
        </legend>
        <div class="col-md-4">
                <div >
                    <span >商家名称</span>
                    <input type="text" id="sName" class="sName"  value="${tService.sName}" name="sName">
                </div>
                <div >
                    <span >管理人员</span>
                    <input type="text" id="sUser" class="sUser"  value="${tService.sUser}" name="sUser">
                </div>
               <div  >
                <span >周末服务</span>
                   <select id="sInfo3" value="${tService.sInfo3}" name="sInfo3">
                       <option value="">----请选择----</option>
                       <option value="1" >是</option>
                       <option value="2">否</option>
                   </select>
            </div>

        </div>
        <div class="col-md-4">
                <div >
                    <span >服务状态</span>
                    <select id="sInfo2" value="${tService.sInfo2}" name="sInfo2">
                        <option value="">----请选择----</option>
                        <option value="1">正常服务</option>
                        <option value="2">停止服务</option>
                    </select>
                </div>
                <div >
                    <span >手机号码</span>
                    <input type="text" id="infoTel" class="infoTel"  value="${tService.tUserInfo.infoTel}" name="infoTel">
                </div>
               <div >
                <span >执照号码</span>
                <input type="text" id="sNumber" class="sNumber"  value="${tService.sNumber}" name="sNumber">
            </div>
        </div>
        <div class="col-md-4">
            <button class="btn" name="update" >修改</button>
        </div>
</fieldset>
        <fieldset class="fieldest">
            <legend class="fieldest-legend">
                <span class="span">服务商其他信息</span>
            </legend>
            <div class="col-md-12">
                <div class="col-md-4">
                        <div >
                            <span >商家地址</span>
                            <input type="text" id="sAddress" class="sAddress"  value="${tService.sAddress}" name="sAddress">
                        </div>
                </div>
                <div class="col-md-4">
                        <div >
                            <span >社区编号</span>
                            <input type="text" id="sCnum" class="sCnum"  value="${tService.sCnum}" name="sCnum" >
                        </div>
                    </div>
                <div class="col-md-4">
                        <div >
                            <span >商家状态</span>
                            <select id="sFlag" value="${tService.sFlag}" name="sFlag">
                                <option value="" >----请选择----</option>
                                <option value="1" >正常营业</option>
                                <option value="2" >店铺关闭</option>
                            </select>
                        </div>
                </div>
            </div>
            <div class="col-md-12">
                        <div >
                            <span >商家描述</span>
                             <textarea name="sDescribe" id="sDescribe" style="width:67%;height:160px;" class="sDescribe"  value="${tService.sDescribe}"></textarea>
                        </div>
            </div>
        </fieldset>
            <div class="formsubmit">
                <button class="btn-submit" type="submit" id="saveInfo" >保存</button>
                <button class="btn-return" type="button" onclick="fanhui(this)">返回</button>
            </div>
        </form>
    </div>
</section>




<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function fanhui(obj){
        window.location.href="/index";
    }
    $(function () {
        var Json=${tServiceJson};
        console.log(Json);
        $("#sInfo3").val(Json.sInfo3);
        $("#sInfo2").val(Json.sInfo2);
        $("#sFlag").val(Json.sFlag);
    })
</script>
</body>
</html>
