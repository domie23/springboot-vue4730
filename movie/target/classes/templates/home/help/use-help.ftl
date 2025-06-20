<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>帮助中心|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-helpcenter fn-clear">
    <div class="menu-helpcenter">
    <#include "../common/help-menu.ftl"/>
</div>
    <div class="box-con">
        <h1>使用帮助</h1>
        <div class="con">
            <ul class="help-aq">
                <li class="pb10 act">
                    <h3><a href="javascript:void(0);" name="chooseat">如何选座？</a></h3>
                    <div class="hepl-info">
                        <p>1、首先注册成为猫眼电影票会员并登录（已有账号可以忽略此步）。</p>
                        <p>2、选择想看的影片或者影院</p>
                        <p>3、选择想看的场次并进行在线选座</p>
                        <p><img src="/home/images/help-chooseat.png" width="679" alt="如何选座" /></p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="dopay">如何支付？</a></h3>
                    <div class="hepl-info">
                        <p>可以选则使用余额、银行、支付宝、银联等支付方式来完成支付</p>
                        <p><img src="/home/images/help-pay.png" width="679" alt="如何支付" /></p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="geticket">如何取票？</a></h3>
                    <div class="hepl-info">
                        <p>购票成功后，凭借取票短信到影院出票观影。</p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="buyfailed">购票失败？</a></h3>
                    <div class="hepl-info">
                        <p>为什么购票之前锁定座位了，还会出现购票失败的情况？</p>
                        <p>锁定座位是在网络售票系统中将座位锁定，而此时影院本地系统仍然可以售卖对应的座位。而最后买票的时候， 网售系统要与地面系统确认购票。因此，如果期间座位被影院售出，就会发生买票失败的情况。</p>
                        <p>购票失败后，所付款项会返还到账户余额中。</p>
                        <p>您可以通过提前购票，错开购票高峰期的方式来降低这类情况出现的概率。</p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="reglogin">如何注册登录？</a></h3>
                    <div class="hepl-info">
                        <p>1、点击网站顶部左上角的注册链接，进入注册页面</p>
                        <p>2、填写手机号码以及密码</p>
                        <p>3、点击获取验证码的链接，验证码将发送到您的手机</p>
                        <p>4、填写收到的验证码，点击注册按钮，完成注册（立即注册）</p>
                        <p>5、注册成功后，使用注册的手机号和密码登录，即可开始使用猫眼电影票购票</p>
                        <p>6、您还可以使用手机验证码直接登录，无需注册</p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="forget">忘记密码？</a></h3>
                    <div class="hepl-info">
                        <p>如果您忘记了密码，可以在登录界面，点击登录按钮右侧的找回密码的链接。</p>
                        <p>如果输入的手机号码及验证码正确，密码将会被重置。</p>
                    </div>
                </li>
                <li>
                    <h3><a href="javascript:void(0);" name="mobilebuy">如何手机购票？</a></h3>

                </li>
            </ul>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".menu-helpcenter li a").each(function () {
            if ($(this).attr("data-i") == "usehelp") {
                $(this).parent().addClass("act");
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        var url = window.location.href;
        var strs = url.split("#");
        $(".wrapper-helpcenter .help-aq li a:[name=" + strs[1] + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        $(".info-help .help-nav li a").click(function () {
            var name = $(this).attr("href").split("#")[1];
            $(".wrapper-helpcenter .help-aq li a:[name=" + name + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        });
        $(".wrapper-helpcenter .help-aq li").click(function () {
            if (!$(this).hasClass("act")) {
                $(this).siblings().removeClass("act pb10").end().addClass("act pb10");
            }
        });
    });
</script>
</body>
</html>