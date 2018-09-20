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

    <title>服务中心</title>
    <!-- 引入 echarts.js -->
    <script src="../lib/echarts.js"></script>
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
    <script src="../js/index.js"></script>
    <![endif]-->
    <link rel="sty">
</head>


<body>
<header>

    <div class="row">
        <div class="col-md-2">.col-md-8</div>
        <div class="col-md-8">
            <div class="col-md-1 text-center"><img src="../img/layout_icon_home.jpg" alt="..." class="img-rounded">
                <span>首页</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jiance.jpg" alt="..." class="img-rounded">
                <span>档案管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_jianhu.jpg" alt="..." class="img-rounded">
                <span>工单管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_doc.jpg" alt="..." class="img-rounded">
                <span>投诉管理</span></div>
            <div class="col-md-1 text-center"><img src="../img/layout_icon_service.jpg" alt="..." class="img-rounded">
                <span>预警管理</span></div>

        </div>
        <div class="col-md-2">.col-md-4</div>
    </div>

</header>
<section class="content">

    <div class="col-md-12" >

        <div class="tabContent" style="padding: 10px">
            <div class="row">
                <div class="col-md-4" style="height: 320px ;width: 30%" id = "11"></div>
                <script type="text/javascript">

                    // 基于准备好的dom，初始化echarts实例
                    var myChart11 = echarts.init(document.getElementById('11'));

                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '工单统计'
                        },
                        tooltip: {},
                        legend: {
                            data:['销量']
                        },
                        xAxis: {
                            data: ["已处理","待付款","未处理","已回返"]
                        },
                        yAxis: {},
                        series: [{
                            name: '销量',
                            type: 'bar',
                            data: [5, 20, 36, 10]
                        }]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart11.setOption(option);
                </script>
                <div class="col-md-4" style="height: 320px ;width: 30%" id = "12"></div>
                <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    var myChart12 = echarts.init(document.getElementById('12'));

                        // 指定图表的配置项和数据
                        var option = {
                            title: {
                                text: '工单回访情况统计',
                                subtext: '仅供参考',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: ['已回返', '未回返']
                            },
                            series: [
                                {
                                    name: '访问来源',
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: [ {value:335, name:'已回返'},
                                            {value:310, name:'未回返'}],
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
                        myChart12.setOption(option)



                </script>
                <div class="col-md-4" style="height: 320px  " id = "13"></div>
              <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    var myChart13 = echarts.init(document.getElementById('13'));

                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '未处理告警信息统计'
                        },
                        tooltip: {},
                        legend: {
                            data:['值']
                        },
                        xAxis: {
                            data: ["收缩血压","空腹血糖","餐后血糖","血氧","BMI","脂肪","尿酸","腰臀比"   ]
                        },
                        yAxis: {},
                        series: [{
                            name: '销量',
                            type: 'bar',
                            data: [5, 20, 36, 10, 10, 20,56,23]
                        }]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart13.setOption(option);




                </script>
            </div>
            <div class="row">
                <div class="col-md-4" style="height: 320px ;width: 100%" id = "21"></div>

                <script type="text/javascript">
                    // 基于准备好的dom，初始化echarts实例
                    <%--var user='<%=request.getAttribute("list")%>';--%>
                    <%--console.log(user);--%>
                    var val= JSON.parse(${list}) ;
                        console.log(val);
                    var myChart21 = echarts.init(document.getElementById('21'));

                    // 指定图表的配置项和数据
                    var  option = {
                xAxis: {
                type: 'category',
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                },
                yAxis: {
                type: 'value'
                },
                series: [{
                data: [820, 932, 901, 934, 1290, 1330, 1320],
                type: 'line'
                }]
                };myChart21.setOption(option);
                </script>


    </div>

        </div>

    </div>
</section>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/index.js"></script>
</body>
</html>
