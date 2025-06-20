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
</head>
<body>
	<#include "../common/header.ftl"/>   
    <div id="body" class="main">
    <div class="main-ad">
        <ul class="slides">
				<li style="background-image: url(/home/images/1.jpg);">
               </li>
			   <li style="background-image: url(/home/images/2.jpg);">
               </li>
                <li style="background-image: url(/home/images/3.jpg);">
               </li>
			    <li style="background-image: url(/home/images/4.jpg);">
               </li>
			    <li style="background-image: url(/home/images/5.jpg);">
               </li>
        </ul>
    </div>
    <div class="wrapper-main">
        <div class="hot-film-index pt30">
            <div class="title">
                <span class="titb">正在热映</span>
                <span>共12部热映电影</span>
                <span class="current"><em class="blue">1</em>/2</span>
            </div>
            <ul class="fn-clear slides">
                    <#list topMovieList as topMovie>
                    <li>
                        <a href="/home/movie/detail?id=${topMovie.id}" title="${topMovie.name}" target="_blank"><img src="/photo/view?filename=${topMovie.mainPic}" alt="${topMovie.name}" /></a>
                        <a class="overhide" href="/home/movie/detail?id=${topMovie.id}" title="${topMovie.name}" target="_blank">${topMovie.name}</a>
                        <div class="wrap-score fn-clear">
                        	<div class="box-score fn-clear">
                        		<p class="score" data-average="${topMovie.rate!"0"}" data-id="5"></p>
                        		<span class="jscore">${topMovie.rate!"0"}</span>
                        	</div>
                        </div>
                    </li>
                    </#list>
            </ul>
        </div>
        <div class="hot-active-index fn-clear pt30">
            <div class="active-recomment">
                <div class="title fn-clear"><span class="titb fn-left">热门资讯</span><span class="fn-right"><a class="more" href="/home/news/list" target="_blank">更多</a></span></div>
                <ul>
                        <#list topNewsList as topNews>
                        <li>
                            <a title="${topNews.title}" href="/home/news/detail?id=${topNews.id}" target="_blank"><img src="/photo/view?filename=${topNews.picture}" width="310" height="180" /></a>
                            <p><a title="${topNews.title}" href="/home/news/detail?id=${topNews.id}" target="_blank">${topNews.title}</a></p>
                            <span class="cor999">
                            	<#if topNews.abs?length gt 68>
                            	${topNews.abs?substring(0,68)}...
                            	<#else>
                            	${topNews.abs}
                            	</#if>
                            </span>
                        </li>
                        </#list>
                </ul>
            </div>
            <div class="top-sale">
                <div class="title"><span class="titb">热门影院</span></div>
                <ul>
	                <#list topCinemaList as topCinema>
	                <li class="fn-clear"><a href="/home/cinema/detail?id=${topCinema.id}" target="_blank">${topCinema.name}</a><span>${topCinema.rate!"0"}</span></li>
	                </#list> 
                </ul>
            </div>
        </div>

        <div class="ad pt30">
                <a href="https://www.yuanlrc.com/" title="猫眼Beta官网" target="_blank"><img src="/home/images/20200111221710175501215.jpg" width="990" alt="猫眼Beta官网" /></a>
        </div>

        <div class="future-film-index pt30 fn-clear">
            <div class="future-film">
                <div class="title pb10">
                    <span class="titb">热门预告</span>
                </div>
                <ul class="fn-clear">
                        <#list topVideoMovieList as videoMovie>
                        <li>
                            <a href="/home/movie/detail?id=${videoMovie.id}" target="_blank"><img src="/photo/view?filename=${videoMovie.mainPic}" alt="${videoMovie.name}" width="140" height="193" /></a>
                            <p class="overhide"><a href="/home/movie/detail?id=${videoMovie.id}">${videoMovie.name}</a></p>
                            <a href="javascript:void(0);" data-url="/download/download_video?filename=${videoMovie.video}" rel="#futurefilmPlay" class="btn-video"></a>
                        </li>
                        </#list>
                </ul>
            </div>
            <div class="top-cinema">
                <div class="title pb10">
                    <span class="titb">票房排行</span>
                </div>
                <ul>
                     <#list topMoneyMovieList as moneyMovie>
                        <li class="fn-clear">
                        	<a href="/home/movie/detail?id=${moneyMovie.id}" title="${moneyMovie.name}" target="_blank">
                        		<#if moneyMovie.name?length gt 25>
                        		${moneyMovie.name?substring(0,25)}...
                        		<#else>
                        		${moneyMovie.name}
                        		</#if>
                        	</a>
                        	<span>${moneyMovie.rate!"0"}</span>
                        </li>
                     </#list>  
                </ul>
            </div>
        </div>
    </div>
    <div id="futurefilmPlay">
        <div class="box-video"></div>
    </div>

        </div>
<#include "../common/footer-js.ftl"/> 
        <#include "../common/footer.ftl"/> 
        <#include "../common/login-dialog.ftl"/> 
        
        

<script type="text/javascript">
$(function () {
    $(".hot-active-index .active-recomment li:last").addClass("fn-right");
    $(".gyfc-film-index .gyfc-film li:not(:last)").addClass("mr31");
    $(".future-film-index .future-film li:not(:last)").addClass("mr30");
});
$(window).load(function () {
    $('.main-ad').flexslider({
        animation: "slide"
    });
    $('.hot-film-index').flexslider({
        animation: "slide",
        slideshow: false,
        controlNav: false,
        itemWidth: 169,
        after: function (slider) {
            $(".hot-film-index .current em").text(slider.currentSlide+1);
        }
    });
    $(".main-ad").hover(function () {
        $(".main-ad .flex-direction-nav").show();
    }, function () {
        $(".main-ad .flex-direction-nav").hide();
    });
});
        
</script>

<script type="text/javascript">
    $(function () {
        $(".classic-comment-index .new li p:first").show();
        $(".classic-comment-index .new li").hover(function () {
            $(this).siblings().find("p").hide();
            $(this).find("p").show();
        }, function () {
           
        });
        $('.score').jRating({
            rateMax: 10,
            isDisabled: true,
            length: 5,
            type:'small',
            smallStarsPath: '/home/images/ico_tb_stars_small.png'
        });
    });
    $(".future-film-index .btn-video").overlay({
        closeOnClick: false,
        top: 'center',
        mask: {
            color: '#333',
            closeSpeed: 100,
            opacity: 0.8
        },
        onBeforeLoad: function () {
            $('body').on('mousewheel', function (e) {
                scrollFunc(e);
            });
        },
        onBeforeLoad: function (e) {
            var video = $(e.target);
            var html = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
            html += '<param name="movie" value="/home/images/flvplayer.swf" />';
            html += '<param name="quality" value="high" />';
            html += '<param name="allowFullScreen" value="true" />';
            html += '<param name="wmode" value="transparent"/>';
            html += '<param name="FlashVars" value="vcastr_file=' + video.attr("data-url") + '&&IsAutoPlay=1" />';
            html += '<embed src="/home/images/flvplayer.swf" womode="transparent" allowfullscreen="true" flashvars="vcastr_file=' + video.attr("data-url") + '&&IsAutoPlay=1" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
            html += '</object>';
            $("#futurefilmPlay .box-video").html(html);
        },
        onClose: function () {
            $('body').off('mousewheel');
            $("#futurefilmPlay .box-video").empty();
        }
    });
</script>
</body>
</html>