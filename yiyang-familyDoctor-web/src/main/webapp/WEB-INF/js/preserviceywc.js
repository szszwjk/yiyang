var $selectywclist;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
var $ywclist;
var $psUname3;
var $psTelnumber3;
$(function () {
    $home=$("#home");
    $psUname3=$("#psUname3");
    //搜索条件切换 页数归一
    $psUname3.change(function () {
        nowpage=1;
    });
    $psTelnumber3=$("#psTelnumber3");
    $psTelnumber3.change(function () {
        nowpage=1;
    })
    $ywclist=$("#ywclist");
    //换页隐藏
    $ywclist.click(function () {
        $("#mytable").css("display","none");
        $("#pt").css("display","none");
    });
    $selectywclist=$("#selectywclist");
    $selectywclist.click(function () {
        nowpage=1;
        var psUname3=$psUname3.val();
        var psTelnumber3=$psTelnumber3.val();
        $("#mytable").remove();
        $("#pt").remove();
        $.post("/item/ywclist",{page:nowpage,rows:14,psUname:psUname3,psTelnumber:psTelnumber3},function(data){
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
            var string=" <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"已完成工单\">" +
                "<thead id=\"thead\">" +
                "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务状态</th><th >完成时间</th><th >操作</th></tr>" +
                "</thead>";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {
                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].psId+"</td>" +
                    "<td>"+list[i].psNumber+"</td>" +
                    "<td>"+list[i].psUname+"</td>" +
                    "<td>"+list[i].psTelnumber+"</td>" +
                    "<td>"+list[i].psTime+"</td>" +
                    "<td>"+list[i].psTotime+"</td>" +
                    "<td>"+list[i].psAddres+"</td>" +
                    "<td>"+list[i].psFinishTime+"</td>" +
                    "<td>"+list[i].psFlag+"</td>" +
                    "<td><a href=\"#\">查看详情</a></td>" +
                    "</tr>"
            }
            string+="</table>";
            $home.after(string);
            var pagebt="<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a   aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "<>";
            for (var i=1;i<=tlength;i++)
            {
                pagebt+="<li><a  href=\"#\" onclick=\"pageclick(this)\">"+i+"</a><>"
            }
            pagebt+="<li><a  >...</a><>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "<>" + "</ul>" + "</nav>"
            $("#mytable").after(pagebt)
        });
    })
});
function pageclick(obj) {
    var flag = $(obj).text();
    if (nowpage == flag) {
        return;
    }
    if (flag == "<<") {
        if (nowpage == 1) {
            console.log(nowpage);
            return;
        }
        nowpage--;
    } else if (flag == ">>") {
        if (nowpage == pagenum) {
            console.log(nowpage);
            return;
        }
        nowpage++;
    } else {
        nowpage = flag;
    }
    $("#mytable").remove();
    $.post("/item/ywclist", {page: nowpage, rows: 14, psUname: psUname3, psTelnumber: psTelnumber3}, function (data) {
        var string = " <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务状态</th><th >操作</th></tr>" +
            "</thead>";
        var list = data.rows;
        for (var i = 0; i < list.length; i++) {
            string += "<tr>" + "<td ><input type=\"checkbox\"></td>\n" +
                "<td>" + list[i].psId + "</td>" +
                "<td>" + list[i].psNumber + "</td>" +
                "<td>" + list[i].psUname + "</td>" +
                "<td>" + list[i].psTelnumber + "</td>" +
                "<td>" + list[i].psTime + "</td>" +
                "<td>" + list[i].psTotime + "</td>" +
                "<td>" + list[i].psAddres + "</td>" +
                "<td>" + list[i].psFinishTime + "</td>" +
                "<td>" + list[i].psFlag + "</td>" +
                "<td><a href=\"#\">查看详情</a></td>" +
                "</tr>"
        }
        string += "</table>";
        $home.after(string);
        if (nowpage % 10 == 0) {
            if ((pagenum - nowpage) > 10) {
                tlength = 10;
            }
            else {
                tlength = pagenum - nowpage;
            }
            $("#pt").remove();
            var pagebt = "<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a  aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "</li>";
            for (var i = 0; i <= tlength; i++) {
                var t = Number(nowpage) + Number(i);
                pagebt += "<li><a  onclick=\"pageclick(this)\">" + t + "</a></li>"
            }
            pagebt += "<li><a  >...</a></li>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
            $("#mytable").after(pagebt)
        }
    });
}