
var nowpage;
var pagenum;
$(function () {
    $("#selectOperation").click(function () {

        nowpage=1;
        var opHname=$("#opHname").val();
        var opItem=$("#opItem").val();

        $("#mytable").remove();
        $("#pt").remove();

        $.post("/parent/getoperation",{page:nowpage,rows:14,opHname:opHname,opItem:opItem},function(data){

            addelement(data);
        });

    })
    $("#opHname").change(function () {
        nowpage=1;
    })
    $("#opItem").change(function () {
        nowpage=1;
    })
})

function selchange() {
    nowpage=$("#sel").val();
    $("#mytable").remove();
    $("#pt").remove();
    var opHname=$("#opHname").val();
    var opItem=$("#opItem").val();

    $.post("/parent/getoperation",{page:nowpage,rows:14,opHname:opHname,opItem:opItem},function(data){

        addelement(data);
    });

}
function addOperation() {
    $("#topHname").val("");
    $("#topItem").val("");
    $("#topInfo1").val("");
    $("#opDate").val("");
    $("#topInfo2").val("");
    $("#editBt").addClass("hidden")
    $("#saveBt").removeClass("hidden")
    $('.addOperation').modal('toggle');
}
function saveOperation() {
    $.post("/parent/saveOperation",$("#operationForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("添加成功！");
            $('.addOperation').modal('toggle');

        } else {
            alert("添加失败，原因是：" + data.msg);
        }
    })

}
function  editoperation(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    $("#opId").val($("#mytable tr:eq(" + rows + ") td:eq(0)").html());
    $("#topHname").val($("#mytable tr:eq(" + rows + ") td:eq(2)").html());
    $("#topItem").val($("#mytable tr:eq(" + rows + ") td:eq(3)").html());
    $("#topInfo1").val($("#mytable tr:eq(" + rows + ") td:eq(4)").html());
    $("#opDate").val($("#mytable tr:eq(" + rows + ") td:eq(5)").html());
    $("#topInfo2").val($("#mytable tr:eq(" + rows + ") td:eq(6)").html());
    $("#editBt").removeClass("hidden");
    $("#saveBt").addClass("hidden")
    $('.addOperation').modal('toggle');

}
function editOperation() {
    $.post("/parent/editOperation",$("#operationForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $('.addOperation').modal('toggle');

        } else {
            alert("修改失败，原因是：" + data.msg);
        }
    })

}
function deleteoperation(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var opId=$("#mytable tr:eq(" + rows + ") td:eq(0)").html()
    $.post("/parent/deleteoperation",{opId:opId},function (data) {
        if (data.status == 200) {
            alert("删除成功！");
            $(obj).parents("tr").remove()

        } else {
            alert("删除失败，原因是：" + data.msg);
        }
    })

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
    var opHname=$("#opHname").val();
    var opItem=$("#opItem").val();

    $.post("/parent/getoperation",{page:nowpage,rows:14,opHname:opHname,opItem:opItem},function(data){

        addelement(data);
    });

}


function addelement(data) {
    var total=data.total;
    pagenum=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>姓名</td><td>手术医院</td><td>手术名称</td><td>手术详情情况</td><td>手术时间</td><td>术后恢复情况</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].opId+"</td>" +
            "<td>"+list[i].infoName+"</td>" +
            "<td>"+list[i].opHname+"</td>" +
            "<td>"+list[i].opItem+"</td>" +
            "<td>"+list[i].opInfo1+"</td>" +
            "<td>"+list[i].opDate+"</td>" +
            "<td>"+list[i].opInfo2+"</td>" +
            "<td><a href=\"#\" onclick='editoperation(this)' >编辑</a> <a href=\"#\" onclick='deleteoperation(this)' >删除</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform2").after(string);

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