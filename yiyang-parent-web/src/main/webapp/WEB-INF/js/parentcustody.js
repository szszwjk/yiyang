var nowpage;
var pagenum;
$(function () {
    $("#selectItem").change(function () {
        var unti= $("#selectItem").val();

        if(unti=="xt")
        {
            $("#unit").val("mmol/L")
        }
        if(unti=="xy")
        {

            $("#unit").val("%")
        }
        if(unti=="xl")
        {
            $("#unit").val("bpm")
        }


    })

    $("#sitem").change(function () {
        nowpage=1;

    })
    $("#sflag").change(function () {
        nowpage=1;
    })
    $("#hlist").click(function () {
        nowpage=1;
        var sitem=$("#sitem").val();
        var sflag=$("#sflag").val();

        $("#mytable").remove();
        $("#pt").remove();

        $.post("/parent/preremind",{page:nowpage,rows:14,prItem:sitem,prFlag:sflag},function(data){

            addelement(data);
        });
    })
    $("#selectlist").click(function () {
        nowpage=1;
        var sitem=$("#sitem").val();
        var sflag=$("#sflag").val();

        $("#mytable").remove();
        $("#pt").remove();

        $.post("/parent/preremind",{page:nowpage,rows:14,prItem:sitem,prFlag:sflag},function(data){

            addelement(data);
        });
    })
})


function selchange() {
    nowpage=$("#sel").val();
    $("#mytable").remove();
    $("#pt").remove();
    var sitem=$("#sitem").val();
    var sflag=$("#sflag").val();

    $.post("/parent/preremind",{page:nowpage,rows:14,prItem:sitem,prFlag:sflag},function(data){
        addelement(data)
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
    $("#pt").remove();
    var sitem=$("#sitem").val();
    var sflag=$("#sflag").val();

    $.post("/parent/preremind",{page:nowpage,rows:14,prItem:sitem,prFlag:sflag},function(data){
        addelement(data)
    });


}

function addelement(data) {
    var total=data.total;
    pagenum=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable\" title=\"待处理工单\">" +
        "<thead><td>序号</td><td>预警项目</td><td>预警值</td><td>预警时间</td><td>处理状态</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].prId+"</td>" +
            "<td>"+list[i].prItem+"</td>" +
            "<td>"+list[i].prUnit+"</td>" +
            "<td>"+list[i].prTime+"</td>" +
            "<td>"+list[i].prFlag+"</td>" +
            "<td><a href=\"#\" onclick='changeflag(this)' >处理</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform").after(string);

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
}
function changeflag(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var recId = $("#mytable tr:eq(" + rows + ") td:eq(0)").html();
    $.post("/parent/updateflag",{prId:recId},function (data) {

        $("#mytable tr:eq(" + rows + ") td:eq(0)").html("111")
    })
    console.log(recId)
}
function  addoption() {
    var max=Number(($("#poMaxText").val()))
    var min=Number(($("#poMinText").val()))
    if(($("#poMaxText").val())!=""&&($("#poMinText").val())!="")
    {
        if(max<min)
        {
            alert("error:最大值比最小值小")
            return;
        }
    }
    $.post("/parent/addoption",$("#addOption").serialize(),function (data) {
        if (data.status == 200) {
            alert("添加成功！");
            $('.editoption').modal('toggle');
            location.reload();
        } else {
            alert("添加失败，原因是：" + data.msg);
            console.log(data);
        }

    })

}
function editoption(obj) {

    var rows=obj.parentNode.parentNode.rowIndex;
    $("#poMax").val("");
    $("#poMin").val("");
    $("#poItemText").text($("#optionTable tr:eq(" + rows + ") td:eq(1)").html());
    $("#poUnitText").text($("#optionTable tr:eq(" + rows + ") td:eq(2)").html())
    $("#poIdText").val($("#optionTable tr:eq(" + rows + ") td:eq(0)").html())
    $('.editoption').modal('toggle');

}
function saveedit() {
    var max=Number(($("#poMax").val()))
    var min=Number(($("#poMin").val()))
    if(($("#poMax").val())==""&&($("#poMin").val())=="")
    {
        return;
    }
    if(($("#poMax").val())!=""&&($("#poMin").val())!="")
    {
        if(max<min)
        {
            alert("error:最大值比最小值小")
            return;
        }
    }

    $.post("/parent/updateoption",$("#formOption").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $('.editoption').modal('toggle');
            location.reload();
        } else {
            alert("修改失败，原因是：" + data.msg);
            console.log(data);
        }

    })

}