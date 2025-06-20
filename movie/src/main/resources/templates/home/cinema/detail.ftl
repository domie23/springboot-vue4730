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
<style type="text/css">
    .anchorBL
    {
        display: none;
    }
</style>
</head>
<body>
	<#include "../common/header.ftl"/> 
<div id="body" class="main">
<div class="wrapper-cinemascreenings">
    <div class="cinemainfo-cinemascreenings">
        <h3>${cinema.name}<em>${cinema.rate!"0"}</em></h3>
        <p>${cinema.address}</p>
        <p class="cor999">电话：${cinema.tel}</p>
        <p class="cor999 pr">交通：${cinema.transport}</p>
        <p class="special-info">
        	<#list cinema.cinemaServiceList as cinemaService>
        	<span><img src='/home/images/${cinemaService.getImgUrl()}' alt='' title='${cinemaService.getName()}' height='16'></span>
        	</#list>
        </p>
        <span class="logo">
            <img src="/photo/view?filename=${cinema.picture}" width="150" height="150" alt="${cinema.name}" />
        </span>
       	<div class="box-cinemamap">
               <div id="cinemamap"></div>
       	</div>
    </div>
    <div class="cinema-filmscreenings-cinemascreenings pt30">
            <div class="box-title-timeshow">
                <div class="title">
                    <span class="pbuy pq">排期购票</span>
                    <span data-rel="#scrollcinemades" class="scrollcinemades">影院介绍</span>
                    <span data-rel="#scrollcomment" class="scrollcomment">影院评价</span>
                </div>
                <div class="time-show">
                    <ul class="fn-clear">
                       <#list cinemaHallSessionList as cinemaHallSession>
                       <li><a href="javascript:void(0)" data-time="${cinemaHallSession.showDate}" onClick="selectDate(this)" >${cinemaHallSession.showDate}</a></li>
                       </#list> 
                    </ul>
                    <span class="th">日期：</span>
                </div>
            </div>
            <div class="film-show" data-time="" style="">
                
                    
                
                    <div class="film-screenings">
                        <div class="film-info" id="current-movie" style="display:none;">
                            <h3>
                            	<span id="current-movie-name"></span>
                            	<div id="current-movie-rate-star" style="margin: 0 5px;display: inline-block;" data-average="8.9" data-id="20"></div>
                            	<em id="current-movie-rate">8.9</em>
                            	<a href="" id="current-movie-href" target="_blank">查看影片详情</a></h3>
                            <p></p>
                            <p id="current-movie-directed-by"></p>
                            <p id="current-movie-actor"></p>
                        </div>
                     </div>
            </div>
    </div>
    <div class="cinema-des-cinemascreenings pt30" id="scrollcinemades">
        <div class="title">影院介绍</div>
        <div class="cinema-des">
            <div class="description ovhide">
                <p class="con">${cinema.info!"暂无介绍"}</p>
                <span class="flag"><a href="javascript:void(0)">展开</a></span>
            </div>
            <p class="special-info"></p>
            <div class="cinema-photo">
                <img src="/photo/view?filename=${cinema.picture}" width="280" height="220" />
            </div>
        </div>
    </div>
    <div class="comment-othercinema-cinemascreenings pt30 fn-clear" id="scrollcomment">
        <div class="comment">
            <div class="title pb10" id="scrollComment"><span class="titb">用户评论</span><span>共0条评论</span></div>
            <div class="message-send">
                <div class="box-send">
                    <div class="do-box-score">
                        <div class="do-score" data-average="0" data-id="doscore"></div>
                        <span class="result">请评分</span>
                    </div>
                    <div id="recomment" class="do-message" contenteditable="true"></div>
                </div>
                <p class="fn-clear pt30"><a href="javascript:void(0)" class="btn fn-right">发表评论</a></p>
                <span class="photo">
                    <#if ylrc_account??>
                	<img id="userheader" src="/photo/view?filename=${ylrc_account.headPic}" width="64" height="64" />
                	<#else>
                	<img id="userheader" src="/home/images/ico_tb_lg.png" width="64" height="64" />
                	</#if>
                 </span>
            </div>
            <div class="message-list pt30">
				<div class="message-list pt30">
					   <ul id="message-container">
							<#list commentList as comment>
							<li>
								<div class="username-score fn-clear">
									<span class="fn-left">${comment.account.nickname!comment.account.mobile?replace(comment.account.mobile?substring(3,7),"****")}</span>
									<p class="fn-left yyscore" data-average="${comment.rate}" data-id="${comment.id}" ></p>
								</div>
								<p class="message-con">${comment.content}</p>
								<p class="time">
									<span class="fn-right">${comment.createTime}</span>
								</p>
								<span class="photo">
									 <img src="/photo/view?filename=${comment.account.headPic}" width="64" height="64">
								</span>
								<span class="flag"></span>
							</li>
							</#list>
						</ul>
						<#if commentList?? && commentList?size gt 0>
	                    <div class="fn-acenter">
			                <div class="jpage"></div>
			            </div>
	                    <#else>
	                    <p class="error">还没有评论，抢个沙发~</p>
	                    </#if>
				</div>
            </div>
        </div>
        <div class="cinema-near">
            <div class="title pb10"><span class="titb">其他周边影院</span></div>
            <ul>
                   <#list nearCinemaList as nearCinema>
                   <#if nearCinema.id != cinema.id>
                   <li>
                       <h4 class="fn-clear"><a class="fn-left" href="detail?id=${nearCinema.id}" target="_blank">${nearCinema.name}</a><span class="fn-right">${nearCinema.rate!"0"}</span></h4>
                       <p>${nearCinema.address}</p>
                   </li>
                   </#if>
                   </#list>
            </ul>
        </div>
    </div>
</div>
<div id="box-cinemamapBig">
    <div id="cinemamapBig"></div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
$(document).ready(function(){
	 
    $(".message-send .do-score").jRating({
        rateMax: 10,
        sendRequest: false,
        rateInfosX: -35,
        rateInfosY: 15,
        canRateAgain: true,
        nbRates: 5,
        bigStarsPath: '/home/images/ico_tb_stars.png',
        onClick: function (e, r) {
            $(".do-box-score .result").html("<em>" + r + "</em>" + "分");
            if ("${ylrc_account!"false"}".toLowerCase() == "false") {
                $(".boxLogin").overlay({ api: true }).load();
            }
        }
    });
    $('.score').jRating({
        rateMax: 10,
        isDisabled: true,
        bigStarsPath: '/home/images/ico_tb_stars.png'
    });
    $('.ypscore').jRating({
        rateMax: 10,
        isDisabled: true,
        bigStarsPath: '/home/images/ico_tb_stars.png'
    });
    $('.score').each(function () {
        if ($(this).attr("data-average") != "0") {
            var html = "<span class='jscore'>" + $(this).attr("data-average") + "</span>";
            $(this).append(html);
        }
    });	
    
    $(".wrapper-cinemascreenings .cinema-des .description .flag a").toggle(function () {
        $(this).text("收起");
        $(this).parent().parent().removeClass("ovhide").addClass("visable");
    }, function () {
        $(this).text("展开")
        $(this).parent().parent().removeClass("visable").addClass("ovhide");
    });
    //首次加载，触发第一个时间
    $(".time-show li:first a").trigger('click');
});



$("#recomment").focus(function () {
    if ("${ylrc_account!"false"}".toLowerCase() == "false") {
        $(".boxLogin").overlay({ api: true }).load();
        return false;
    }
});
$('.fjscore').jRating({
    rateMax: 10,
    isDisabled: true,
    bigStarsPath: '/home/images/ico_tb_stars.png'
});

$('.yyscore').jRating({
    rateMax: 10,
    isDisabled: true,
    bigStarsPath: '/home/images/ico_tb_stars.png'
});
$(".message-send .btn").click(function () {
    var score = $(this).parent().parent().find(".result>em").text();
    var comment = $("#recomment").text();
    if (!score) {
        alert("请评分!");
        return;
    }
    if (comment == "") {
        alert("内容不能为空!");
        return;
    }
    var data = {rate:score,content:comment,'cinema.id':${cinema.id}};
    ajaxRequest('/home/comment/comment_cinema','post',data,function(rst){
    	alert('评价成功！');
    	window.location.reload();
    });
    
});
//跳转到详情、评价等div
$(".cinema-filmscreenings-cinemascreenings .title span:not(.pq)").click(function () {
    $("html, body").animate({
        scrollTop: $($(this).attr("data-rel")).offset().top + "px"
    }, {
        duration: 500,
        easing: "swing"
    });
    return false;
});

function selectDate(e){
	var date = $(e).attr('data-time');
	$(e).parent().siblings().find("a").removeClass('current');
	$(e).addClass('current');
	$.get("get_show_movie",{cid:${cinema.id},showDate:date},function(data,status){
        $("#current-show-movie").remove();
        $(".film-show").prepend(data);
        $('#current-show-movie').flexslider({
		    animation: "slide",
		    controlNav: false,
		    slideshow: false,
		    itemWidth: 170,
		    after: function (slider) {
		    console.log(slider);
		    }
		});
		//默认选中第一步电影
		$(".film-img .slides li:first a").trigger('click');
    });
}
function getMovieSession(mid){
	var cid = ${cinema.id}
	var showDate = $(".time-show li").find("a[class='current']").attr('data-time');
	$.get("/home/movie/get_show_session",{mid:mid,cid:cid,showDate:showDate},function(data,status){
        $(".screenings-show").remove();
        $(".film-screenings").append(data);
    });
}
$(".message-list .jpage").jPages({
    containerID: "message-container",
    perPage: 10,
    delay: 30,
    fallback: 200,
    minHeight: false,
    previous: "上一页",
    next: "下一页"
});
</script>
</body>
</html>