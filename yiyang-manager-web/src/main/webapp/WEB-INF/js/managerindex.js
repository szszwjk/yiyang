var nowpage_i;
var pagenum_i;
var nowpage_m;
var pagenum_m;
$(function () {
    $("#saveinfo").click(function () {
        $.post("/admin/updateauthorityinfo",$("#aform").serialize(),function (data) {
            if (data.status == 200) {
                alert("修改成功！");
                $('.addauthority').modal('toggle');

            } else {
                alert("修改失败，原因是：" + data.msg);
            }
        })
    })
    $("#addauthority").click(function () {
        $("#tiHname").val("");
        $("#iItem").val("");
        $("#tiHname").removeAttr("disabled")
        $("#addinfo").removeClass("hidden")
        $("#saveinfo").addClass("hidden")
        $('.addauthority').modal('toggle');
    })

    $("ul>li").click(function (obj) {
        $("ul>li").removeClass("active")
        $(obj).addClass("active")

    })
    $("#selectinspection").click(function () {
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        var iHname=$("#iHname").val();
        var iInfo1=$("#iInfo1").val();

        $.post("/admin/getalluser",{page:nowpage_i,rows:14,username:iHname,usertype:iInfo1},function(data){

            addelement_i(data);
        });

    })
    $("#selectauthority").click(function () {

        nowpage_m=1;
        $("#mytable_m").remove();
        $("#pt_m").remove();
        var authorityGroup=$("#mInfo1").val();
        console.log(authorityGroup)
        $.post("/admin/getallauthority",{page:nowpage_m,rows:14,authorityGroup:authorityGroup},function(data){

            addelement_m(data);
        });

    })
    $("#addinfo").click(function () {
        if($("#tiHname").val()=="")
        {
            alert("请选择类别")
            return;
        }
        $("#aid").val("0")
        $.post("/admin/addauthority",$("#aform").serialize(),function(data){
                if (data.status == 200) {
                    alert("添加成功！");
                    $('.addauthority').modal('toggle');
                } else {
                    alert("添加失败，原因是：" + data.msg);
                }
        });
    })
    $("#refresh").click(function () {

        $("#mytable_m").remove();
        $("#pt_m").remove();
        var authorityGroup=$("#mInfo1").val();

        $.post("/admin/getallauthority",{page:nowpage_m,rows:14,authorityGroup:authorityGroup},function(data){

            addelement_m(data);
        });

    })
    $("#mInfo1").change(function () {
        nowpage_m=1;
    })

    $("#iHname").change(function () {
        nowpage_i=1;
    })
    $("#iInfo1").change(function () {
        nowpage_i=1;
    })
})
function selchange_m() {
    nowpage_m=$("#sel_m").val();
    $("#mytable_m").remove();
    $("#pt_m").remove();
    var authorityGroup=$("#mInfo1").val();

    $.post("/admin/getallauthority",{page:nowpage_m,rows:14,authorityGroup:authorityGroup},function(data){

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
    var authorityGroup=$("#mInfo1").val();

    $.post("/admin/getallauthority",{page:nowpage_m,rows:14,authorityGroup:authorityGroup},function(data){

        addelement_m(data);
    });

}
function editauthorityinfo(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    $("#tiHname").val($("#mytable_m tr:eq(" + rows + ") td:eq(1)").html());
    $("#iItem").val($("#mytable_m tr:eq(" + rows + ") td:eq(2)").html());
    $("#aid").val($("#mytable_m tr:eq(" + rows + ") td:eq(0)").html());
    $("#tiHname").attr("disabled","disabled")
    $("#saveinfo").removeClass("hidden")
    $("#addinfo").addClass("hidden")
    $('.addauthority').modal('toggle');
}
function deleteauthority(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var aid=$("#mytable_m tr:eq(" + rows + ") td:eq(0)").html();
    $.post("/admin/deleteauthority",{aid:aid},function (data) {
        if (data.status == 200) {
            alert("删除成功！");
            $(obj).parents("tr").remove();
        } else {
            alert("删除失败，原因是：" + data.msg);
        }
    })
}
function addelement_m(data) {
    console.log(data)
    var total=data.total;
    pagenum_m=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_m\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>类别</td><td>地址</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].aid+"</td>" +
            "<td>"+list[i].authorityGroup+"</td>" +
            "<td>"+list[i].authorityCon+"</td>" +
            "<td><a href=\"#\" onclick='editauthorityinfo(this)' >编辑</a> <a href=\"#\" onclick='deleteauthority(this)' >删除</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform2").after(string);

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
function selchange_i() {
    nowpage_i=$("#sel_l").val();
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var iHname=$("#iHname").val();
    var iInfo1=$("#iInfo1").val();

    $.post("/admin/getalluser",{page:nowpage_i,rows:14,username:iHname,usertype:iInfo1},function(data){

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
    $.post("/admin/getalluser",{page:nowpage_i,rows:14,username:iHname,usertype:iInfo1},function(data){

        addelement_i(data);
    });

}
function showauthority(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var username=$("#mytable_i tr:eq(" + rows + ") td:eq(3)").html()
    $("#username").val(username)
    $.post("/admin/getauthority",{username:username},function (data) {
        $("label>input").prop("checked",false);
        for(var i=0;i<data.length;i++)
        {

            if(data[i].authorityGroup=="parent")
            {
                $("#inlineCheckbox1").prop("checked",true);
            }
            if(data[i].authorityGroup=="doctor")
            {
                $("#inlineCheckbox2").prop("checked",true);
            }
            if(data[i].authorityGroup=="service")
            {
                $("#inlineCheckbox3").prop("checked",true);

            }
            if(data[i].authorityGroup=="relation")
            {
                $("#inlineCheckbox4").prop("checked",true);
            }
            if(data[i].authorityGroup=="cadmin")
            {
                $("#inlineCheckbox5").prop("checked",true);
            }
            if(data[i].authorityGroup=="admin")
            {
                $("#inlineCheckbox6").prop("checked",true);
            }
        }
        console.log(data)
    })

    $('.addInspection').modal('toggle');
}
function editauthority() {
    $("label>input").removeAttr("disabled")
    $("#editbt").addClass("hidden");
    $("#savebt").removeClass("hidden");
}
function saveauthority() {
    var username=$("#username").val()
    var list = [];
    $('input:checkbox:checked').each(function (index, item) {
       list.push({id:0,username:username,authorityGroup:$(this).val()});
    });
    if(list.length==0)
    {
        list.push({id:0,username:username,authorityGroup:""});
    }
    $.ajax({
        url :"/admin/updateauthority",
        type : "POST",
        data : JSON.stringify(list), //转JSON字符串
        dataType : 'json',
        contentType : 'application/json;charset=UTF-8', //contentType很重要
        success : function(result) {
            console.log(result);

        }
    });


    // $.post("/admin/updateauthority",JSON.stringify(list),function (data) {
    //     console.log(data)
    // })
    $("label>input").attr("disabled","disabled")
    $("#editbt").removeClass("hidden");
    $("#savebt").addClass("hidden");

}
function addelement_i(data) {
    console.log(data)
    var total=data.total;
    pagenum_i=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_i\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>姓名</td><td>电话</td><td>用户名</td><td>性别</td><td>用户类别</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {

        string+="<tr>"+
            "<td>"+list[i].tUserInfo.infoId+"</td>" +
            "<td>"+list[i].tUserInfo.infoName+"</td>" +
            "<td>"+list[i].tUserInfo.infoTel+"</td>" +
            "<td>"+list[i].tUserInfo.infoUser+"</td>" +
            "<td>"+list[i].tUserInfo.infoSex+"</td>" +
            "<td>"+list[i].authorityGroup+"</td>" +
            "<td><a href=\"#\" onclick='showauthority(this)' >查看权限</a></td>" +
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
function editinfo() {
    $("#ebt").addClass("hidden")
    $("#sbt").removeClass("hidden")
    $("select").removeAttr("disabled");
    $("td>input").removeAttr("readonly");
}
function saveinfo() {
    $("#sbt").addClass("hidden")
    $("#ebt").removeClass("hidden")
    $("#age").val($("#age").val()+" 00:00:00");
    console.log( $("#age").val())
    $.post("/admin/saveadmininfo",$("#relativeform").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $("input").attr("readonly","readonly");
            $("select").attr("disabled","disabled");
        } else {
            alert("修改失败，原因是：" + data.msg);
        }
    })
}
function jsGetAge(strBirthday){
    var returnAge;
    var strBirthdayArr=strBirthday.split("-");
    var birthYear = strBirthdayArr[0];
    var birthMonth = strBirthdayArr[1];
    var birthDay = strBirthdayArr[2];

    d = new Date();
    var nowYear = d.getFullYear();
    var nowMonth = d.getMonth() + 1;
    var nowDay = d.getDate();

    if(nowYear == birthYear){
        returnAge = 0;//同年 则为0岁
    }
    else{
        var ageDiff = nowYear - birthYear ; //年之差
        if(ageDiff > 0){
            if(nowMonth == birthMonth) {
                var dayDiff = nowDay - birthDay;//日之差
                if(dayDiff < 0)
                {
                    returnAge = ageDiff - 1;
                }
                else
                {
                    returnAge = ageDiff ;
                }
            }
            else
            {
                var monthDiff = nowMonth - birthMonth;//月之差
                if(monthDiff < 0)
                {
                    returnAge = ageDiff - 1;
                }
                else
                {
                    returnAge = ageDiff ;
                }
            }
        }
        else
        {
            returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
        }
    }
    return returnAge;//返回周岁年龄

}
Date.prototype.format = function(format)
{
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length==1 ? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}