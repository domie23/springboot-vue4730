<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-修改密码|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-user-center">
    <div class="container fn-clear">
        <div class="menu-usercenter">
    	<#include "../common/account-menu.ftl"/>
		</div>
        <div class="box-con userinfo-usercenter">
            <div class="title tag fn-clear">
                <span><a href="user-info">个人资料</a></span>
                <span class="act"><a href="update-pwd">修改密码</a></span>
                <span><a href="update-head-pic">修改头像</a></span>
            </div>
            <div class="box-info usercahngpwd">
                <#--<p class="fn-clear box-tel">-->
                    <#--&lt;#&ndash;<input name="text" class="tel fn-left" id="img-code" style="width:165px;" type="text" maxlength="4" placeholder="请输入图形验证码" />&ndash;&gt;-->
                    <#--<span class=" fn-right" id="update-pwd-img-code-show"><img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=user_update_pwd_img_code" width="100%" /></span>-->
                    <#--<span class="error">请输入正确的手机号</span>-->
                <#--</p>-->
                <p class="fn-clear box-tel">
                   手机号： <input name="tel" class="tel fn-left" id="mobile" type="text" value="${ylrc_account.mobile}"  style="width: 300px" />
                    <#--<span class="btn fn-right sned-check">获取验证码</span>-->
                    <span class="error">请输入正确的手机号</span>
                </p>
                <#--<p class="ipt">-->
                    <#--<input name="checkCode" class="check-code" type="text" value="验证码" maxlength="6" />-->
                    <#--<span class="error">验证码格式错误</span>-->
                <#--</p>-->
                <p class="ipt">
                    <input name="password" class="pwd bgpwd" type="password" />
                    <span class="error">请输入6-16位密码仅含字母与数字</span>
                </p>
                <p class="fn-clear"><span class="btn do-register">修改密码</span></p>
            </div>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">

$("input.check-code").focus(function () {
    if ($(this).val() == "验证码") {
        $(this).val("");
    }
});
$("input.check-code").blur(function () {
    if ($(this).val() == "") {
        $(this).val("验证码");
    }
});
$("input.pwd").focus(function () {
    $(this).removeClass("bgpwd");
});
$("input.pwd").blur(function () {
    if ($(this).val() == "") {
        $(this).addClass("bgpwd");
    }
});
var $domTel = $("#mobile");
var $domCheckCode = $(".usercahngpwd .check-code");
var $domPwd = $(".usercahngpwd .pwd");
var $domAgreement = $(".usercahngpwd .agreement");
var regTel = /^((\(\d{2,4}\))|(\d{3,4}\-))?1[3|4|5|7|8]\d{9}$/;
var regCheckCode = /^\d{6}$/;
var regPwd = /^([a-zA-Z0-9]){6,16}$/;
var cursec = 60;
var submiting = false;
$(".usercahngpwd .sned-check").click(function () {
    if (submiting) return false;
    var $this = $(this);
    var tel = $("#mobile").val();
    if (!regTel.test(tel)) {
        $this.siblings(".error").show();
        return;
    } else {
    	var imgCode = $("#img-code").val();
    	if(imgCode == ''){
    		alert('请输入图形验证码！');
    		return;
    	}
        $this.siblings(".error").hide();
        $.ajax({
            url: '/sms_code/send_sms_code',
            data: { mobile: tel, valilCode: imgCode,img_code_method:'user_update_pwd_img_code',sms_code_method:'user_update_pwd_sms_code' },
            type: 'post',
            dataType: 'json',
            beforeSend: function () {
                submiting = true;
                $this.text("正在发送");
                $this.addClass("disable");
            },
            success: function (data) {
                if (data.code == 0) {
                    submiting = true;
                    if (cursec < 60) {
                        return;
                    }
                    var timer = setInterval(function () {
                        if (cursec == 60) {
                            $this.addClass("disable");
                        }
                        $this.text(cursec + "秒后重发");
                        if (cursec == 0) {
                            window.clearInterval(timer);
                            submiting = false;
                            cursec = 60;
                            $this.text("获取验证码");
                            $this.removeClass("disable");
                        } else {
                            cursec--;
                        }
                    }, 1000);
                } else {
                    submiting = false;
                    alert(data.msg);
                    $this.removeClass("disable");
                    $this.text("获取验证码");
                }
            },
            error: function () {
                submiting = false;
                $this.removeClass("disable");
                alert("获取验证码失败,请检查您的手机是否可以访问网络");
            }
        });
    }
});
var regflag = false;
$(".usercahngpwd .do-register").click(function () {
    if (regflag) return;
    var $this = $(this);
    var tel = $.trim($domTel.val());
    var pwd = $.trim($domPwd.val());
    $(".usercahngpwd .error").hide();
    var flag = false;
    if (!regTel.test(tel)) {
        $domTel.parent().find(".error").show();
        flag = true;
    }
    if (!regPwd.test(pwd)) {
        $domPwd.parent().find(".error").show();
        flag = true;
    }
    if (flag) return;
    $.ajax({
        url: 'update_pwd',
        data: { password: pwd },
        type: 'post',
        dataType: 'json',
        beforeSend: function () {
            regflag = true;
            $this.addClass("disable");
        },
        success: function (data) {
            if (data.code == 0) {
                regflag = true;
                $this.removeClass("disable");
                alert("修改密码成功！")
                window.location.reload();

            } else {
                regflag = false;
                alert(data.msg);
                $this.removeClass("disable");
            }
        },
        error: function () {
            regflag = false;
            $this.removeClass("disable");
            alert("注册失败,请检查您的手机是否可以访问网络");
        }
    });

});
$(".usercahngpwd .do-login").click(function () {
    linkLogin = "/";
    if ("True".toLowerCase() != "true") {
        $(".boxLogin").overlay({ api: true }).load();
    }
});
$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "userinfo") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});
$("#update-pwd-img-code-show img").on('click', function () {
	$(this).attr("src", "/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=user_update_pwd_img_code&v=" + Math.random());
}); 
</script>
</body>
</html>