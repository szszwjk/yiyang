var nowpage_i;
var pagenum_i;
$(function () {

    $("#hlist").click(function () {
        nowpage_i=1;

        $("#mytable_i").remove();
        $("#pt_i").remove();
        var cFlag=$("#cFlag").val();
        var cDesc=$("#cDesc").val();
        $.post("/parent/getconsult",{page:nowpage_i,rows:8,cFlag:cFlag,cDesc:cDesc},function (data) {

            addelement_i(data);
        })
    })
    $("#selectConsult").click(function () {
        nowpage_i=1;
        $("#mytable_i").remove();
        $("#pt_i").remove();
        var cFlag=$("#cFlag").val();
        var cDesc=$("#cDesc").val();
        $.post("/parent/getconsult",{page:nowpage_i,rows:8,cFlag:cFlag,cDesc:cDesc},function (data) {

            addelement_i(data);
        })
    })
    $("#cFlag").change(function () {
        nowpage_i=1;
    })
    $("#cDesc").change(function () {
        nowpage_i=1;
    })
})
function selchange_i() {
    nowpage_i=$("#sel_l").val();
    $("#mytable_i").remove();
    $("#pt_i").remove();
    var cFlag=$("#cFlag").val();
    var cDesc=$("#cDesc").val();
    $.post("/parent/getconsult",{page:nowpage_i,rows:8,cFlag:cFlag,cDesc:cDesc},function (data) {

        addelement_i(data);
    })

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
    var cFlag=$("#cFlag").val();
    var cDesc=$("#cDesc").val();
    $.post("/parent/getconsult",{page:nowpage_i,rows:8,cFlag:cFlag,cDesc:cDesc},function (data) {

        addelement_i(data);
    })


}
function addelement_i(data) {
    console.log(data)
    var total=data.total;
    pagenum_i=total%8==0?total/8:Math.floor(total/8)+1;

    var string="<div id=\"mytable_i\">"
    var list=data.rows;
    for(var i=0;i<list.length;i++)
    {
        var descflag="";
        var aser="";
        if(list[i].cFlag=="2")
        {
            aser+="<div class=\"media\" style=\"margin-top:10px\" >\n" +
                "                                                <a class=\"media-left\" href=\"#\" >\n" +
                "                                                    <img src=\""+list[i].doctorUser.infoImg+"\" class=\"media-object img-responsive img-thumbnail \" style=\"width: 64px;height: 64px\" alt=\"64*64图片\" >\n" +
                "                                                </a>\n" +
                "                                                <div class=\"media-body\">\n" +
                "                                                    <h4 class=\"media-heading\">"+list[i].doctorUser.infoName+"</h4>\n" +
                "                                                    <p>\n" +
                list[i].cAnswer+
                "                                                    </p>\n" +
                "                                                </div>\n" +
                "                                            </div>"
            descflag="  <button type=\"button\" style=\"height: 22px;line-height: 10px;margin-left: 20px\"  class=\"btn btn-warning\">已回复</button>"

        }
        else {
            descflag="  <button type=\"button\" style=\"height: 22px;line-height: 10px;margin-left: 20px\"  class=\"btn btn-info\">未回复</button>"

        }
        string+="\n" +
            "                    <div class=\"panel-group\" id=\"accordion"+i+"\" role=\"tablist\" aria-multiselectable=\"true\">\n" +
            "                        <div class=\"panel panel-default\">\n" +
            "                            <div class=\"panel-heading\" role=\"tab\" id=\"headingOne"+i+"\">\n" +
            "                                <h4 class=\"panel-title\" data-toggle=\"collapse\" data-parent=\"#accordion"+i+"\" href=\"#collapseOne"+i+"\" aria-expanded=\"true\" aria-controls=\"collapseOne\" onclick=\"hiddenandshow()\">\n" +
            "                                    <span class=\"glyphicon glyphicon-menu-right\" aria-hidden=\"true\"></span>\n" +
            "                                    <span>\n" +
            "                                        "+list[i].cDesc.substr(0,6)+"....." +
            "                                    </span>\n" +
            descflag+
            "                                    <span style=\"float: right\">"+list[i].cDate+"</span>" +
            "                                </h4>\n" +
            "                            </div>\n" +
            "                            <div id=\"collapseOne"+i+"\" class=\"panel-collapse collapse \" role=\"tabpanel\" aria-labelledby=\"headingOne"+i+"\">\n" +
            "                                <div class=\"panel-body\">\n" +
            "                                    \n" +
            "                                    <div class=\"media\">\n" +
            "                                        <a class=\"media-left\" href=\"#\">\n" +
            "                                            <img src=\""+list[i].consultUser.infoImg+"\" class=\"media-object img-responsive img-thumbnail \" style=\"width: 64px;height: 64px\" alt=\"64*64图片\">\n" +
            "                                        </a>\n" +
            "                                        <div class=\"media-body\">\n" +
            "                                            <h4 class=\"media-heading\">"+list[i].consultUser.infoName+"</h4>\n" +
            "                                            <p >" +
            list[i].cDesc+
            "                                            </p>" +
            aser+
            "                                            " +
            "                                        </div>" +
            "                                    </div>\n" +
            "                                   \n" +
            "                                </div>\n"+
        "                            </div>\n" +
        "                        </div>\n" +
        "                    </div>\n" +
        "                   "


    }
    string+="</div>"
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


function selectdoctor() {

    $(".col-sm-3 ").remove();
    var dname=$("#dname").val();
    $.post("/parent/getdoctor",{dname:dname},function (data) {
        var string=""
        for(var i=0;i<data.length;i++)
        {
            string+="<div class=\"col-sm-3 text-center\" style=\"margin-bottom: 10px\">" +
                "<div style=\"width: 111px;height: 156px;margin-left: 80px\">" +
                "<img  src='"+data[i].infoImg+"' alt=\"...\">" +
                "</div>" +
                "<div>姓名:"+data[i].infoName+"</div>" +
                "<div>科室:"+data[i].dInfo1+"</div>" +
                "<div>所属医院:"+data[i].dHname+"</div>" +
                "<button type=\"button\" class=\"btn btn-info\" style=\"width:70px\" onclick='consult(this)'>咨询</button>" +
                "<input class=\"hidden\" value='"+data[i].infoTel+"'>" +
                "<input class=\"hidden\" value='"+data[i].dUser+"'>" +
                "</div>"
        }
        $(".doctorcss").append(string);
    })
}
function consult(obj) {
    $("#tname").val(obj.previousElementSibling.previousElementSibling.previousElementSibling.textContent.split(":")[1])
    $("#tdname").val(obj.previousElementSibling.textContent.split(":")[1])
    $("#tinfo").val(obj.previousElementSibling.previousElementSibling.textContent.split(":")[1])
    $("#telnum").val(obj.nextElementSibling.value)
    $("#duser").val(obj.nextElementSibling.nextElementSibling.value)
    $("#desc").val("");
    $('.consult').modal('toggle');

}
function saveconsult() {
    console.log("qqqqssss")
    $.post("/parent/addconsult",$("#inspectionForm").serialize(),function (data) {
        if (data.status == 200) {
            alert("保存成功！");

        } else {
            alert("保存失败，原因是：" + data.msg);
        }
    })
}
function hiddenandshow() {


}