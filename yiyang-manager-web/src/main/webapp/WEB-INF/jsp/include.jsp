<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/28
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <div style="float: left"><img src="../img/doctor3.png" style="width:60px;height: 60px;margin-top: 10px;" alt="..." class="img-circle img-thumbnail"></div><div style="margin-top: 20px; margin-left: 70px;"><span >${username}</span ><br><select style="width: 70px;" id="cFlag" name="cFlag">
</select></div>
</head>
<body>

</body>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>
    $(function () {
        var aflag="";
        var url = window.location.host;
        switch (url)
        {
            case "localhost:8081":aflag="parent";break;
            case "localhost:8087":aflag="doctor";break;
            case "localhost:8090":aflag="service";break;
            case "localhost:8085":aflag="relation";break;
            case "localhost:8089":aflag="cadmin";break;
            case "localhost:8083":aflag="admin";break;
        }
        var json=${authorityjson}
        var opt=""
        for (var i=0;i<json.length;i++)
        {
            if(json[i].authorityGroup!=aflag)
            {
                opt+=" <option value='"+json[i].authorityGroup+"' id='"+json[i].authorityGroup+"'>"+json[i].authorityGroup+"</option>"

            }
            else{
                opt+=" <option value='"+json[i].authorityGroup+"' id='"+json[i].authorityGroup+"' selected>"+json[i].authorityGroup+"</option>"

            }
        }
        $("#cFlag").append(opt);
        $("#cFlag").change(function () {
            console.log("sss")
            var aut=$("#cFlag").val();
            switch (aut)
            {
                case "parent":location.href ="http://localhost:8081/";break;
                case "doctor":location.href ="http://localhost:8087/";break;
                case "service":location.href ="http://localhost:8090/";break;
                case "relation":location.href ="http://localhost:8085/";break;
                case "cadmin":location.href ="http://localhost:8089/";break;
                case "admin":location.href ="http://localhost:8083/";break;
            }
        })
    })
</script>
</html>
