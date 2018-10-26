function submit_info() {
    $.post("/doctor/addSuggest",$("#addInfo").serialize(),function (data) {
        if (data.status == 200) {
            alert("添加成功！");

        } else {
            alert("添加失败，原因是：" + data.msg);
        }


    })

}