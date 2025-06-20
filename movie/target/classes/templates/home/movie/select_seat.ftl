<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
    <link href="/home/css/jquery.jPages.css" rel="stylesheet" />
</head>
<body>
	<#include "../common/header.ftl"/> 
<div id="body" class="main">
<div class="wrapper-film-chooseseat">
    <div class="tip-nav-choosseeat">
        <ul>
            <li class="wd1">1.选择影片场次</li>
            <li class="wd2 act">2.在线选座</li>
            <li class="wd3">3.确认订单支付</li>
            <li class="wd4">4.影院取票观影</li>
        </ul>
    </div>
    <div class="fiml-chooseseat fn-clear">
        <div class="film-choose-seat">
            <div class="bg_screen clearfix"><span>荧幕</span></div>
            <div class="seat-description fn-acenter">
                <p class="fn-clear">
                    <img src="/home/images/seat_able.png" /><span>可选</span>
                    <img class="pl10" src="/home/images/seat_seled.png" /><span>已选</span>
                    <img class="pl10" src="/home/images/seat_unable.png" /><span>已售</span>
                    <img class="pl10" src="/home/images/seat_love.png" />
                    <img src="/home/images/seat_love.png" /><span>情侣座</span>
                    </p>
            </div>
            <div class="box-seat-des">
                <div id="seatcontainer">
                	<table id="seattable" class="seatdt">
                		<tbody>
                			<#list cinemaHallSeatList as cinemaHallSeat>
		                      <#if cinemaHallSeat.x == 1>
		                      <tr>
		                      </#if>
                				<td class="show-seat" style="width:38px;position:relative;cursor:pointer;padding-bottom:5px;" seatcol="${cinemaHallSeat.x}" seatrow="${cinemaHallSeat.y}" seatno="${cinemaHallSeat.id}" status="${cinemaHallSeat.status}" type="${cinemaHallSeat.type}" onclick="seatClick(this)">
                					<div class="seatno" style="width:38px;top:6px;"><#if cinemaHallSeat.status == 1 && cinemaHallSeat.type == 1>${cinemaHallSeat.x}</#if></div>
                					<#if cinemaHallSeat.status == 1>
                					<#if cinemaHallSeat.type == 2>
                					<img style="z-index:120;" width="38px" height="30px" src="/home/images/seat_love.png">
                					<#else>
                					<img style="z-index:120;" width="38px" height="30px" src="/home/images/seat_able.png">
                					</#if>
                					<#else>
                					<img style="z-index:120;" width="38px" height="30px" src="/home/images/seat_unable.png">
                					</#if>
                				</td>
                			  <#if cinemaHallSeat.x == cinemaHallSession.cinemaHall.maxX>
		                      </tr>
		                      </#if>
		                    </#list>
                		</tbody>
                	</table>
                </div>
            </div>
            <table id="indextable" class="seatdt">
            	<tbody>
            		<#list 1..cinemaHallSession.cinemaHall.maxY as y>
            		<tr style="height:35px;">
            			<td align="center" valign="middle">${y}</td>
            		</tr>
            		</#list>
            	</tbody>
            </table>
        </div>
        <div class="box-film-info">
            <div class="film-info">
                <h2>${cinemaHallSession.movie.name}</h2>
                <p>片长：${cinemaHallSession.movie.time}分钟</p>
                <p>语言：${cinemaHallSession.movie.language.getName()}</p>
                <span class="pic"><img src="/photo/view?filename=${cinemaHallSession.movie.mainPic}" width="72" height="100" /></span>
            </div>
            <div class="film-detail">
                <p><span class="cor999">影院：</span><span>${cinemaHallSession.cinema.name}</span></p>
                <p><span class="cor999">影厅：</span><span>${cinemaHallSession.cinemaHall.name}</span></p>
                <p><span class="cor999">票价：</span><span>${cinemaHallSession.newPrice} 元/张</span></p>
                <div class="screen-info fn-clear">
                    <span class="cor999">场次：</span>
                    <span class="red">${cinemaHallSession.startTime}</span>
                    <span class="change-showtime"></span>
                    <div class="box-screen-today">
                    </div>
                </div>
                <div class="box-seatchoose">
                    <div id="seatchoose" class="fn-clear">
                        <div id="lblmsg" class="cor999">请选择座位</div>
                    </div>
                    <p class="tip">已选择<em>0</em>个座位，再次点击座位可以取消</p>
                    <span class="tg cor999">座位：</span>
                </div>
                
            </div>
            <div class="choose-result">
                <p class="total"><span class="cor999">总计：</span><strong>0</strong><em class="fn-bold">元</em></p>
                <p><a class="btn" id="btnconfirm" href="javascript:void(0)">立即购票</a></p>
            </div>
        </div>
    </div>
    <div class="tip-description-choosseeat">
        <h3><span class="titb">使用说明</span></h3>
        <p>
            1.选择你要预定的座位，重复点击取消所选座位。<br />
            2.每笔订单最多可选购4张电影票，情侣座不单卖。<br />
            3.选座时，请尽量选择相邻座位，请不要留下单个座位。<br />
            4.下单后请于15分钟内完成支付，超时系统将不保留座位。<br />
            5.电影票售出后暂不支持退换。<br />
            6.购票过程产生的各项咨询，请拨打客户电话400-660-5335。
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
	 //提交订单
	 $("#btnconfirm").click(function(){
	 	if(selectedSeats == null || selectedSeats == 'undefined'){
	 		alert('请至少选择一个座位!');
	 		return;
	 	}
	 	var data = {};
	 	data.cinema_hall_session_id = ${cinemaHallSession.id};
	 	data.cinema_hall_seat_ids = JSON.stringify(selectedSeats);
	 	ajaxRequest('/home/order/generate_order','post',data,function(rst){
	 		//订单提交成功，跳转到支付页面
	 		window.location.href = '/home/order/order_pay?order_sn=' + rst.data;
	 	});
	 });
	 //遍历所有的座位，根据订单中的值改变其状态
	 $(".show-seat").each(function(i,e){
	 	if(orderSeats.includes(parseInt($(e).attr('seatno')))){
	 		$(e).attr('status',0);
	 		$(e).children("img").attr('src','/home/images/seat_unable.png');
	 		$(e).children(".seatno").text('');
	 	}
	 });
});
var NormalPrice = parseFloat("${cinemaHallSession.newPrice}");
var selectedSeatMax = ${selectedSeatMax};
var selectedSeats;
var orderSeats = ${orderSeatList!"[]"};
function seatClick(e){
	if($(e).attr('status') == 1){
		if($(e).attr('selected') != 'selected'){
			if($('td[selected="selected"]').length >= selectedSeatMax){
				alert('最多可选择' + selectedSeatMax + '个座位!')
				return;
			}
			$(e).children("img").attr('src','/home/images/seat_seled.png');
			$(e).attr('selected','selected');
		}else{
			if($(e).attr('type') == '2'){
				$(e).children("img").attr('src','/home/images/seat_love.png');
				$(e).removeAttr('selected');
			}else{
				$(e).children("img").attr('src','/home/images/seat_able.png');
				$(e).removeAttr('selected');
			}
		}
		setSeat();
	}
}
function setSeat() {
    var html = '';
    selectedSeats = new Array();
    $('td[selected="selected"]').each(function(i,e){
	    var seatno = $(e).attr('seatno');
	    var seatrow = $(e).attr('seatrow');
	    var seatcol = $(e).attr('seatcol');
	    html += '<div id="' + seatno + '" class="seatinfo">' + seatrow + "排" + seatcol + "座" + '</div>';
    	selectedSeats.push({id:seatno});
    });
    $("#seatchoose div.seatinfo").remove();
    $("#seatchoose").append(html);
    var selectedNum = $('td[selected="selected"]').length;
    if(selectedNum <= 0){
    	$("#lblmsg").show();
    }else{
    	$("#lblmsg").hide();
    }
    $(".choose-result .total strong").text(NormalPrice * selectedNum);
    $(".tip em").text(selectedNum);
}
</script>
</body>
</html>