var $selectyjdlist;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
var $yjdlist;
var $psUname2;
var $psTelnumber2;
$(function () {
    $home = $("#home");
    $psUname2 = $("#psUname2");
    //搜索条件切换 页数归一
    $psUname2.change(function () {
        nowpage = 1;
    });
    $psTelnumber2 = $("#psTelnumber2");
    $psTelnumber2.change(function () {
        nowpage = 1;
    })
    $yjdlist = $("#yjdlist");
    //换页隐藏
    $yjdlist.click(function () {
        $("#mytable2").css("display", "none");
        $("#pt").css("display", "none");
    });
    $selectyjdlist = $("#selectyjdlist");
    $selectyjdlist.click(function () {
        nowpage = 1;
        var psUname2 = $psUname2.val();
        var psTelnumber2 = $psTelnumber2.val();
        $("#mytable2").remove();
        $("#pt").remove();
        $.post("/item/yjdlist", {page: nowpage, rows: 14, psUname: psUname2, psTelnumber: psTelnumber2}, function (data) {
            total = data.total;
            pagenum = total % 14 == 0 ? total / 14 : Math.floor(total / 14) + 1;
            if ((pagenum - nowpage) > 10) {
                tlength = 10;
            }
            else {
                tlength = pagenum - nowpage;
            }
            console.log(pagenum);
            var string = " <table class=\"table table-condensed table-striped\" id=\"mytable2\" title=\"已接单工单\">" +
                "<thead id=\"thead\">" +
                "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务人员</th><th >服务状态</th><th >操作</th></tr>" +
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
                    "<td>" + list[i].psPeople + "</td>" +
                    "<td>" + list[i].psFlag + "</td>" +
                    "<td><a href=\"#\" onclick='chuli(this)'>处理</a> </td>" +
                    "</tr>"
            }
            string += "</table>";
           $("#form2").after(string);
            var pagebt = "<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a   aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "<>";
            for (var i = 1; i <= tlength; i++) {
                pagebt += "<li><a  href=\"#\" onclick=\"pageclick(this)\">" + i + "</a><>"
            }
            pagebt += "<li><a  >...</a><>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "<>" + "</ul>" + "</nav>"

        });
    })
});
function chuli(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var psNumber=$("#mytable2 tr:eq("+rows+") td:eq(2)").html();
    console.log(psNumber);
    window.location.href="/chuli/"+psNumber;
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
            $("#mytable2").remove();
            $.post("/item/yjdlist", {
                page: nowpage,
                rows: 14,
                psUname: psUname2,
                psTelnumber: psTelnumber2
            }, function (data) {
                var string = " <table class=\"table table-condensed table-striped\" id=\"mytable2\" title=\"待处理工单\">" +
                    "<thead id=\"thead\">" +
                    "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >客户姓名</th><th >电话号码</th><th>下单时间</th><th>要求时间</th><th >服务地址</th><th >服务人员</th><th >服务状态</th><th >完成时间</th><th >操作</th></tr>" +
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
                        "<td>" + list[i].psPeople + "</td>" +
                        "<td>" + list[i].psFlag + "</td>" +
                        "<td><a href=\"#\" onclick='chuli(this)'>处理</a></td>" +
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
                    $("#mytable2").after(pagebt)
                }
            });
    }