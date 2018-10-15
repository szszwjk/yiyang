var nowpage_m;
var pagenum_m;
$(function () {
    $("#selectmedical").click(function () {

        nowpage_m=1;
        $("#mytable_m").remove();
        $("#pt_m").remove();
        var mHname=$("#mHname").val();
        var mInfo1=$("#mInfo1").val();

        $.post("/parent/getmedical",{page:nowpage_m,rows:14,mHname:mHname,mInfo1:mInfo1},function(data){

            addelement_m(data);
        });

    })
    $("#mHname").change(function () {
        nowpage_m=1;
    })
    $("#mInfo1").change(function () {
        nowpage_m=1;
    })
})

function selchange_m() {
    nowpage_m=$("#sel_m").val();
    $("#mytable_m").remove();
    $("#pt_m").remove();
    var mHname=$("#mHname").val();
    var mInfo1=$("#mInfo1").val();

    $.post("/parent/getmedical",{page:nowpage_m,rows:14,mHname:mHname,mInfo1:mInfo1},function(data){

        addelement_m(data);
    });

}
function pageclick_m(obj) {
    var flag =$(obj).val();
    if(flag==1)
    {
        nowpage_m=1;
    }
    if(flag==2)
    {

        if(nowpage_m==1)
        {
            console.log(nowpage_m);
            return;
        }
        nowpage_m--;

    }else if(flag==3)
    {
        if(nowpage_m==pagenum_m)
        {
            console.log(nowpage_m);
            return;
        }
        nowpage_m++;
    }
    if(flag==4){
        nowpage_m=pagenum_m;

    }
    $("#mytable_m").remove();
    $("#pt_m").remove();
    var mHname=$("#mHname").val();
    var mInfo1=$("#mInfo1").val();

    $.post("/parent/getmedical",{page:nowpage_m,rows:14,mHname:mHname,mInfo1:mInfo1},function(data){

        addelement_m(data);
    });

}
function editmedical(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    console.log(rows)
    $("#mId").val($("#mytable_m tr:eq(" + rows + ") td:eq(0)").html());
    $("#tmHname").val($("#mytable_m tr:eq(" + rows + ") td:eq(2)").html());
    $("#tmInfo1").val($("#mytable_m tr:eq(" + rows + ") td:eq(3)").html());
    $("#mInfo2").val($("#mytable_m tr:eq(" + rows + ") td:eq(4)").html());
    $("#mNum").val($("#mytable_m tr:eq(" + rows + ") td:eq(5)").html());
    $("#mIndate").val($("#mytable_m tr:eq(" + rows + ") td:eq(6)").html());
    $("#mOutdate").val($("#mytable_m tr:eq(" + rows + ") td:eq(7)").html());
    $("#mDesc").val($("#mytable_m tr:eq(" + rows + ") td:eq(8)").html());
    $("#editBt_m").removeClass("hidden");
    $("#saveBt_m").addClass("hidden")
    $('.addMedical').modal('toggle');
}
function deletemedical(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var mId=$("#mytable_m tr:eq(" + rows + ") td:eq(0)").html()
    $.post("/parent/deletemedical",{mId:mId},function (data) {
        if (data.status == 200) {
            alert("删除成功！");
            $(obj).parents("tr").remove()

        } else {
            alert("删除失败，原因是：" + data.msg);
        }
    })

}
function saveMedical() {
    $.post("/parent/savemedical",$("#medicalForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("添加成功！");
            $('.addMedical').modal('toggle');

        } else {
            alert("添加失败，原因是：" + data.msg);
        }
    })

}
function editMedical() {

    $.post("/parent/editmedical",$("#medicalForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $('.addMedical').modal('toggle');

        } else {
            alert("修改失败，原因是：" + data.msg);
        }
    })
}
function addmedical() {
    $("#tmHname").val("");
    $("#tmInfo1").val("");
    $("#mInfo2").val("");
    $("#mNum").val("");
    $("#mIndate").val("");
    $("#mOutdate").val("");
    $("#mDesc").val("");
    $("#editBt_m").addClass("hidden")
    $("#saveBt_m").removeClass("hidden")
    $('.addMedical').modal('toggle');
}
function addelement_m(data) {
    var total=data.total;
    pagenum_m=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_m\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>姓名</td><td>住院医院</td><td>住院科室</td><td>住院病房</td><td>住院号</td><td>住院日期</td><td>出院日期</td><td>描述</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].mId+"</td>" +
            "<td>"+list[i].infoName+"</td>" +
            "<td>"+list[i].mHname+"</td>" +
            "<td>"+list[i].mInfo1+"</td>" +
            "<td>"+list[i].mInfo2+"</td>" +
            "<td>"+list[i].mNum+"</td>" +
            "<td>"+list[i].mIndate+"</td>" +
            "<td>"+list[i].mOutdate+"</td>" +
            "<td>"+list[i].mDesc+"</td>" +
            "<td><a href=\"#\" onclick='editmedical(this)' >编辑</a> <a href=\"#\" onclick='deletemedical(this)' >删除</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform3").after(string);

    var pagebt=" <div style=\"float: right\" id=\"pt_m\">\n" + "<span style=\"margin-right: 10px\">第<select class=\"\" id=\"sel_m\" onchange=\"selchange_m()\">";
    for(var i=1;i<=pagenum_m;i++)
    {
        if(i==nowpage_m)
        {
            pagebt+="<option selected  value=\""+i+"\">"+i+"</option>";
        }
        else{
            pagebt+="<option value=\""+i+"\">"+i+"</option>";
        }
    }
    pagebt+="</select >页/共"+pagenum_m+"页</span>"+"<button class=\"btn btn-default\" value=\"1\" onclick=\"pageclick_m(this)\">首页</button>\n" +
        "<button class=\"btn btn-default\" value=\"2\" onclick=\"pageclick_m(this)\">上一页</button>\n" +
        "<button class=\"btn btn-default\" value=\"3\" onclick=\"pageclick_m(this)\">下一页</button>\n" +
        "<button class=\"btn btn-default\" value=\"4\" onclick=\"pageclick_m(this)\">尾页</button>"
    $("#mytable_m").after(pagebt)
}