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
        <div class="box-con account-usercenter">
            <div class="account-info">
                <h3>账户余额</h3>
                <p class="fn-clear"><span class="fn-left pt">当前余额：</span><em id="account" class="fn-left pt">${ylrc_account.balance}点</em><a href="user-pay-to-account" class="fn-left btn">充值</a></p>
            </div>
            <div class="pay-record pt30">
                <div class="title">充值记录</div>
                <div class="fn-clear th">
                    <span class="p1" style="width:160px;">时间</span> 
                    <span class="p2" style="width:120px;">点数(1元=1点)</span>
                    <span class="p2" style="width:100px;">状态</span>
                    <#--<span class="p3" style="width:120px;">充值方式</span> -->
                    <#--<span class="p3" style="width:120px;">操作</span> -->
                </div>
                <ul id="payrecordAccountUsercenter">
                	<#list payLogList as payLog>
                	<li style="padding-bottom:32px;">
                		<span class="p1" style="width:160px;">${payLog.updateTime}</span> 
	                    <span class="p2" style="width:120px;">${payLog.money}点</span>
	                    <span class="p2" style="width:100px;"><#if payLog.status == 0><font color="red">待支付</font><#else><font color="green">已支付</font></#if></span>
	                    <#--<span class="p3" style="width:120px;">${payLog.paymentType.getName()}</span> -->
	                    <#--<span class="p3" style="width:120px;margin-left:40px;">-->
	                    	<#--<#if payLog.status == 0>-->
	                    		<#--<a href="/home/pay/to_pay?sn=${payLog.sn}" class="btn">继续支付</a>-->
	                    	<#--</#if>-->
	                    <#--</span> -->
                	</li>
                	</#list>
                </ul>
                    <#if payLogList?? && payLogList?size gt 0>
                    <#else>
                    <p class="error">暂无充值记录</p>
                    </#if>
            </div>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">

$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "useraccount") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});  
</script>
</body>
</html>