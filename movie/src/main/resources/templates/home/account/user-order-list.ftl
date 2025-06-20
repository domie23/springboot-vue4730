<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-订单列表|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
    <link href="/home/css/jquery.jPages.css" rel="stylesheet" />
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-user-center">
    <div class="container fn-clear">
        <div class="menu-usercenter">
    	<#include "../common/account-menu.ftl"/>
		</div>
        <div class="box-con my-order-usercenter">
            <div class="th fn-clear">
                <span class="wd1">订单信息 </span>
                <span class="wd2">数量（张）</span>
                <span class="wd2">付款金额（元）</span>
                <span class="wd2">订单状态</span>
                <span class="wd3">操作</span>
            </div>
            <ul id="myOrderListUsercenter">
                    <#list orderList as order>
                    <li class="fn-clear" title="${order.cinemaHallSession.movie.name}">
                        <div class="film-info wd1">
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
                        <div class="wd2 pt">${order.num}</div>
                        <div class="wd2 pt">${order.newMoney}</div>
                        <div class="wd2 pt status" data-systemname="topstar" data-status="${order.status}" ></div>
                        <div class="wd3 pt2 action">
                            <#if order.status == 0>
                            <p class="box-btn"><span class="payagain-order btn" data-tag="1" data-sn="${order.sn}">立即支付</span></p>
                            </#if>
                            <p>
                                <a rel="#OrderDetailUserCenter" href="javascript:void(0);" data-timeshow="${order.cinemaHallSession.startTime}" data-filmnname="${order.cinemaHallSession.movie.name}" data-cinemaname="${order.cinemaHallSession.cinema.name}" data-showtime="${order.cinemaHallSession.startTime}" data-HallName="${order.cinemaHallSession.cinemaHall.name}" data-num="${order.num}" data-type="${order.cinemaHallSession.cinemaSessionType.getName()}" data-lang="${order.cinemaHallSession.movie.language.getName()}" data-price="${order.cinemaHallSession.oldPrice}" data-total="${order.oldMoney}" data-discount="0" data-pay="${order.newMoney}" data-SeatInfo="5排3座" data-Mobile="${order.account.mobile}" data-path="/photo/view?filename=${order.cinemaHallSession.movie.mainPic}" data-CheckCode="" data-SystemName="topstar" data-status="${order.status}" data-HaveATM="True" data-OrderNo="${order.sn}" class="order-datail">详情</a>
                                <#if order.status == -1 || order.status == 0>
                                <a href="javascript:void(0);" class="order-delete" data-OrderNo="${order.sn}">删除</a>
                            	</#if>
                            </p>
                        </div>
                    </li>
                	</#list>
            </ul>
            <div class="fn-acenter">
                <div class="jpage"></div>
            </div>
        </div>
    </div>
    <div class="order-detail-usercenter" id="OrderDetailUserCenter">
        <div class="con"></div>
    </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl"/> 
<script type="text/javascript">
 $(function () {
    $(".my-order-usercenter .status").each(function () {
        var $this = $(this);
        var status = $this.attr("data-status");
        if (status == "1") {
        	$this.text('已支付');
            $this.addClass("blue");
            $this.parent().find(".time").removeClass("pt15");
            //$this.parent().find(".checkCode").show();
            $this.parent().find(".remoteOrderNo").show();
        }
        if (status == "0") {
        	$this.text('待付款');
            $this.addClass("red");
        }
        if (status == "-1") {
        	$this.text('已取消');
            $this.addClass("grey");
        }
    });
    
});
$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "userorderlist") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});
$(".order-datail").overlay({
    closeOnClick: false,
    top: 'center',
    mask: {
        color: '#000',
        closeSpeed: 700,
        opacity: 0.7
    },
    onBeforeLoad: function (t) {
        $('body').on('mousewheel', function (e) {
            scrollFunc(e);
        });
        var data = $(t.target);
        var seat = [];
        var seatStr = '';
        ajaxAsyncRequest('get_order_item','post',{order_sn:data.attr("data-OrderNo")},function(rst){
        	seat = rst.data
        });
        var html = "";
        for(var i=0;i < seat.length;i++){
        	seatStr += seat[i].cinemaHallSeat.y + '排' + seat[i].cinemaHallSeat.x + '座 ';
        }
        var msg = data.closest("div.action").prev(".status").text();
        var crashmoney = parseFloat(data.attr("data-total")) - parseFloat(data.attr("data-pay"));
        html += '<h4>订单详情 · ' + msg + '</h4>';
        html += '<div class="order-detail"><h3>' + data.attr("data-filmnname") + '</h3>';
        html += '<ul><li>影院：' + data.attr("data-cinemaname") + '</li>';
        html += '<li>场次：' + data.attr("data-showtime") + '</li>';
        html += '<li>影厅：' + data.attr("data-hallname") + '</li>';
        html += '<li>数量：' + data.attr("data-num") + '</li>';
        html += '<li>版本：' + data.attr("data-type") + '</li>';
        html += '<li>语言：' + data.attr("data-lang") + '</li>';
        html += '<li>票价：' + data.attr("data-price") + ' 元</li>';
        html += '<li>总价：' + data.attr("data-total") + ' 元</li>';
        html += '<li>优惠：' + parseFloat(parseFloat(data.attr("data-discount")) + crashmoney) + ' 元</li>';
        html += '<li>实付：' + parseFloat(parseFloat(data.attr("data-pay")) - 0).toFixed(2) + ' 元</li>';
        html += '<li>座位：' + seatStr + '</li>';
        html += '<li>手机号：' + data.attr("data-mobile") + '</li></ul>';
        html += '<span class="pic"><img src="' + data.attr("data-path") + '" width="140" height="200" /></span></div>';
        html += '<div class="desc">';
        if (data.attr("data-status") == "1") {
            html += '<p class="p2"><span>取票订单号</span><span class="check-code">' + data.attr("data-OrderNo") + '</span></p>';
            if (data.attr("data-HaveATM")=="true") {
                html += '<p class="cor999">请凭取票码至影院自动取票机或前台售票窗口取票</p>';
            } else {
                html += '<p class="cor999">请凭取票码至影院前台售票窗口取票</p>';
            }
            
        }else if (data.attr("data-status") == "0") {
            html += '<p class="p4"><span class="payagain-order btn" data-tag="tag" data-sn="' + data.attr("data-OrderNo") + '">立即支付</span></p>';
        } else if (data.attr("data-status") == "-1") {
            html += '<p class="p3">失败原因：超时未支付，系统自动取消</p>';
        }
        html += '</div>';
        $("#OrderDetailUserCenter .con").html(html);
    },
    onClose: function () {
        $('body').off('mousewheel');
    }
});
var sbumit = delet= 1;
$(".payagain-order").live('click',function(){
	var sn = $(this).attr('data-sn');
   	window.location.href = "/home/order/order_pay?order_sn=" + sn;
});

$(".order-delete").click(function () {
    if (delet == 1) {
        var OrderNO = $(this).attr("data-OrderNo");
        if (OrderNO && confirm("确定要删除该订单?")) {
            $.ajax({
                url: "delete_order",
                data: {
                    order_sn: OrderNO
                },
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.code == 0) {
                        window.location.reload();
                    } else {
                        delet = 1;
                        alert('删除订单失败，请稍后再试');
                    }
                },
                error: function () {
                    delet = 1;
                    alert("网络错误,稍后再试！");
                }
            });
        }
    }
});
$(".my-order-usercenter .jpage").jPages({
    containerID: "myOrderListUsercenter",
    perPage: 4,
    delay: 30,
    fallback: 200,
    minHeight: false,
    previous: "上一页",
    next: "下一页"
});
</script>
</body>
</html>