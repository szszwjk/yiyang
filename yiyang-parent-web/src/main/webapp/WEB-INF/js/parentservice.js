
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


    $home=$("#home");
    $largelist=$("#largelist");
    //搜索条件切换 页数归一
    $largelist.change(function () {
        var options=$("#littlelist option");
        nowpage=1;
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
    })
    //换页显示
    $showlist=$("#showlist");
    $showlist.click(function () {
        $("#mytable").css("display","");
        $("#pt").css("display","");
    });
    $selectlist=$("#selectlist");
    $hlist=$("#hlist");
    //换页隐藏
    $hlist.click(function () {
        $("#mytable").css("display","none");
        $("#pt").css("display","none");
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
            if((pagenum-nowpage)>10)
            {
                tlength=10;
            }
            else{
                tlength=pagenum-nowpage;
            }
            console.log(pagenum);
            var string=" <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
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
                    "<td><a href=\"#\">查看详情</a> <a href=\"#\">预定</a></td>" +
                    "</tr>"

            }
            string+="</table>";
            $home.after(string);
            var pagebt="<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a   aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "</li>";
            for (var i=1;i<=tlength;i++)
            {
                pagebt+="<li><a  href=\"#\" onclick=\"pageclick(this)\">"+i+"</a></li>"
            }
            pagebt+="<li><a  >...</a></li>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
            $("#mytable").after(pagebt)
        });
    })
});



function pageclick(obj) {
    var flag =$(obj).text();
    if(nowpage==flag)
    {
        return;
    }
    if(flag=="<<")
    {

        if(nowpage==1)
        {
            console.log(nowpage);
            return;
        }
        nowpage--;

    }else if(flag==">>")
    {
        if(nowpage==pagenum)
        {
            console.log(nowpage);
            return;
        }
        nowpage++;
    }else{
        nowpage=flag;
    }
    $("#mytable").remove();
    var largeval=largedata[$largelist.val()]==null?"":largedata[$largelist.val()];
    var littleval=$littlelist.val();
    $.post("/item/list",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){


        var string=" <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
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
                "<td><a href=\"#\">查看详情</a> <a href=\"#\">预定</a></td>" +
                "</tr>"

        }
        string+="</table>";
        $home.after(string);

            if((pagenum-nowpage)>10)
            {
                tlength=10;
            }
            else{
                tlength=pagenum-nowpage;
            }
            $("#pt").remove();
            var pagebt="<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a  aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "</li>";
            for (var i=0;i<=tlength;i++)
            {
               var t=Number(nowpage)+Number(i);
                pagebt+="<li><a  onclick=\"pageclick(this)\">"+t+"</a></li>"
            }
            if(tlength==10)
            {
                pagebt+="<li><a  >...</a></li>";
            }
            pagebt+="<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
            $("#mytable").after(pagebt)


    });


}