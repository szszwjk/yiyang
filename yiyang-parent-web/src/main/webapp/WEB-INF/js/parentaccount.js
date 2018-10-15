$(function () {
    $("#editbt").click(function () {
        $("td>input").removeAttr("readonly");
        $("select").removeAttr("disabled");
        $("#savebt").removeClass("hidden");
        $("#infoAge").removeAttr("disabled")
    })
    $("#savebt").click(function () {
        $("#savebt").addClass("hidden");
        $("#infoAge").val($("#infoAge").val()+" 00:00:00");

        $.post("/parent/saveparent",$("#saveparent").serialize(),function (data) {
            if (data.status == 200) {
                alert("修改成功！");

            } else {
                alert("修改失败，原因是：" + data.msg);
                console.log(data);
            }
        })
        $("#infoAge").val($("#infoAge").val().split(" ")[0]);
        $("input").attr("readonly","readonly");
        $("select").attr("disabled","disabled");
        $("#infoAge").attr("disabled","disabled")
    })
    $("#cName").change(function () {
        $("#pCnum").val($("#cName").val());
    })

}
)
function editpass() {
    $.post("/parent/updatepass",$("#updatepass").serialize(),function (data) {
        if (data.status == 200) {
            alert("修改成功！");

        } else {
            alert("修改失败，原因是：" + data.msg);
            console.log(data);
        }
    })

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
