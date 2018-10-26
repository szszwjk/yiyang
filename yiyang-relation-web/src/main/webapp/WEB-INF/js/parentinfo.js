





var nowpage_i;
var pagenum_i;
$(function () {

    $("#hlist").click(function () {
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        $.post("/relation/getsuggest",{page:nowpage_i,rows:14},function(data){

            addelement_i(data);
        });
    })
    $("#selectlist").click(function () {
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        var pname=$("#sitem").val();
        $.post("/relation/getsuggest",{page:nowpage_i,rows:14,pname:pname},function(data){

            addelement_i(data);
        });

    })
})

function selchange_i() {
    nowpage_i=$("#sel_l").val();
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var pname=$("#sitem").val();
    $.post("/relation/getsuggest",{page:nowpage_i,rows:14,pname:pname},function(data){

        addelement_i(data);
    });

}
function pageclick_i(obj) {
    var flag =$(obj).val();
    if(flag==1)
    {
        nowpage_i=1;
    }
    if(flag==2)
    {

        if(nowpage_i==1)
        {
            console.log(nowpage_i);
            return;
        }
        nowpage_i--;

    }else if(flag==3)
    {
        if(nowpage_i==pagenum_i)
        {
            console.log(nowpage_i);
            return;
        }
        nowpage_i++;
    }
    if(flag==4){
        nowpage_i=pagenum_i;

    }
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var pname=$("#sitem").val();
    $.post("/relation/getsuggest",{page:nowpage_i,rows:14,pname:pname},function(data){

        addelement_i(data);
    });

}
function addelement_i(data) {
    var total=data.total;
    pagenum_i=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_i\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>老人姓名</td><td>医生姓名</td><td>健康数据评估</td><td>医生建议</td><td>评估时间</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].dsId+"</td>" +
            "<td>"+list[i].pname+"</td>" +
            "<td>"+list[i].dname+"</td>" +
            "<td>"+list[i].dsItem+"</td>" +
            "<td>"+list[i].dsSuggest+"</td>" +
            "<td>"+list[i].dsDate+"</td>" +
            "<td><a href=\"#\" onclick='showsuggest(this)' >查看</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform").after(string);

    var pagebt=" <div style=\"float: right\" id=\"pt_i\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"sel_l\" onchange=\"selchange_i()\">";
    for(var i=1;i<=pagenum_i;i++)
    {
        if(i==nowpage_i)
        {
            pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
        }
        else{
            pagebt+="<option value=\""+i+"\">"+i+"</option>";
        }
    }
    pagebt+="</select >页/共"+pagenum_i+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"pageclick_i(this)\">首页</button>\n" +
        "<button class=\"btn btn-default\" value=\"2\" onclick=\"pageclick_i(this)\">上一页</button>\n" +
        "<button class=\"btn btn-default\" value=\"3\" onclick=\"pageclick_i(this)\">下一页</button>\n" +
        "<button class=\"btn btn-default\" value=\"4\" onclick=\"pageclick_i(this)\">尾页</button>"
    $("#mytable_i").after(pagebt)
}
