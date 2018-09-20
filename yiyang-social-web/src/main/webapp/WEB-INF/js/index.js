
$(function () {

})

// $.ajax({
//     contentType : "application/json",
//     type : "GET",
//     url : "index.jsp",
//     dataType : "json",
//     success : function(data) {
//         //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接for循环
//         var servicedata=[];
//
//         for(var i=0;i<data.length;i++){
//             var obj=new Object();
//             obj.name=data[i].type;
//             obj.value=data[i].flag;
//             servicedata[i]=obj;
//         }}