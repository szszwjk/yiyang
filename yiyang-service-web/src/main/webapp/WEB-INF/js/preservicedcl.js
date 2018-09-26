var $selectdcllist;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
var $dcllist;
var $psUname1;
var $psTelnumber1;
$(function () {
    $home=$("#home");
    $psUname1=$("#psUname1");
    //搜索条件切换 页数归一
    $psUname1.change(function () {
        nowpage=1;
    });
    $psTelnumber1=$("#psTelnumber1");
    $psTelnumber1.change(function () {
        nowpage=1;
    })
    //换页显示
    $dcllist=$("#dcllist");
    $dcllist.click(function () {
        $("#mytable").css("display","");
        $("#pt").css("display","");
    });
    $selectdcllist=$("#selectdcllist");
    $("#selectAll").click(function(){
    $("input[name='ids']").prop("checked",this.checked);
    });
    $selectdcllist.click(function () {
        nowpage=1;
        var psUname1=$psUname1.val();
        var psTelnumber1=$psTelnumber1.val();
        $("#mytable").remove();
        $("#pt").remove();

        $.post("/item/dcllist",{page:nowpage,rows:14,psUname:psUname1,psTelnumber:psTelnumber1},function(data){
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
                "<tr><th ><input checked=\"checked\" type=\"checkbox\" id=\"selectAll\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务状态</th><th >操作</th></tr>" +
                "</thead>";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {
                string+="<tr>"+"<td ><input name='list[i].psId' type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].psId+"</td>" +
                    "<td>"+list[i].psNumber+"</td>" +
                    "<td>"+list[i].psUname+"</td>" +
                    "<td>"+list[i].psTelnumber+"</td>" +
                    "<td>"+list[i].psTime+"</td>" +
                    "<td>"+list[i].psTotime+"</td>" +
                    "<td>"+list[i].psAddres+"</td>" +
                    "<td>"+list[i].psFlag+"</td>" +
                    "<td><a href=\"#\" onclick='jieshou1(this)'>接受</a> <a href=\"#\" onclick='refuse()'>拒绝</a></td>" +
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
function jieshou1(obj) {
     var rows=obj.parentNode.parentNode.rowIndex;
     var recId = $("#mytable tr:eq(" + rows + ") td:eq(1)").html();
     console.log(recId);

}
function refuse() {
    var text=confirm("确认要拒绝该工单么？");
    if(text=true){
    }else{
        return "preservicedcl";
    }


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

    $.post("/item/dcllist", {page: nowpage, rows: 14,psUname:psUname1,psTelnumber:psTelnumber1}, function (data) {
        var string = " <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input checked=\"checked\" type=\"checkbox\" id=\"selectAll\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务状态</th><th >操作</th></tr>" +
            "</thead>";
        var list = data.rows;
        for (var i = 0; i < list.length; i++) {
            string += "<tr>" + "<td ><input name='list[i].psId' type=\"checkbox\"></td>\n" +
                "<td>" + list[i].psId + "</td>" +
                "<td>" + list[i].psNumber + "</td>" +
                "<td>" + list[i].psUname + "</td>" +
                "<td>"+list[i].psTelnumber+"</td>" +
                "<td>" + list[i].psTime + "</td>" +
                "<td>" + list[i].psTotime + "</td>" +
                "<td>" + list[i].psAddres + "</td>" +
                "<td>" + list[i].psFlag + "</td>" +
                "<td><a href=\"#\" onclick=\"accept(this)\">接受</a> <a href=\"#\" onclick='refuse()'>拒绝</a></td>" +
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
}}