<div class="verlayLogin" id="verlayLogin">
    <div class="container">
        <h2>&nbsp;</h2>
        <div class="tag">
            <ul>
                <#--<li><a href="#"data-tag="2">手机验证码登录</a>/</li>-->
                <li><a href="#" data-tag="1">账户登录</a></li>
            </ul>
        </div>
        <#--<div class="box-form" style="display:block;">-->
            <#--<p><input name="telc" class="telc" type="text" maxlength="11" placeholder="手机号" /></p>-->
            <#--<div class="img-code-wrap">-->
                <#--<div class="img-code"><input name="login-imgCode" type="text" maxlength="4" placeholder="输入右侧验证码" /></div>-->
                <#--<span class="img-code-show" id="login-img-code-show"><img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=50&method=home_login_img_code" width="100%" /></span>-->
            <#--</div>-->
            <#--<p class="box-checkcode">-->
                <#--<input name="login-checkCode" class="check-code" type="text" maxlength="6" placeholder="输入验证码" />-->
                <#--<span class="btn send-checkcode">获取验证码</span>-->
            <#--</p>-->
        <#--</div>-->

        <div class="box-form" style="display:block;">
            <p><input name="tel" class="tel" type="text" maxlength="11" value="13918661215" /></p>
            <p><input name="password" class="pwd" type="password" value="111111"  /></p>
            <div class="remember-status fn-clear">
                <label><input type="checkbox" name="rememberStatus" class="rememberst"/>记住密码一周</label>
            </div>
        </div>
        <div class="login"><p class="btn" id="doLogin">登录</p></div>
        <div class="intro fn-clear">
            <!--<span class="fn-left"><a href="/forgetpwd.html">忘记密码</a></span>-->
            <span class="fn-right"><a href="/home/index/register">立即注册</a></span>
        </div>
        
    </div>
</div>

<script type="text/javascript">
    var linkLogin = "";
    var scrollFunc = function (e) {
        e = e || window.event;
        if (e && e.preventDefault) {
            e.preventDefault();
            e.stopPropagation();
        } else {
            e.returnvalue = false;

            return false;
        }
    }
    $(".top-nav li a").click(function () {
        if ($(this).attr("data-flag") == 1) {
            linkLogin = $(this).attr("href");
            if ("False".toLowerCase() != "true") {
                $(".boxLogin").overlay({ api: true }).load();
                return false;
            }
        }
    });
    $("#login-img-code-show img").on('click', function () {
        $(this).attr("src", "/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=50&method=home_login_img_code&v=" + Math.random());
    });
    $(".main-nav .code a").hover(function () {
        $(this).siblings(".tag").show();
    }, function () {
        $(this).siblings(".tag").hide();
    });
    $(".verlayLogin").keydown(function (e) {
        var curKey = e.which; 
        if (curKey == 13) {
            $("#doLogin").trigger("click");
        }
    });
    $(".boxLogin").overlay({
        closeOnClick: false,
        top: 'center',
        mask: {
            color: '#000',
            closeSpeed: 700,
            opacity: 0.7
        },
        onBeforeLoad: function (k) {
            $('body').on('mousewheel', function (e) {
                scrollFunc(e);
            });
        },
        onClose: function () {
            $('body').off('mousewheel');
        }
    });
    var cursec = 60;
    var submiting = false;
    $(".verlayLogin .send-checkcode").click(function () {
        var $this = $(this);
        if (submiting) return false;
        var telc = $.trim($(".verlayLogin .telc").val());
        var imgCode = $.trim($("input[name=login-imgCode]").val());
        if (!telc) {
            alert("请输入手机号码！");
            return;
        }
        if (!imgCode) {
            alert("请输入图形验证码！");
            return;
        }
        $.ajax({
            url: '/sms_code/send_sms_code',
            data: { mobile: telc, valilCode: imgCode,img_code_method:'home_login_img_code',sms_code_method:'home_login_sms_code' },
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
                    $(".img-code-show img").attr("src", "/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=50&method=home_login_img_code&v=" + Math.random());
                    submiting = false;
                    alert(data.msg);
                    $this.removeClass("disable");
                    $this.text("获取验证码");
                }
            },
            error: function () {
                submiting = false;
                $this.removeClass("disable");
                alert("获取验证码失败");
            }
        });
    });
    $("#verlayLogin input.tel").focus(function () {
        if ($(this).val() == "手机号") {
            $(this).val("");
        }
    });
    $("#verlayLogin input.tel").blur(function () {
        if ($(this).val() == "") {
            $(this).val("手机号");
        }
    });
    $("#verlayLogin input.pwd").focus(function () {
        $(this).removeClass("bgpwd2");
    });
    $("#verlayLogin input.pwd").blur(function () {
        if ($(this).val() == "") {
            $(this).addClass("bgpwd2");
        }
    });
    $("#doLogin").click(function () {
        var tag=$(this).attr("data-tag");
        var tel = $.trim($(".verlayLogin .tel").val());
        var pwd = $.trim($(".verlayLogin .pwd").val());
        var telc = $.trim($(".verlayLogin .telc").val());
        var checkCode = $.trim($(".verlayLogin .check-code[name=login-checkCode]").val());
        var isCheckRemember = false;
        if ($(".rememberst").is(':checked')) {
            isCheckRemember = true;
        }
        if (tag == 1) {
            if (!tel || tel == "手机号") {
                alert("请输入手机号码！");
                return;
            }
            if (!pwd) {
                alert("请输入密码！");
                return;
            }
            postdata = { mobile: tel, password: pwd, tag: tag,checkCode:'' };
        }
        if (tag == 2) {
            if (!telc) {
                alert("请输入手机号码！");
                return;
            }
            if (!checkCode) {
                alert("请输入验证码！");
                return;
            }
            postdata = { mobile: telc, checkCode: checkCode,password:'', tag: tag };
        }
        $.ajax({
            url: '/home/index/login',
            data: postdata,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    window.location.reload();
                } else {
                    alert(data.msg);
                } 
            },
            error: function () {
                alert("网络错误,稍后再试！");
            }
        });
    });
    
    $(".verlayLogin .tag ul").tabs(".verlayLogin .box-form", {
        onClick: function () {
            $("#doLogin").attr("data-tag", this.getCurrentTab().attr("data-tag"));
        }
    });
    
    
    
</script>