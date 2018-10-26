var $selectlist;
var total;
var pagenum;
var nowpage=1;
var tlength=null;
var $hlist;
var $showlist;
var $largelist;
var $littlelist;
var $add;
var $delete;
var $saveupdate;
var $saveadd;
var $saveshanchu;
$(function () {
    $saveupdate=$("#saveupdate");
    $saveshanchu=$("#saveshanchu");
    $home=$("#home");
    $largelist=$("#largelist");
    //搜索条件切换 页数归一
    $largelist.change(function () {
        nowpage=1;
    });
    $littlelist=$("#littlelist");
    $littlelist.change(function () {
        nowpage=1;
    })
    //换页显示
    $showlist=$("#showlist");
    $showlist.click(function () {
        $("#mytable").css("display","");
        $("#pt").css("display","");
    });
    $selectlist=$("#selectlist");
    $hlist=$("#hlist");
    //换页隐藏
    $hlist.click(function () {
        $("#mytable").css("display","none");
        $("#pt").css("display","none");
    });
   $add=$("#add");
   $saveadd=$("#saveadd");
   $add.click(function () {
      $saveadd.click(function () {
          $.post("/item/add",$("#form1").serialize(),function (data) {
              $("#siLarge1").val(data.siLarge);
              $("#siLittle1").val(data.siLittle);
              $("#siItem1").val(data.siItem);
              $("#siType1").val(data.siType);
              $("#siPrice1").val(data.siPrice);
              $("#siDesc1").val(data.siDesc);
              if(data!=null&&data!=''){
                  alert("添加成功！")
              }else{
                  alert("添加失败！");
              }
          })
          $('.insert').modal('toggle');

      })
        $('.insert').modal('toggle');
    });
  $delete=$("#delete");
    $delete.click(function () {

    });

    $selectlist.click(function () {
        nowpage=1;
        var largeval=$largelist.val();
        var littleval=$littlelist.val();
        $("#mytable").remove();
        $("#pt").remove();

        $.post("/item/serviceitem",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){
            total=data.total;
            pagenum=total%14==0?total/14:Math.floor(total/14)+1;
            if((pagenum-nowpage)>10)
            {
                tlength=10;
            }
            else{
                tlength=pagenum-nowpage;
            }
            console.log(pagenum);
            var string=" <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
                "<thead id=\"thead\">" +
                "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>服务商</th><th >服务大类</th><th>服务小类</th><th>服务项</th><th >收费方式</th><th >单价</th><th >操作</th></tr>" +
            "</thead>";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {

                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].siId+"</td>" +
                    "<td>"+list[i].siName+"</td>" +
                    "<td>"+list[i].siLarge+"</td>" +
                    "<td>"+list[i].siLittle+"</td>" +
                    "<td>"+list[i].siItem+"</td>" +
                   /* "<td>"+list[i].siDesc+"</td>" +*/
                    "<td>"+list[i].siType+"</td>" +
                    "<td>"+list[i].siPrice+"</td>" +
                    "<td><a href=\"#\" onclick='update(this)'>编辑</a> <a href=\"#\" onclick='shanchu(this)'>删除</a></td>" +
                    "</tr>"

            }
            string+="</table>";
            $home.after(string);
            var pagebt="<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
                "<ul class=\"pagination \">" + "<li>" +
                "<a   aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
                "<<" +
                "</a>" + "</li>";
            for (var i=1;i<=tlength;i++)
            {
                pagebt+="<li><a  href=\"#\" onclick=\"pageclick(this)\">"+i+"</a></li>"
            }
            pagebt+="<li><a  >...</a></li>" + "<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
                ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
           /* $("#mytable").after(pagebt)*/
        });
    })

    $saveupdate.click(function () {
        $.post("/item/saveupdate",$("#form2").serialize(),function (data) {
            $("#siId").val(data.siId);
            $("#siName").val(data.siName);
            $("#siLarge").val(data.siLarge);
            $("#siLittle").val(data.siLittle);
            $("#siItem").val(data.siItem);
            $("#siDesc").val(data.siDesc);
            $("#siType").val(data.siType);
            $("#siPrice").val(data.siPrice);
        })
        $('.show-desc1').modal('toggle');
    });
});
function shanchu(obj) {
    var rows=obj.parentNode.parentNode.rowIndex;
    var siId = $("#mytable tr:eq(" + rows + ") td:eq(1)").html();
    console.log(siId);
    $('.shanchu').modal('toggle');
    $saveshanchu.click(function () {
        $.post("/item/shanchu",{"siId":siId},function (data) {
            $("#siId").val(data.siId);
        })
        $('.shanchu').modal('toggle');
    })
}
function update(obj){
    var rows=obj.parentNode.parentNode.rowIndex;
    var siId = $("#mytable tr:eq(" + rows + ") td:eq(1)").html();
    console.log(siId)
    $.post("/item/desc1",{"siId":siId},function (data) {
        console.log(data)
        $("#siId2").val(data.siId);
        $("#siName").val(data.siName);
        $("#siLarge").val(data.siLarge);
        $("#siLittle").val(data.siLittle);
        $("#siItem").val(data.siItem);
        $("#siDesc").val(data.siDesc);
        $("#siType").val(data.siType);
        $("#siPrice").val(data.siPrice);
    });
    $('.show-desc1').modal('toggle');

}
function pageclick(obj) {
    var flag =$(obj).text();
    if(nowpage==flag)
    {
        return;
    }
    if(flag=="<<")
    {

        if(nowpage==1)
        {
            console.log(nowpage);
            return;
        }
        nowpage--;

    }else if(flag==">>")
    {
        if(nowpage==pagenum)
        {
            console.log(nowpage);
            return;
        }
        nowpage++;
    }else{
        nowpage=flag;
    }
    $("#mytable").remove();

    $.post("/item/serviceitem",{page:nowpage,rows:14,siLarge:largeval,siLittle:littleval},function(data){


        var string=" <table class=\"table table-condensed table-striped\" id=\"mytable\" title=\"待处理工单\">" +
            "<thead id=\"thead\">" +
            "<tr><th ><input type=\"checkbox\"></th><th>序号</th> <th>服务商</th><th >服务大类</th><th>服务小类</th><th>服务项</th><th>说明</th><th >收费方式</th><th >单价</th><th >操作</th></tr>" +
            "</thead>";
        var list=data.rows;
        for(var i=0;i<list.length;i++)
        {

            string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                "<td>"+list[i].siId+"</td>" +
                "<td>"+list[i].siName+"</td>" +
                "<td>"+list[i].siLarge+"</td>" +
                "<td>"+list[i].siLittle+"</td>" +
                "<td>"+list[i].siItem+"</td>" +
                "<td>"+list[i].siDesc+"</td>" +
                "<td>"+list[i].siType+"</td>" +
                "<td>"+list[i].siPrice+"</td>" +
                "<td><a href=\"#\" onclick='update(this)'>编辑</a> <a href=\"#\" onclick='shanchu(this)'>删除</a></td>" +
                "</tr>"


        }
        string+="</table>";
        $home.after(string);

        if((pagenum-nowpage)>10)
        {
            tlength=10;
        }
        else{
            tlength=pagenum-nowpage;
        }
        $("#pt").remove();
        var pagebt="<nav aria-label=\"Page navigation \" class=\"text-right\" id=\"pt\">" +
            "<ul class=\"pagination \">" + "<li>" +
            "<a  aria-label=\"Previous\" onclick=\"pageclick(this)\">" +
            "<<" +
            "</a>" + "</li>";
        for (var i=0;i<=tlength;i++)
        {
            var t=Number(nowpage)+Number(i);
            pagebt+="<li><a  onclick=\"pageclick(this)\">"+t+"</a></li>"
        }
        if(tlength==10)
        {
            pagebt+="<li><a  >...</a></li>";
        }
        pagebt+="<li>" + "<a  aria-label=\"Next\" onclick=\"pageclick(this)\">" +
            ">>" + "</a>" + "</li>" + "</ul>" + "</nav>"
        $("#mytable").after(pagebt)


    });


}