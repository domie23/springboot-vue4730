<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>确认支付订单-猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
    <link href="/home/css/jquery.jPages.css" rel="stylesheet" />
</head>
<body>
	<#include "../common/header.ftl"/> 
<div id="body" class="main">
<div class="wrapper-pay-order">
    <div class="tip-nav-payorder">
        <ul>
            <li class="wd1">1.选择影片场次</li>
            <li class="wd3">2.在线选座</li>
            <li class="wd2 act">3.确认订单支付</li>
            <li class="wd4">4.影院取票观影</li>
        </ul>
    </div>
    <div class="order-info-payorder">
        <div class="title">
            确认订单信息</div>
        <div class="box-order-info fn-clear">
                <div class="film-info" data-seatnum="2">
                    <h3>${order.cinemaHallSession.movie.name}</h3>
                    <p>
                        <span>影院：</span><span>${order.cinemaHallSession.cinema.name}</span>
                    </p>
                    <p>
                        <span>影厅：</span><span>${order.cinemaHallSession.cinemaHall.name}</span>
                   	</p>
                    <p>
                        <span>票价：</span><span>${order.cinemaHallSession.newPrice}元</span>
                    </p>
                    <p>
                        <span>场次：</span><span>${order.cinemaHallSession.startTime}</span></p>
                    <p>
                        <span>座位：</span>
                        <span>
                        <#list orderItemList as orderItem>
                        ${orderItem.cinemaHallSeat.y}排${orderItem.cinemaHallSeat.x}座 
                        </#list>
                        </span>
                    </p>
                    <p>
                        <span>总价：</span><span>${order.newMoney} 元</span></p>
                    <span class="pic">
                        <img src="/photo/view?filename=${order.cinemaHallSession.movie.mainPic}" width="140" height="200" />
                    </span>
                </div>
                <div class="ticket-info">
                    <p>
                        取票手机号：
                    </p>
                    <p class="tel">${order.account.mobile}</p>
                    <p>
                        取票短信可能会被手机软件拦截，请注意！
                    </p>
                    <p class="fn-clear">
                        <!--<a href="javascript:void(0);" class="btn">重新选座</a>-->
                    </p>
                </div>

        </div>
    </div>
    <div class="payment-payorder">
        <div class="title">
            选择支付方式</div>
        <div class="recommend fn-clear">
            <span class="tag">推荐方式：</span>
            <div class="con">
                <ul>
                	<li class="wd">
                		<label class="account" style="width:370px;">
	                		<input type="radio" name="payment" class="fn-left" data-paymethod="账户余额" data-payid="account" checked>
	                		<span class="fn-left">余额支付(可用余额：<em class="red" id="user-balance">${ylrc_account.balance}</em>元)</span>
                		</label>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="box-payinfo-payorder">
        <div class="pay-info-payorder fix-payorder">
            <div class="container fn-clear">
                <div class="cuttime">
                    <p class="p1">
                        <span>请在</span><span class="cuttime-show"></span><span>内完成支付</span></p>
                    <p>
                        超时系统将自动取消订单</p>
                </div>
                <div class="pay">
                        <p>
                            <span>总价：${order.newMoney} 元，</span>
                            <span class="tip-ck fn-hide">使用观影卡兑换电影票*<em>1</em>，</span>
                            <span class="fn-hide">优惠<em class="discount red">15</em>元</span>
                            <span>还需支付 <span id="needpay" data-val="${order.newMoney}">${order.newMoney}</span> 元</span>
                        </p>
                        <p>
                            <a id="btnpay" href="javascript:void(0);" class="btn fn-right">立即支付</a>
                        </p>
                        <a rel="#payOrderAlert" href="javascript:void(0);" class="goPay fn-hide"></a>

                </div>
            </div>
        </div>
    </div>
    <div class="pay-alert-payorder" id="payOrderAlert">
        <h4>
            请尽快完成付款</h4>
        <div class="des">
            <p class="big">
                <span>请在</span><span class="cuttime-show2"></span><span>秒内完成付款,超时系统将自动取消座位</span></p>
            <p>
                如遇问题请联系客服400-660-5335</p>
        </div>
        <p class="box-btn fn-acenter">
            <a href="javascript:void(0);" class="btn pay-success">已付款</a> <a href="javascript:void(0);"
                class="btn pay-error">重新选择</a>
        </p>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
$(document).ready(function(){
	countDown(parseInt("${leftTime}"), ".cuttime-show", "订单已超时", 1, 1);
    countDown(parseInt("${leftTime}"), ".cuttime-show2", "订单已超时", 1,0);
    //点击支付按钮
    $("#btnpay").click(function(){
    	var balance = ${ylrc_account.balance};
    	var money = ${order.newMoney};
    	if(money > balance){
    		alert('余额不足，请先到会员中心进行充值！');
    		return;
    	}
    	ajaxRequest('order_pay','post',{order_sn:'${order.sn}'},function(rst){
    		window.location.href = '/home/account/user-order-list';
    	});
    });
});
$(".goPay").overlay({
    closeOnClick: false,
    top: 'center',
    mask: {
        color: '#000',
        closeSpeed: 700,
        opacity: 0.7
    },
    onBeforeLoad: function () {
        $('body').on('mousewheel', function (e) {
            scrollFunc(e);
        });
    },
    onClose: function () {
        $('body').off('mousewheel');
    }
});
</script>
</body>
</html>