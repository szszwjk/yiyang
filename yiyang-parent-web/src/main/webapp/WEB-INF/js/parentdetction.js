var flag="xt";
var dom;
var myChart;
var maxdata;
var mindata;
$(function () {



    $("#xtlist").click(function () {

        flag ="xt";
    });
    $("#xylist").click(function () {
        flag = "xy";

    });
    $("#xllist").click(function () {
        flag = "xl";

    })
    $("#nearWeek").click(function () {
        console.log("aaa")
        $.post("/parent/neartime",{time:7,flag:flag},function (data) {
            // console.log(data);
            chart(data)
        })
    });
    $("#nearMonth").click(function () {
        console.log("bbb")
        $.post("/parent/neartime",{time:30,flag:flag},function (data) {
            // console.log(data);
            chart(data)
        })
    });
    $("#selectData").click(function () {
        console.log("ccc")
        $("#daItem").val(flag);
        $.post("/parent/betweenTime",$("#betweenTime").serialize(),function (data) {
            chart(data)
            // console.log(data);
        })
    });


    function chart(data) {
        var arrayX=new Array();
        var arrayY=new Array();
        for(var i=0;i<data.length;i++)
        {
            arrayX.push(data[i].daDate.split(" ")[0]);
            arrayY.push(Number(data[i].daValue));
        }

        var util;
        var titleText;
        if(flag=="xt")
        {
            maxdata=7.2;
            mindata=3.9;
            titleText='血糖指标';
            util='{value} mmol/L';
            // arrayX=new Array('2018-9-1', '2018-9-2', '2018-9-3', '2018-9-4', '2018-9-5', '2018-9-6', '2018-9-7');
            //  arrayY=new Array(3.9, 4.1, 6.1, 5.2, 5.5, 7.2, 3.0);
            dom = document.getElementById("xtchart");
        }if(flag=="xy")
        {
            mindata=94;
           maxdata=100;
            titleText='血氧指标';
            util='{value} %';
            // arrayX=new Array('2018-9-1', '2018-9-2', '2018-9-3', '2018-9-4', '2018-9-5', '2018-9-6', '2018-9-7');
            // arrayY=new Array(91, 95, 92, 98, 90, 96, 94);
            dom = document.getElementById("xychart");
        }
        if(flag=="xl")
        {
            maxdata=100;
            mindata=60;
            titleText='心率指标';
            util='{value} bpm';
            // arrayX=new Array('2018-9-1', '2018-9-2', '2018-9-3', '2018-9-4', '2018-9-5', '2018-9-6', '2018-9-7');
            // arrayY=new Array(67, 101, 85, 92, 87, 79, 80);
            dom = document.getElementById("xlchart");
        }

        myChart= echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title: {
                text: titleText,

            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            grid: {
                top: 40,    //距离容器上边界40像素
                bottom: 30   //距离容器下边界30像素
            },
            xAxis: {
                type: 'category',
                data: arrayX
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: util
                }
            },
            series: [{
                data: arrayY,
                type: 'line',

                markLine: {
                    data: [
                        {
                            yAxis: mindata, name: '最小值', label: {
                            normal: {

                                formatter: '最小值'
                            }
                        }
                        },
                        {
                            yAxis: maxdata, name: '警戒值', label: {
                            normal: {

                                formatter: '警戒值'
                            }
                        }
                        }


                    ]
                }
                , itemStyle: {normal: {label: {show: true}}}
            }]
        };


        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }
})