
var hnowpage
var htotal
var hpagenum
$(function () {
    $("#hselect").click(function () {
        console.log("hservices")
        hnowpage=1;
       var hid= $("#hid").val();
        var hitem= $("#hitem").val();
        $("#hmytable").remove();
        $("#hpt").remove();
        $.post("/parent/hservice",{page:hnowpage,rows:14,psNumber:hid,psItem:hitem},function(data){
            htotal=data.total;
            hpagenum=htotal%14==0?htotal/14:Math.floor(htotal/14)+1;

            var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"hmytable\" title=\"工单记录\">" +
                "<thead id=\"thead\">" +
                "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >下单时间</th><th>服务商</th><th>服务项</th><th >价格</th><th>状态</th><th >操作</th></tr>" +
                "</thead>";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {
                var stract=null;
                if(list[i].psFlag==1)
                {
                    stract="待处理 "
                }
                if(list[i].psFlag==2)
                {
                    stract="已接单"
                }
                if(list[i].psFlag==3)
                {
                    stract="已处理"
                }
                if(list[i].psFlag==4)
                {
                    stract="拒绝"
                }

                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].psId+"</td>" +
                    "<td>"+list[i].psNumber+"</td>" +
                    "<td>"+list[i].psTime+"</td>" +
                    "<td>"+list[i].psPeople+"</td>" +
                    "<td>"+list[i].psItem+"</td>" +
                    "<td>"+list[i].psPrice+"元"+"</td>" +
                    "<td>"+stract+"</td>" +
                    "<td><a href=\"#\" onclick=\"hshowdesc(this)\">查看详情</a> </td>" +
                    "</tr>"

            }
            string+="</table>";
            $("#profile").after(string);

            var pagebt=" <div style=\"float: right\" id=\"hpt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"hsel\" onchange=\"hselchange()\">";
            for(var i=1;i<=hpagenum;i++)
            {
                if(i==hnowpage)
                {
                    pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
                }
                else{
                    pagebt+="<option value=\""+i+"\">"+i+"</option>";
                }
            }
            pagebt+="</select >页/共"+hpagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"hpageclick(this)\">首页</button>\n" +
                "<button class=\"btn btn-default\" value=\"2\" onclick=\"hpageclick(this)\">上一页</button>\n" +
                "<button class=\"btn btn-default\" value=\"3\" onclick=\"hpageclick(this)\">下一页</button>\n" +
                "<button class=\"btn btn-default\" value=\"4\" onclick=\"hpageclick(this)\">尾页</button>"
            $("#hmytable").after(pagebt)
        });
    })


});
function hshowdesc(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var listId = $("#hmytable tr:eq(" + rows + ") td:eq(2)").html();
    console.log(listId)
    $.post("/parent/hservicelist",{psNumber:listId},function (data) {
        var stract=null;
        if(data.psFlag==1)
        {
            stract="待处理 "
        }
        if(data.psFlag==2)
        {
            stract="已接单"
        }
        if(data.psFlag==3)
        {
            stract="已处理"
        }
        if(data.psFlag==4)
        {
            stract="拒绝"
        }
        console.log(data.psFlag)
        $("#hpsNumber").val(data.psNumber);
        $("#hpsUname").val(data.psUname);
        $("#hsName").val(data.sName);
        $("#hpsItem").val(data.psItem);
        $("#hpsTime").val(data.psTime);
        $("#hpsTotime").val(data.psTotime);
        $("#hpsAddres").val(data.psAddres);
        $("#hsiPrice").val(data.siPrice);
        $("#hpsPrice").val(data.psPrice);
        $("#hpsDesc").val(data.psDesc);
        $("#hinfoName").val(data.infoName);
        $("#hinfoTel").val(data.infoTel);
        $("#hpsFlag").val(stract);
    });

    $('.h-services').modal('toggle');
}
function hselchange() {
    hnowpage=$("#hsel").val();
    $("#hmytable").remove();
    var hid= $("#hid").val();
    var hitem= $("#hitem").val();
    $.post("/parent/hservice",{page:hnowpage,rows:14,psNumber:hid,psItem:hitem},function(data){
        htotal=data.total;
        hpagenum=htotal%14==0?htotal/14:Math.floor(htotal/14)+1;

        var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"hmytable\" title=\"工单记录\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >下单时间</th><th>服务商</th><th>服务项</th><th >价格</th><th>状态</th><th >操作</th></tr>" +
            "</thead>";
        var list=data.rows;
        for(var i=0;i<list.length;i++)
        {
            var stract=null;
            if(list[i].psFlag==1)
            {
                stract="待处理 "
            }
            if(list[i].psFlag==2)
            {
                stract="已接单"
            }
            if(list[i].psFlag==3)
            {
                stract="已处理"
            }
            if(list[i].psFlag==4)
            {
                stract="拒绝"
            }

            string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                "<td>"+list[i].psId+"</td>" +
                "<td>"+list[i].psNumber+"</td>" +
                "<td>"+list[i].psTime+"</td>" +
                "<td>"+list[i].psPeople+"</td>" +
                "<td>"+list[i].psItem+"</td>" +
                "<td>"+list[i].psPrice+"元"+"</td>" +
                "<td>"+stract+"</td>" +
                "<td><a href=\"#\" onclick=\"hshowdesc(this)\">查看详情</a> </td>" +
                "</tr>"

        }
        string+="</table>";
        $("#profile").after(string);


        $("#hpt").remove();

        var pagebt=" <div style=\"float: right\" id=\"hpt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"hsel\" onchange=\"hselchange()\">";
        for(var i=1;i<=hpagenum;i++)
        {
            if(i==hnowpage)
            {
                pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
            }
            else{
                pagebt+="<option  value=\""+i+"\">"+i+"</option>";
            }
        }
        pagebt+="</select >页/共"+hpagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"hpageclick(this)\">首页</button>\n" +
            "<button class=\"btn btn-default\" value=\"2\" onclick=\"hpageclick(this)\">上一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"3\" onclick=\"hpageclick(this)\">下一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"4\" onclick=\"hpageclick(this)\">尾页</button>"

        $("#hmytable").after(pagebt)


    });

}


function hpageclick(obj) {
    var flag =$(obj).val();
    if(flag==1)
    {
        hnowpage=1;
    }
    if(flag==2)
    {

        if(hnowpage==1)
        {
            console.log(hnowpage);
            return;
        }
        hnowpage--;

    }else if(flag==3)
    {
        if(hnowpage==hpagenum)
        {
            console.log(hnowpage);
            return;
        }
        hnowpage++;
    }
    if(flag==4){
        hnowpage=hpagenum;

    }
    $("#hmytable").remove();
    var hid= $("#hid").val();
    var hitem= $("#hitem").val();
    $.post("/parent/hservice",{page:hnowpage,rows:14,psNumber:hid,psItem:hitem},function(data){
        htotal=data.total;
        hpagenum=htotal%14==0?htotal/14:Math.floor(htotal/14)+1;

        var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"hmytable\" title=\"工单记录\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>订单编号</th><th >下单时间</th><th>服务商</th><th>服务项</th><th >价格</th><th>状态</th><th >操作</th></tr>" +
            "</thead>";
        var list=data.rows;
        for(var i=0;i<list.length;i++)
        {
            var stract=null;
            if(list[i].psFlag==1)
            {
                stract="待处理 "
            }
            if(list[i].psFlag==2)
            {
                stract="已接单"
            }
            if(list[i].psFlag==3)
            {
                stract="已处理"
            }
            if(list[i].psFlag==4)
            {
                stract="拒绝"
            }
            string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                "<td>"+list[i].psId+"</td>" +
                "<td>"+list[i].psNumber+"</td>" +
                "<td>"+list[i].psTime+"</td>" +
                "<td>"+list[i].psPeople+"</td>" +
                "<td>"+list[i].psItem+"</td>" +
                "<td>"+list[i].psPrice+"元"+"</td>" +
                "<td>"+stract+"</td>" +
                "<td><a href=\"#\" onclick=\"hshowdesc(this)\">查看详情</a> </td>" +
                "</tr>"

        }
        string+="</table>";
        $("#profile").after(string);


        $("#hpt").remove();

        var pagebt=" <div style=\"float: right\" id=\"hpt\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"hsel\" onchange=\"hselchange()\">";
        for(var i=1;i<=hpagenum;i++)
        {
            if(i==hnowpage)
            {
                pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
            }
            else{
                pagebt+="<option  value=\""+i+"\">"+i+"</option>";
            }
        }
        pagebt+="</select >页/共"+hpagenum+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"hpageclick(this)\">首页</button>\n" +
            "<button class=\"btn btn-default\" value=\"2\" onclick=\"hpageclick(this)\">上一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"3\" onclick=\"hpageclick(this)\">下一页</button>\n" +
            "<button class=\"btn btn-default\" value=\"4\" onclick=\"hpageclick(this)\">尾页</button>"

        $("#hmytable").after(pagebt)


    });


}