var nowpage_i;
var pagenum_i;
$(function () {
    $("#cName").change(function () {
        $("#pCnum").val($("#cName").val());
    })
    $("#selectParent").click(function () {
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        var tinfoName=$("#tinfoName").val();
        var tinfoTel=$("#tinfoTel").val();

        $.post("/relation/getparentinfo",{page:nowpage_i,rows:14,infoTel:tinfoTel,infoName:tinfoName},function(data){

            addelement_i(data);
        });

    })
    $("#tinfoName").change(function () {
        nowpage_i=1;
    })
    $("#tinfoTel").change(function () {
        nowpage_i=1;
    })

})

function selchange_i() {
    nowpage_i=$("#sel_l").val();
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var tinfoName=$("#tinfoName").val();
    var tinfoTel=$("#tinfoTel").val();

    $.post("/relation/getparentinfo",{page:nowpage_i,rows:14,infoTel:tinfoTel,infoName:tinfoName},function(data){

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
    var tinfoName=$("#tinfoName").val();
    var tinfoTel=$("#tinfoTel").val();

    $.post("/relation/getparentinfo",{page:nowpage_i,rows:14,infoTel:tinfoTel,infoName:tinfoName},function(data){

        addelement_i(data);
    });

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
    $("#infoAge").val($("#infoAge").val()+" 00:00:00");
    $.post("/relation/saverelationinfo",$("#relativeform").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");
            $("input").attr("readonly","readonly");
            $("select").attr("disabled","disabled");
        } else {
            alert("修改失败，原因是：" + data.msg);
        }
    })
}
function uploadfile() {
    var formData = new FormData();
    formData.append('uploadFile', $('#input_file')[0].files[0]);  //添加图片信息的参数
    $.ajax({
        url: '/relation/upload',
        type: 'POST',
        cache: false, //上传文件不需要缓存
        data: formData,
        processData: false, // 告诉jQuery不要去处理发送的数据
        contentType: false, // 告诉jQuery不要去设置Content-Type请求头
        success: function (data) {

            var string=" <img id=\"mypicture2\" src='"+data.url+"' alt=\"...\" >"
            $("#myhead").append(string)
            $("#mypicture").attr("src",data.url)
        },
        error: function (data) {
            alert("上传失败");
        }
    })

}
function uplodebt() {
    $("#mypicture2").remove();
    $('.uplodeImg').modal('toggle');

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
function addelement_i(data) {
    var total=data.total;
    pagenum_i=total%14==0?total/14:Math.floor(total/14)+1;

    var string=" <table class=\"table table-condensed table-striped table-bordered\" id=\"mytable_i\" title=\"手术记录\">" +
        "<thead><td>序号</td><td>姓名</td><td>性别</td><td>联系方式</td><td>年龄</td><td>操作</td></thead>"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {
        var date=new Date(list[i].infoAge)

        string+="<tr>"+
            "<td>"+list[i].infoId+"</td>" +
            "<td>"+list[i].infoName+"</td>" +
            "<td>"+list[i].infoSex+"</td>" +
            "<td>"+list[i].infoTel+"</td>" +
            "<td>"+jsGetAge(date.format('yyyy-MM-dd'))+"</td>" +
            "<td class='hidden'>"+list[i].infoUser+"</td>" +
            "<td><a href=\"#\" onclick='addrelation(this)' >绑定</a></td>" +
            "</tr>"

    }
    string+="</table>";
    $("#myform2").after(string);

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
function addrelation(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var pUser=$("#mytable_i tr:eq(" + rows + ") td:eq(5)").html()
    $.post("/relation/addrelation",{pUser:pUser},function (data) {
        if (data.status == 200) {
            alert("绑定成功！");

        } else {
            alert("绑定失败，原因是：" + data.msg);
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

