<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-用户余额|猫眼电影票网_电影在线选座购票平台</title>
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
        <div class="box-con userpaytoaccount-usercenter">
            <div class="account-info">
                <h3>账户充值</h3>
                <div class="pay-num">
                    <ul class="fn-clear">
                        <li class="pt">请选择充值点数：</li>
                        <li>
                            <a href="javascript:void(0);" data-num="100">100点</a>
                            <span class="tag"></span>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-num="200">200点</a>
                            <span class="tag"></span>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-num="300">300点</a>
                            <span class="tag"></span>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-num="500">500点</a>
                            <span class="tag"></span>
                        </li>
                        <li><input type="number" name="num" class="other-num" />点</li>
                    </ul>
                </div>
              <div class="payment-account" style="display: none">
                    <div class="recommend fn-clear">
                        <span class="tag">推荐方式：</span>
                        <div class="con">
                            <ul>
                            	<#list payments as payment>
                            	<#if payment.getStatus() == 1>
                            	<li><label class="${payment}"><input type="radio" name="payment" checked="checked" data-paymethod="${payment.getName()}" value="${payment}"></label></li>
                            	</#if>
                            	</#list>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="total fn-clear">
                    <p>
                        <span>需支付：<em></em></span>
                        <span id="btnpay" class="btn">立即支付</span>
                    </p>
            </div>
        </div>
    </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">
$("#btnpay").click(function () {
    var num = $(".other-num").val();
    if (!num) {
        alert("请输入充值点数");
        return;
    }
    var payment = $("input[type=radio][name=payment]:checked").val();
    ajaxRequest('generate_pay_log','post',{money:num,paymentType:payment},function(rst){
        alert("充值成功！");
        window.location.reload();
    	//window.location.href = '/home/pay/to_pay?sn=' + rst.data;
    });
});
$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "useraccount") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});
$(".userpaytoaccount-usercenter .pay-num a").click(function () {
    $(this).parent().siblings().find("a").removeClass("select").end().find(".tag").hide();
    $(this).addClass("select").siblings(".tag").show();
    $(".other-num").val($(this).attr("data-num"));
    $(".userpaytoaccount-usercenter .total em").text($(this).attr("data-num")+"点");
});
$("input.other-num").blur(function () {
    $(".userpaytoaccount-usercenter .total em").text($(this).val() + "点");
});
</script>
</body>
</html>