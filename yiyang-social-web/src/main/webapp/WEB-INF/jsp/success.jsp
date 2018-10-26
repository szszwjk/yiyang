<%--
  Created by IntelliJ IDEA.
  User: wj123
  Date: 2018/10/12
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function countDown(secs,surl){
            //alert(surl);
            var jumpTo = document.getElementById('jumpTo');
            jumpTo.innerHTML=secs;
            if(--secs>0){
                setTimeout("countDown("+secs+",'"+surl+"')",1000);
            }
            else
            {
                location.href=surl;
            }
        }
    </script>
</head>
<body>
<h1>成功！</h1>
<span id="jumpTo">2</span>秒后自动跳转
<script type="text/javascript">
    countDown(2,'//localhost:8089/dangan');
</script>

</body>
</html>
