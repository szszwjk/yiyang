var nowpage_i;
var pagenum_i;
$(function () {
    $("#selectinspection").click(function () {
        console.log("sss")
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        var iHname=$("#iHname").val();
        var iInfo1=$("#iInfo1").val();

        $.post("/parent/getinspection",{page:nowpage_i,rows:14,iHname:iHname,iInfo1:iInfo1},function(data){

            addelement_i(data);
        });

    })
    $("#iHname").change(function () {
        nowpage_i=1;
    })
    $("#iInfo1").change(function () {
        nowpage_i=1;
    })
})
function selchange_i() {
    nowpage_i=$("#sel_l").val();
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var iHname=$("#iHname").val();
    var iInfo1=$("#iInfo1").val();

    $.post("/parent/getinspection",{page:nowpage_i,rows:14,iHname:iHname,iInfo1:iInfo1},function(data){

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
    var iHname=$("#iHname").val();
    var iInfo1=$("#iInfo1").val();

    $.post("/parent/getinspection",{page:nowpage_i,rows:14,iHname:iHname,iInfo1:iInfo1},function(data){

        addelement_i(data);
    });

}
function addinspection() {
    $("#tiHname").val("");
    $("#tiInfo1").val("");
    $("#iItem").val("");
    $("#iDname").val("");
    $("#iDes").val("");
    $("#editBt_i").addClass("hidden")
    $("#saveBt_i").removeClass("hidden")
    $('.addInspection').modal('toggle');
}
function editinspection(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    $("#iId").val($("#mytable_i tr:eq(" + rows + ") td:eq(0)").html());
    $("#tiHname").val($("#mytable_i tr:eq(" + rows + ") td:eq(2)").html());
    $("#tiInfo1").val($("#mytable_i tr:eq(" + rows + ") td:eq(3)").html());
    $("#iItem").val($("#mytable_i tr:eq(" + rows + ") td:eq(4)").html());
    $("#iDname").val($("#mytable_i tr:eq(" + rows + ") td:eq(5)").html());
    $("#iDes").val($("#mytable_i tr:eq(" + rows + ") td:eq(6)").html());
    $("#editBt_i").removeClass("hidden");
    $("#saveBt_i").addClass("hidden")
    $('.addInspection').modal('toggle');
}
function deleteinspection(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var iId=$("#mytable_i tr:eq(" + rows + ") td:eq(0)").html()
    $.post("/parent/deleteinspection",{iId:iId},function (data) {
        if (data.status == 200) {
            alert("删除成功！");
            $(obj).parents("tr").remove()

        } else {
            alert("删除失败，原因是：" + data.msg);
        }
    })

}
function saveInspection() {
    $.post("/parent/saveinspection",$("#inspectionForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("添加成功！");
            $('.addInspection').modal('toggle');

        } else {
            alert("添加失败，原因是：" + data.msg);
        }
    })

}
function editInspection() {

    $.post("/parent/editinspection",$("#inspectionForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $('.addInspection').modal('toggle');

        } else {
            alert("修改失败，原因是：" + data.msg);
        }
    })
}
function addelement_i(data) {
    var total=data.total;
    pagenum_i=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_i\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>姓名</td><td>检查医院</td><td>检查项目</td><td>诊断科室</td><td>检验医生</td><td>检验结果</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].iId+"</td>" +
            "<td>"+list[i].infoName+"</td>" +
            "<td>"+list[i].iHname+"</td>" +
            "<td>"+list[i].iItem+"</td>" +
            "<td>"+list[i].iInfo1+"</td>" +
            "<td>"+list[i].iDname+"</td>" +
            "<td>"+list[i].iDes+"</td>" +
            "<td><a href=\"#\" onclick='editinspection(this)' >编辑</a> <a href=\"#\" onclick='deleteinspection(this)' >删除</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform1").after(string);

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