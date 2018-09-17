
var $tale;
var $thead;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
$(function () {
    $tale=$("#showlist");
    $home=$("#home");

    $tale.click(function () {
        $("#mytable").remove();
        $("#pt").remove();

        $.post("/item/list",{page:nowpage,rows:14},function(data){
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

    $.post("/item/list",{page:nowpage,rows:14},function(data){


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
        if(nowpage%10==0)
        {
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
            pagebt+="<li><a  >...</a></li>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
            $("#mytable").after(pagebt)
        }

    });


}