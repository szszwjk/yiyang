var $tale
var $thead
$(function () {
    $tale=$("#showlist");
    $thead=$("#thead");
    $tale.click(function () {
        $.post("/tpreservice/list",{page:1,rows:10},function(data){
            var string="";
            var list=data.rows;
            for(var i=0;i<list.length;i++)
            {
                console.log(list[i]);
                string+="<tr>"+"<td ><input type=\"checkbox\"></td>\n"+
                    "<td>"+list[i].psId+"</td>" +
                    "<td>"+list[i].psNumber+"</td>" +
                    "<td>"+list[i].psUname+"</td>" +
                    "<td>"+list[i].psTime+"</td>" +
                    "<td>"+list[i].psTotime+"</td>" +
                    "<td>"+list[i].psAddres+"</td>" +
                    "<td>"+list[i].psFlag+"</td>" +
                    "<td><a href=\"#\">接受</a> <a href=\"#\">拒绝</a></td>" +
                    "</tr>"

            }
            $thead.after(string);
        });
    })
})