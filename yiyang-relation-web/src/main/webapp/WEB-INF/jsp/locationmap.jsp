<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/15
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

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
    <title>地图定位</title>
</head>
<body style="height: 100%; margin: 0">
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
<div class="col-md-12" >

    <div class="tabContent" style="padding: 10px">
        <!-- 面板区 -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home" style="overflow-x:auto;height: 640px;">
                <form class="form-horizontal" id="myform">
                    <div class="form-group">
                        <div class="col-md-3">
                            <div style="float: left;"><label for="sitem" class="" style="line-height: 34px">用户名</label></div>
                            <div class="myselect">
                                <input type="" class="form-control" id="sitem">
                            </div>
                        </div>
                        <div class="col-md-9">
                            <button type="button" class="btn btn-info " style="width:70px;" id="selectlist">查询</button>

                        </div>
                    </div>
                </form>
                <div id="container" style="height: 100%"></div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">



            </div>
        </div>
    </div>

</div>


</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=3.0&ak=q1bo9jUSsVNNC8oKsPoB1nTuzkhiFDR7%22&services=&t=20180914170655"></script>
<script type="text/javascript">
    $(function () {

        $("#selectlist").click(function () {
            var pUser=$("#sitem").val()
            $.post("/relation/getlocation",{pUser:pUser},function (data) {
               if(data=="")
               {
                   alert("暂无数据")
                   return;
               }

                var map = new BMap.Map("container");
                // 创建地图实例
                var mapStyle={  style : "midnight" }
                map.setMapStyle(mapStyle);
                map.enableScrollWheelZoom();
                //滚轮
                var opts = {offset: new BMap.Size(150, 5)}
                map.addControl(new BMap.NavigationControl(opts));

                 var pointStr = data.split(",");

                var pointArr = [];

                for (var k = 0; k < pointStr.length; k += 2) {
                    pointArr.push({
                        lng: pointStr[k],
                        lat: pointStr[k + 1]
                    });
                }
                // 生成坐标点
                var trackPoint = [];
                for (var i = 0, j = pointArr.length; i < j; i++) {
                    trackPoint.push(new BMap.Point(pointArr[i].lng, pointArr[i].lat));
                }
                map.centerAndZoom(trackPoint[0], 15);

                // 画线
                var polyline = new BMap.Polyline(trackPoint, {
                    strokeColor: "#ffffff",
                    strokeWeight: 3,
                    setStrokeStyle:"dashed",
                    strokeOpacity: 1
                });
                map.addOverlay(polyline);
                // 配置图片
                var size = new BMap.Size(22, 22);
                var offset = new BMap.Size(0, 0);
                var imageSize = new BMap.Size(20, 20);
                var icon = new BMap.Icon("../img/doctor3.png", size, {
                    imageSize: imageSize,
                    infoWindowAnchor:new BMap.Size(0, -3)
                });


                // 画图标
                for (var i = 0, j = trackPoint.length; i < j; i++) {
                    var marker = new BMap.Marker(trackPoint[i], {
                        icon: icon,
                        offset: offset
                    }); // 创建标注
                    map.addOverlay(marker);
                    marker.addEventListener("click",function () {
                        // alert(this.getPosition())
                        var point=this.getPosition();
                        alert("经度："+point.lng+"\n"+"纬度："+point.lat)
                    })

                }

                //根据经纬极值计算绽放级别。 (从网上复制)
                function getZoom(maxLng, minLng, maxLat, minLat) {
                    var zoom = ["50", "100", "200", "500", "1000", "2000", "5000", "10000", "20000", "25000", "50000", "100000", "200000", "500000", "1000000", "2000000"]; // 级别18到3。
                    var pointA = new BMap.Point(maxLng, maxLat); // 创建点坐标A
                    var pointB = new BMap.Point(minLng, minLat); // 创建点坐标B
                    var distance = map.getDistance(pointA, pointB).toFixed(1); //获取两点距离,保留小数点后两位
                    for (var i = 0, zoomLen = zoom.length; i < zoomLen; i++) {
                        if (zoom[i] - distance > 0) {
                            return 18 - i + 3; //之所以会多3，是因为地图范围常常是比例尺距离的10倍以上。所以级别会增加3。
                        }
                    }
                }

                //  (从网上复制)
                function setZoom(points) {
                    if (points.length > 0) {
                        var maxLng = points[0].lng;
                        var minLng = points[0].lng;
                        var maxLat = points[0].lat;
                        var minLat = points[0].lat;
                        var res;
                        for (var i = points.length - 1; i >= 0; i--) {
                            res = points[i];
                            if (res.lng > maxLng) maxLng = res.lng;
                            if (res.lng < minLng) minLng = res.lng;
                            if (res.lat > maxLat) maxLat = res.lat;
                            if (res.lat < minLat) minLat = res.lat;
                        }
                        var cenLng = (parseFloat(maxLng) + parseFloat(minLng)) / 2;
                        var cenLat = (parseFloat(maxLat) + parseFloat(minLat)) / 2;
                        var zoom = getZoom(maxLng, minLng, maxLat, minLat);
                        map.centerAndZoom(new BMap.Point(cenLng, cenLat), zoom);
                    } else {
                        //没有坐标，显示全中国
                        map.centerAndZoom(new BMap.Point(103.388611, 35.563611), 5);
                    }
                }
                setZoom(pointArr);
            })
        })
            })



</script>
</html>
