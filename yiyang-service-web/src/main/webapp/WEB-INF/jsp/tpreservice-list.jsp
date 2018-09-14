<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/14
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="easyui-datagrid" id="tpreserviceList" title="待处理工单"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/tpreservice/list',method:'get',pageSize:10,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:60">序号</th>
        <th data-options="field:'time',width:200">下单时间</th>
        <th data-options="field:'item',width:100">服务项</th>
        <th data-options="field:'name',width:100">客户姓名</th>
        <th data-options="field:'totime',width:70">要求时间</th>
        <th data-options="field:'adress',width:70">服务地址</th>
        <th data-options="field:'phone',width:100">电话</th>
       <!-- <th data-options="field:'status',width:60">操作</th>-->
    </tr>
    </thead>
</table>

</body>
</html>
