
var $tale
var $thead
$(function () {
    $tale=$("#showlist");
    $thead=$("#thead");
    $tale.click(function () {
        $.post("/item/list",{page:1,rows:10},function(data){
            var string="";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {
                console.log(list[i]);
                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].siId+"</td>" +
                    "<td>"+list[i].siName+"</td>" +
                    "<td>"+list[i].siLarge+"</td>" +
                    "<td>"+list[i].siLittle+"</td>" +
                    "<td>"+list[i].siItem+"</td>" +
                    "<td>"+list[i].siPrice+"</td>" +
                    "<td><a href=\"#\">查看详情</a> <a href=\"#\">预定</a></td>" +
                    "</tr>"

            }
            $thead.after(string);
        });
    })
})