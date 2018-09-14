

var $span1
var $span2
var $span3
var $span4
var $username
var $password
var $repassword
var $telnumber
var $usergroup
var $telgroup
var $passgroup
var $repassgroup
var reg_user = /^[a-zA-Z0-9_-]{6,16}$/;
var reg_pass = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,18}$/;
var reg_tel=/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
var uflag=false;
var pflag=false;
var tflag=false;
var rpflag=false;
$(function () {
    $span1 = $("#sp1");
    $span2 = $("#sp2");
    $span3 = $("#sp3");
    $span4 = $("#sp4");
    $username = $("#username");
    $password = $("#password");
    $repassword = $("#repassword");
    $telnumber = $("#telnumber");
    $usergroup = $("#usergroup");
    $telgroup = $("#telgroup");
    $passgroup = $("#passgroup");
    $repassgroup = $("#repassgroup");
    //用户名验证
    $username.focus(function () {
        $usergroup.removeClass('has-error has-feedback');
        $usergroup.removeClass('has-success has-feedback');
        $("#usergroup .sr-only").remove();
        $("#usergroup .glyphicon").remove();
        $span1.text("");
        uflag=false;
    });
    $username.blur(function () {
        var user_text = $username.val();
        if (user_text == "") {
            uflag=false;
        }
        else if (reg_user.test(user_text)) {
            addsuccess( $usergroup);
            addSuccessAfter($username);
                uflag=true;
             } else {
            if (user_text.length < 6) {
                $span1.text("用户名小于6位");
                $span1.css("color", "#a94442");
                adderror( $usergroup);
                addErrorAfter( $username); 
                uflag=false;
                 } else {
                $span1.text("用户名大于16位");
                $span1.css("color", "#a94442");
                adderror( $usergroup);
                addErrorAfter( $username); 
                uflag=false;
            }
        }
    });
    //电话验证
    $telnumber.focus(function () {
        $telgroup.removeClass('has-error has-feedback');
        $telgroup.removeClass('has-success has-feedback');
        $("#telgroup .sr-only").remove();
        $("#telgroup .glyphicon").remove();
        $span2.text("");
        tflag=false;
    });

    $telnumber.blur(function () {
        var tel_text = $telnumber.val();
        if (tel_text == "") {
            tflag=false;
        }
        else if (reg_tel.test(tel_text)) {
            addsuccess( $telgroup);
            addSuccessAfter($telnumber);
            tflag=true;
        } else {
            $span2.text("请填入正确的电话号码");
            $span2.css("color", "#a94442");
            adderror( $telgroup);
            addErrorAfter( $telnumber); 
            tflag=false;
        }
    });
    // 密码验证
    $password.focus(function () {
        $passgroup.removeClass('has-error has-feedback');
        $passgroup.removeClass('has-success has-feedback');
        $("#passgroup .sr-only").remove();
        $("#passgroup .glyphicon").remove();
        $span3.text("");
        pflag=false;
    });
    $password.blur(function () {
        var repass_text = $repassword.val();
        var pass_text = $password.val();
        if (pass_text == "") {
            pflag=false;
        }
        else if (reg_pass.test(pass_text)) {
            addsuccess( $passgroup);
            addSuccessAfter($password);
            pflag=true;
        } else {
            if (pass_text.length < 8) {
                $span3.text("密码小于8位");
                $span3.css("color", "#a94442");
                adderror( $passgroup);
                addErrorAfter( $password); 
                pflag=false;
            } else if (pass_text.length > 18) {
                $span3.text("密码大于18位");
                $span3.css("color", "#a94442");
                adderror( $passgroup);
                addErrorAfter( $password); 
                pflag=false;
            } else {
                $span3.text("密码安全性低");
                $span3.css("color", "#a94442");
                adderror( $passgroup);
                addErrorAfter( $password); 
                pflag=false;
            }

        }

        if (repass_text=="") {
            rpflag=false;
        }
        else {
            if(repass_text==pass_text)
            {
                $repassgroup.removeClass('has-error has-feedback');
                $repassword.removeClass('has-success has-feedback');
                $("#repassgroup .sr-only").remove();
                $("#repassgroup .glyphicon").remove();
                addsuccess( $repassgroup);
                addSuccessAfter($repassword);
                rpflag=true;
                $span4.text("");
            }
            else{
                $repassgroup.removeClass('has-error has-feedback');
                $repassword.removeClass('has-success has-feedback');
                $("#repassgroup .sr-only").remove();
                $("#repassgroup .glyphicon").remove();
                $span4.text("密码不一致，请确认密码");
                $span4.css("color", "#a94442");
                adderror($repassgroup);
                addErrorAfter($repassword); 
                rpflag=false;
            }
        }

    });
    //确认密码验证
    $repassword.focus(function () {
        $repassgroup.removeClass('has-error has-feedback');
        $repassword.removeClass('has-success has-feedback');
        $("#repassgroup .sr-only").remove();
        $("#repassgroup .glyphicon").remove();
        $span4.text("");
        rpflag=false;
    });
    $repassword.blur(function () {
        var pass_text = $password.val();
        var repass_text = $repassword.val();
        if (repass_text=="") {
            rpflag=false;
        }
        else {
            if(repass_text==pass_text)
            {
                addsuccess( $repassgroup);
                addSuccessAfter($repassword);
                rpflag=true;
            }
            else{
                $span4.text("密码不一致，请确认密码");
                $span4.css("color", "#a94442");
                adderror($repassgroup);
                addErrorAfter($repassword); 
                rpflag=false;
            }
        }
        
        
    });

    // $username.focus(function () {

    // });
    // $username.blur(function () {

    // });
    // $username.focus(function () {

    // });
    // $username.blur(function () {

    // });
    // $username.focus(function () {

    // });
    // $username.blur(function () {

    // });

});
function register() {

    var $registerform=$("#registerform");
    if(uflag&&tflag&&pflag&&rpflag){
        $.post("/user/regist", $registerform.serialize(),function(data){
            if (data.status == 200) {
                alert("注册成功！");

            } else {
                alert("注册失败失败，原因是：" + data.msg);
                console.log(data);
            }
        });
    }


}
function adderror(obj)
{
   obj.addClass('has-error has-feedback');
}
function addErrorAfter(obj)
{
    obj.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span><span id="inputError2Status" class="sr-only">(error)</span>');
   
}
function addsuccess(obj)
{
   obj.addClass('has-success has-feedback');
}
function addSuccessAfter(obj)
{
    obj.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span><span id="inputSuccess2Status" class="sr-only">(success)</span>');
   
}