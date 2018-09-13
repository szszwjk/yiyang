


var $user
var $pass
var $username
var $password
//var $authority
$(function () {
    $user = $("#user")
    $pass = $("#pass")
    $username = $("#inputusername");
    $password = $("#inputpassword");
    //$authority=$("#authority")


    $username.focus(function () {
        $user.removeClass('has-error has-feedback');
        $pass.removeClass('has-error has-feedback')
        $(".sr-only").remove();
        $(".glyphicon").remove();
        $username.attr("placeholder", "")
        $password.attr("placeholder", "")
    });
    $password.focus(function () {
        $user.removeClass('has-error has-feedback');
        $pass.removeClass('has-error has-feedback')
        $(".sr-only").remove();
        $(".glyphicon").remove();
        $username.attr("placeholder", "")
        $password.attr("placeholder", "")
    });
});

function onSubmitfun() {
    var flag=true;
    if ($username.val() == "") {
        $user.addClass('has-error has-feedback');
        flag=false
        $username.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span><span id="inputError2Status" class="sr-only">(error)</span>');
        $username.attr("placeholder", "用户名不能为空")
    }
    if ($password.val() == "") {
        $pass.addClass('has-error has-feedback');
        flag=false
        $password.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span><span id="inputError2Status" class="sr-only">(error)</span>');
        $password.attr("placeholder", "密码不能为空")
    }
    var $logform=$("#logform");
    if(flag){
        $.post("/login", $logform.serialize(),function(data){
            if (data.status == 200) {
                alert("登录成功！");
                if (redirectUrl == "") {
                    console.log(data);
                    location.href =data.data;
                } else {
                    console.log(redirectUrl);
                    console.log(data);
                    //location.href = redirectUrl;
                }
            } else {
                alert("登录失败，原因是：" + data.msg);
                console.log(data);
            }
        });
    }
}
