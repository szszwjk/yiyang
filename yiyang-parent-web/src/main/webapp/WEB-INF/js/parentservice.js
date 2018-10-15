
var $selectlist;
var $thead;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
var $hlist;
var $showlist;
var $largelist;
var $littlelist;
var siPrice;
var siType;
var $telnumber;
var $telgroup;
var recId;
var reg_tel=/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
var largedata=new Array("交通旅游","医疗救助","法律宣传","家政服务","申请低保","设备维修","房屋工程","医疗保险","代购代缴","教学工程","宠物工程")
// var littledata=new Array("热水器维修","气功","浴室维修","城乡居民医疗保险","缝纫设备维修","针灸","太极拳","微波炉维修","酒店代订","洗衣机维修","城乡居民养老保险","政策咨询" ,"拔火罐","旅游资讯查询","墙缝修补","政策宣传","不住家保姆","申请廉租房","墙面粉刷","宠物医疗","代订机票","优抚优待","电视机维修","老人陪护","宠物托管","宠物美容","空调维修","搬家服务","钟点工","租车","冰箱维修","住家保姆","水电代缴")
var littledata=new Object();
littledata[0]=new Array("酒店代订","旅游资讯查询","代订机票","租车");
littledata[1]=new Array("针灸","拔火罐");
littledata[2]=new Array("政策咨询","政策宣传");
littledata[3]=new Array("不住家保姆","老人陪护","搬家服务","钟点工","住家保姆");
littledata[4]=new Array("申请廉租房","优抚优待");
littledata[5]=new Array("热水器维修","缝纫设备维修","微波炉维修","洗衣机维修","电视机维修","空调维修","冰箱维修");
littledata[6]=new Array("浴室维修","墙缝修补","墙面粉刷");
littledata[7]=new Array("城乡居民医疗保险","城乡居民养老保险");
littledata[8]=new Array("水电代缴");
littledata[9]=new Array("气功","太极拳");
littledata[10]=new Array("宠物医疗","宠物托管","宠物美容");
$(function () {
    $telgroup=$("#telgroup")
    $telnumber=$("#psTelnumber");
    $home=$("#home");
    $largelist=$("#largelist");
    //搜索条件切换 页数归一
    $largelist.change(function () {
        var options=$("#littlelist option");
        nowpage=1;
        pagenum=1;
        for(var i=1;i<options.length;i++)
        {
            options[i].remove();
        }
        var largeval=$largelist.val();
        if(largeval=="")
        {
            return;
        }
        var item=littledata[largeval];
        for (var i=0;i<item.length;i++)
        {
            $("#littlelist").append("<option value='"+item[i]+"'>"+item[i]+"</option>");
        }

    });
    $littlelist=$("#littlelist");
    $littlelist.change(function () {
        nowpage=1;
        pagenum=1;
    })
    //换页显示
    $showlist=$("#showlist");
    $showlist.click(function () {
        $("#mytable").css("display","");
        $("#pt").css("display","");
        $("#hmytable").css("display","none");
        $("#hpt").css("display","none");
    });
    $selectlist=$("#selectlist");
    $hlist=$("#hlist");
    //换页隐藏
    $hlist.click(function () {
        $("#mytable").css("display","none");
        $("#pt").css("display","none");
        $("#hmytable").css("display","");
        $("#hpt").css("display","");
    });
    $selectlist.click(function () {
        nowpage=1;
        var largeval=largedata[$largelist.val()]==null?"":largedata[$largelist.val()];
        var littleval=$littlelist.val();
        $("#mytable").remove();
        $("#pt").remove();

        $.post("/item/list",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){
            total=data.total;
            pagenum=total%14==0?total/14:Math.floor(total/14)+1;

            var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable\" title=\"待处理工单\">" +
                "<thead id=\"thead\">" +
                "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>服务商</th><th >服务大类</th><th>服务小类</th><th>服务项</th><th >收费方式</th><th >操作</th></tr>" +
                "</thead>";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {

                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].siId+"</td>" +
                    "<td>"+list[i].siName+"</td>" +
                    "<td>"+list[i].siLarge+"</td>" +
                    "<td>"+list[i].siLittle+"</td>" +
                    "<td>"+list[i].siItem+"</td>" +
                    "<td>"+list[i].siPrice+"</td>" +
                    "<td><a href=\"#\" onclick=\"showdesc(this)\">查看详情</a> <a href=\"#\" onclick=\"acceptservices(this)\">预定</a></td>" +
                    "</tr>"

            }
            string+="</table>";
            $home.after(string);

            var pagebt=" <div style=\"float: right\" id=\"pt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"sel\" onchange=\"selchange()\">";
            for(var i=1;i<=pagenum;i++)
            {
                if(i==nowpage)
                {
                    pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
                }
                else{
                    pagebt+="<option value=\""+i+"\">"+i+"</option>";
                }
            }
            pagebt+="</select >页/共"+pagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"pageclick(this)\">首页</button>\n" +
                "<button class=\"btn btn-default\" value=\"2\" onclick=\"pageclick(this)\">上一页</button>\n" +
                "<button class=\"btn btn-default\" value=\"3\" onclick=\"pageclick(this)\">下一页</button>\n" +
                "<button class=\"btn btn-default\" value=\"4\" onclick=\"pageclick(this)\">尾页</button>"
            $("#mytable").after(pagebt)
        });
    })
    $("#todate").change(function () {
        console.log( $("#todate").val());

    })
    $("#serviceNum").change(function () {
        if(siType==3)
        {
            return;
        }
        var sum=$("#serviceNum").val()*siPrice;
        $("#serviceSum").val(sum);
    })
//电话验证
    $telnumber.focus(function () {
        $telgroup.removeClass('has-error has-feedback');
        $telgroup.removeClass('has-success has-feedback');
        $("#telgroup .sr-only").remove();
        $("#telgroup .glyphicon").remove();


    });

    $telnumber.blur(function () {
        var tel_text = $telnumber.val();
        if (tel_text == "") {

        }
        else if (reg_tel.test(tel_text)) {
            addsuccess( $telgroup);
            addSuccessAfter($telnumber);

        } else {

            adderror( $telgroup);
            addErrorAfter( $telnumber);

        }
    });

});
function preServices() {

    var $preServices=$("#preServices");

        $.post("/parent/order", $preServices.serialize(),function(data){
            if (data.status == 200) {
                alert("订购成功！");
                $('.accept-services').modal('toggle');

            } else {
                alert("订购失败，原因是：" + data.msg);
                console.log(data);
            }
        });


}
function showdesc(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    recId = $("#mytable tr:eq(" + rows + ") td:eq(1)").html();

    $.post("/item/desc",{"itemId":recId},function (data) {

        $("#siName").text(data.siName);
        $("#sAddress").text(data.sAddress);
        $("#infoTel").text(data.infoTel);
        $("#siItem").text(data.siItem);
        $("#siPrice").text(data.siPriceAndType);
        $("#siType").text(data.siType);
        $("#sInfo3").text(data.sInfo3);
        $("#siDesc").text(data.siDesc);
        $("#sNumber").text(data.sNumber);
    })
    $('.show-desc').modal('toggle');
}
function acceptservices(obj) {
    $telgroup.removeClass('has-error has-feedback');
    $telgroup.removeClass('has-success has-feedback');
    $("#telgroup .sr-only").remove();
    $("#telgroup .glyphicon").remove();
    var rows=obj.parentNode.parentNode.rowIndex;
    recId = $("#mytable tr:eq(" + rows + ") td:eq(1)").html();

    $("#todate").val("")
    $("#psUser").val("")
    $("#serviceNum").val("1")
    $("#psTelnumber").val("");
    $("#serviceDesc").val("");
    $("#psAddres").val("");

    $.post("/parent/preservice",{"itemId":recId},function (data) {
        console.log(data)
        siPrice=data.siPrice;
        siType=data.siType;
        var sum=$("#serviceNum").val()*data.siPrice;
        $("#serviceSum").val(sum);
        if(data.siType==1)
        {
            $("#serviceType").text("服务时长");
        }
        if(data.siType==2)
        {
            $("#serviceType").text("服务次数");
        }
        if(data.siType==3)
        {
            $("#serviceSum").val("0");
        }
        $("#serviceName").val(data.siName);
        $("#serviceTel").val(data.infoTel);
        $("#servicePrice").val(data.siPriceAndType);
        $("#psItem").val(data.siItem);
        $("#psPeople").val(data.sUser);
        $("#psItemId").val(recId);
    })

    $('.accept-services').modal('toggle');
}

function selchange() {
    nowpage=$("#sel").val();
    $("#mytable").remove();
    var largeval=largedata[$largelist.val()]==null?"":largedata[$largelist.val()];
    var littleval=$littlelist.val();
    $.post("/item/list",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){


        var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable\" title=\"待处理工单\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>服务商</th><th >服务大类</th><th>服务小类</th><th>服务项</th><th >收费方式</th><th >操作</th></tr>" +
            "</thead>";
        var list=data.rows;
        for(var i=0;i<list.length;i++)
        {

            string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                "<td>"+list[i].siId+"</td>" +
                "<td>"+list[i].siName+"</td>" +
                "<td>"+list[i].siLarge+"</td>" +
                "<td>"+list[i].siLittle+"</td>" +
                "<td>"+list[i].siItem+"</td>" +
                "<td>"+list[i].siPrice+"</td>" +
                "<td><a href=\"#\" onclick=\"showdesc(this)\">查看详情</a> <a href=\"#\">预定</a></td>" +
                "</tr>"

        }
        string+="</table>";
        $home.after(string);


        $("#pt").remove();

        var pagebt=" <div style=\"float: right\" id=\"pt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"sel\" onchange=\"selchange()\">";
        for(var i=1;i<=pagenum;i++)
        {
            if(i==nowpage)
            {
                pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
            }
            else{
                pagebt+="<option  value=\""+i+"\">"+i+"</option>";
            }
        }
        pagebt+="</select >页/共"+pagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"pageclick(this)\">首页</button>\n" +
            "<button class=\"btn btn-default\" value=\"2\" onclick=\"pageclick(this)\">上一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"3\" onclick=\"pageclick(this)\">下一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"4\" onclick=\"pageclick(this)\">尾页</button>"

        $("#mytable").after(pagebt)


    });

}


function pageclick(obj) {
    var flag =$(obj).val();
    if(flag==1)
    {
        nowpage=1;
    }
    if(flag==2)
    {

        if(nowpage==1)
        {
            console.log(nowpage);
            return;
        }
        nowpage--;

    }else if(flag==3)
    {
        if(nowpage==pagenum)
        {
            console.log(nowpage);
            return;
        }
        nowpage++;
    }
    if(flag==4){
        nowpage=pagenum;

    }
    $("#mytable").remove();
    var largeval=largedata[$largelist.val()]==null?"":largedata[$largelist.val()];
    var littleval=$littlelist.val();
    $.post("/item/list",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){


        var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable\" title=\"待处理工单\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>服务商</th><th >服务大类</th><th>服务小类</th><th>服务项</th><th >收费方式</th><th >操作</th></tr>" +
            "</thead>";
        var list=data.rows;
        for(var i=0;i<list.length;i++)
        {

            string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                "<td>"+list[i].siId+"</td>" +
                "<td>"+list[i].siName+"</td>" +
                "<td>"+list[i].siLarge+"</td>" +
                "<td>"+list[i].siLittle+"</td>" +
                "<td>"+list[i].siItem+"</td>" +
                "<td>"+list[i].siPrice+"</td>" +
                "<td><a href=\"#\" onclick=\"showdesc(this)\">查看详情</a> <a href=\"#\">预定</a></td>" +
                "</tr>"

        }
        string+="</table>";
        $home.after(string);


            $("#pt").remove();

        var pagebt=" <div style=\"float: right\" id=\"pt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"sel\" onchange=\"selchange()\">";
        for(var i=1;i<=pagenum;i++)
        {
            if(i==nowpage)
            {
                pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
            }
            else{
                pagebt+="<option  value=\""+i+"\">"+i+"</option>";
            }
        }
        pagebt+="</select >页/共"+pagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"pageclick(this)\">首页</button>\n" +
            "<button class=\"btn btn-default\" value=\"2\" onclick=\"pageclick(this)\">上一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"3\" onclick=\"pageclick(this)\">下一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"4\" onclick=\"pageclick(this)\">尾页</button>"

        $("#mytable").after(pagebt)


    });


}
function adderror(obj)
{
    obj.addClass('has-error has-feedback');
}
function addErrorAfter(obj)
{
    obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span><span id="inputError2Status" class="sr-only">(error)</span>');

}
function addsuccess(obj)
{
    obj.addClass('has-success has-feedback');
}
function addSuccessAfter(obj)
{
    obj.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span><span id="inputSuccess2Status" class="sr-only">(success)</span>');

}
