<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心|猫眼电影票网_电影在线选座购票平台</title>
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
        <div class="box-con index-usercenter">
            <div class="account-info">
                <ul class="fn-clear">
                    <li class="br photo">
                        <h4>${ylrc_account.nickname!"暂无昵称"}</h4>
                        <p>${ylrc_account.mobile}</p>
                        <span class="pic"><img src="/photo/view?filename=${ylrc_account.headPic}" width="72" height="72" /></span>
                    </li>
                    <li class="br">
                        <h4>账户余额（点）</h4>
                        <p class="account">${ylrc_account.balance}</p>
                    </li>
                    <li>
                        <h4>优惠券（张）</h4>
                        <p class="cuopon">(暂无开发此功能)</p>
                    </li>
                </ul>
            </div>
            <div class="order-recently">
                <div class="title">最近购票记录</div>
                <div class="fn-clear th">
                    <span class="p1">订单信息</span>
                    <span class="p2">数量（张）</span>
                    <span class="p3">付款金额（点）</span>
                </div>
                <ul id="orderListRecently" class="my-order-usercenter">
                	<#list orderList as order>
                    <li class="fn-clear" title="${order.cinemaHallSession.movie.name}">
                        <div class="film-info wd1" style="width:297px;">
                            <h3><a href="/home/movie/detail?id=${order.cinemaHallSession.movie.id}" target="_blank">
                            <#if order.cinemaHallSession.movie.name?length gt 10>
		            		${order.cinemaHallSession.movie.name?substring(0,10)}...
		            		<#else>
		            		${order.cinemaHallSession.movie.name}
		            		</#if>
                            </a></h3>
                            <p class="cinm">${order.cinemaHallSession.cinema.name}</p>
                            <p class="pt15 time">${order.updateTime}</p>
                            <p class="checkCode">取票码：</p>
                            <p class="remoteOrderNo">取票订单号：${order.sn}</p>
                            <span class="pic"><a href="/home/movie/detail?id=${order.cinemaHallSession.movie.id}" target="_blank"><img src="/photo/view?filename=${order.cinemaHallSession.movie.mainPic}" width="72" height="100" alt="${order.cinemaHallSession.movie.name}" /></a></span>
                        </div>
                        <div class="wd2 pt" style="width:160px;">${order.num}</div>
                        <div class="wd2 pt" style="width:320px;">${order.newMoney}</div>
                    </li>
                	</#list>
                </ul>
                    <#if orderList?? && orderList?size gt 0>
                    <#else>
                    <p class="error">暂无记录</p>
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
    if ($(this).attr("data-i") == "usercenter") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});   
</script>
</body>
</html>