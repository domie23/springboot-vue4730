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
<div class="wrap-detail">
    <div class="wrapper-film-infodetail" style="background:url(/home/images/ico_bg_3.jpg) repeat-y center top;">
        <div class="box-film-infodetail">
            <div class="film-info-detail">
                <h1>
                    <span>${movie.name}</span>
                    <em>${movie.rate!"0"}</em>

                </h1>
                <p class="excellent">${movie.abs!"暂无信息"}</p>
                <p>
                    <span>导演：</span>
                    <span>${movie.directedBy}</span>
                </p>
                <p class="actor">
                    <span>主演：</span>
                    <span class="con">${movie.actor}</span>
                </p>
                <p>
                    <span>语言：</span>
                    <span>${movie.language.getName()}</span>
                </p>
                <p>
                    <span>片长：</span>
                    <span>${movie.time} 分钟</span>
                </p>
                <p>
                    <span>上映：</span>
                    <span>${movie.showTime}</span>
                </p>
                <p class="intro ovhide">
                    <span>剧情：</span>
                    <span class="con" data-t="<#if movie.info?length gt 118>${movie.info?substring(0,118)}...<#else>${movie.info}</#if>">${movie.info}</span>
                </p>
                <span class="img-main"><img src="/photo/view?filename=${movie.mainPic}" width="210" height="285" alt="${movie.name}" /></span>
                <div class="bdsharebuttonbox" data-tag="share_2">
                    <a class="bds_more" data-cmd="more">分享</a>
                </div>
                <a href="javascript:void(0);" class="flag">展开</a>
            </div>
        </div>
    </div>

    <div class="container fn-clear">
            <div class="film-pics-detail">
                <ul class="fn-clear">
                            <#if movie.video?? && movie.video?length gt 0>
                            <li>
                                <a class="filmVideo">
                                	<img src="/photo/view?filename=${movie.mainPic}" width="150" height="100" /></a>
                                <a href="javascript:void(0)" rel="#verlayVideo" class="video-play"></a>
                            </li>
                            </#if>
                            <#list movie.pictureList as pic>
                                <li>
                                    <a rel="#verlayPics" href="javascript:void(0)" class="filmPics">
                                    	<img data-index="0" src="/photo/view?filename=${pic}" width="150" height="100" />
                                    </a>
                                    <#if pic_index gt 2>
                                    <#break>
                                    </#if>
                                </li>
                            </#list>

                </ul>
                <div class="total">
                    <p class="bd">
                        <span>剧照：</span>
                        <strong>${movie.pictureList?size}</strong>
                    </p>
                    <p>
                        <span>视频：</span>
                        <strong><#if movie.video?? && movie.video?length gt 0>1<#else>0</#if></strong>
                    </p>
                </div>
            </div>
                    <div class="film-schedule-detail pt30">
                <div class="schedule-filte">
                    <div class="title">
                        <span class="pq">排期购票</span>
                        <span data-rel="#scrollComment" name="scrollComment" class="do-flim-comment">影评</span>
                    </div>
                    <div class="cinema">
                        <ul class="fn-clear">
                            <#if distinctCinemaHallSessionList?size == 0>
                            	暂无影院
                            <#else>
                            <#list distinctCinemaHallSessionList as cinemaHallSession>
                            <#if ylrc_area??>
                            <#if ylrc_area.id == cinemaHallSession.cinema.area.cityId>
                            <li data-cid="${cinemaHallSession.cinema.id}" data-address="${cinemaHallSession.cinema.address}" data-name="${cinemaHallSession.cinema.name}">
                                <a href="javascript:void(0);">${cinemaHallSession.cinema.name}</a>
                            </li>
                            </#if>
                            <#else>
                            <li data-cid="${cinemaHallSession.cinema.id}" data-address="${cinemaHallSession.cinema.address}" data-name="${cinemaHallSession.cinema.name}">
                                <a href="javascript:void(0);">${cinemaHallSession.cinema.name}</a>
                            </li>
                            </#if>
                            </#list>
                            </#if>
                        </ul>
                        <span class="tg cor999">影院：</span>
                    </div>
                    <div class="date">
                        <ul class="fn-clear film-date-list">
                            <#if distinctShowDateCinemaHallSessionList?size == 0>
                            	暂无排期
                            <#else>
                            <#list distinctShowDateCinemaHallSessionList as cinemaHallSession>
                            <#if ylrc_area??>
                            <#if ylrc_area.id == cinemaHallSession.cinema.area.cityId>
                            <li data-index="0" data-cid="${cinemaHallSession.cinema.id}">
                                <a href="javascript:void(0);">${cinemaHallSession.showDate}</a>
                            </li>
                            </#if>
                            <#else>
                            <li data-index="0" data-cid="${cinemaHallSession.cinema.id}">
                                <a href="javascript:void(0);">${cinemaHallSession.showDate}</a>
                            </li>
                            </#if>
                            </#list>
                            </#if>
                        </ul>
                        <span class="tg cor999">日期：</span>
                    </div>
                </div>
                <div class="title pb10 pt30 cinematb">
                    <span class="titb"><a href="" id="focus-cinema"></a></span>
                    <span class="cor999 pl10" id="focus-cinema-address"></span>
                </div>
                <div class="schedule-list" id="focus-schedule-list">

                </div>
            </div>
        <div class="comment-hot-detail pt30 fn-clear">
            <div class="comment">
                <div class="title pb10" id="scrollComment">
                    <span class="titb">用户评论</span>
                    <span>共${commentList?size}条评论</span>
                </div>
                <div class="message-send">
                    <div class="box-send">
                        <div class="do-box-score">
                            <div class="do-score" data-average="0" data-id="doscore"></div>
                            <span class="result">请评分</span>
                        </div>
                        <div id="recomment" class="do-message" contenteditable="true"></div>
                    </div>
                    <p class="fn-clear pt30">
                        <a href="javascript:void(0)" class="btn fn-right" id="submit-comment">发表评论</a>
                    </p>
                    <span class="photo">
                    	<#if ylrc_account??>
                    	<img id="userheader" src="/photo/view?filename=${ylrc_account.headPic}" width="64" height="64" />
                    	<#else>
                    	<img id="userheader" src="/home/images/ico_tb_lg.png" width="64" height="64" />
                    	</#if>
                    </span>
                </div>
                <div class="message-list pt30">
                    <ul id="message-container">
                    	<#list commentList as comment>
                    	<li>
                            <div class="username-score fn-clear">
                                <span class="fn-left">${comment.account.nickname!comment.account.mobile?replace(comment.account.mobile?substring(3,7),"****")}</span>
                                <p class="fn-left ypscore" data-average="${comment.rate}" data-id="${comment.id}">
								</p>
                            </div>
                            <p class="message-con">${comment.content}</p>
                            <p class="time">
                                    <span class="fn-right">${comment.createTime}</span>
                            </p>
                            <span class="photo">
                                    <img src="/photo/view?filename=${comment.account.headPic}" width="64" height="64">
                            </span>
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
            <div class="film-hot">
                <div class="title pb10">
                    <span class="titb">正在热映</span>
                </div>
                <ul>
                    <#list topMovieList as topMovie>
                    <li>
                        <h3 class="overhide">
                            <a href="detail?id=${topMovie.id}" >
                            	<#if topMovie.name?length gt 25>
                        		${topMovie.name?substring(0,25)}...
                        		<#else>
                        		${topMovie.name}
                        		</#if>
                            </a>
                        </h3>
                        <div class="score" data-average="${topMovie.rate!"0"}" data-id="${topMovie.id}"></div>
                        <p class="info">
                            ${topMovie.abs!"暂无"}
                        </p>
                        <span class="img">
                        	<a href="detail?id=${topMovie.id}" >
                        		<img src="/photo/view?filename=${topMovie.mainPic}" width="72" height="100" />
                        	</a>
                        </span>
                    </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="verlayPics" id="verlayPics">
    <div id="slider" class="verlay-film-pics">
        <ul class="slides">
                <#list movie.pictureList as pic>
                <li>
                    <img src="/photo/view?filename=${pic}" width="600" height="400" />
                </li>
                </#list>
        </ul>
    </div>
    <div id="carousel" class="verlay-film-thumb">
        <ul class="slides">
                <#list movie.pictureList as pic>
                <li data-i="0">
                    <img src="/photo/view?filename=${pic}" width="120" height="80" />
                </li>
                </#list>
        </ul>
    </div>
</div>
<div class="verlayVideo" id="verlayVideo">
    <div class="box-video">
        <ul class="slides">
           <#if movie.video?? && movie.video?length gt 0> 
               <li data-thumb="/photo/view?filename=${movie.mainPic}" data-video="/download/download_video?filename=${movie.video}">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">
                        <param name="movie" value="/home/images/flvplayer.swf" />
                        <param name="quality" value="high" />
                        <param name="allowFullScreen" value="true" />
                        <param name="IsAutoPlay" value="1" />
                        <param name="wmode" value="transparent" />
                        <param name="FlashVars" value="vcastr_file=/download/download_video?filename=${movie.video}" />
                        <embed src="/home/images/flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file=/download/download_video?filename=${movie.video}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>
                    </object>
                </li>
           </#if>
        </ul>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
$(document).ready(function(){
	 $("#submit-comment").click(function(){
	 	var content = $("#recomment").html();
	 	var score = $(this).parent().parent().find(".result>em").text();
        if (!score) {
            alert("请评分!");
            return;
        }
        if(content == ''){
		 	alert("请填写评价内容!");
		 	return;
        }
        var data = {rate:score,content:content,'movie.id':${movie.id}};
        ajaxRequest('/home/comment/comment_movie','post',data,function(rst){
        	alert('评价成功！');
        	window.location.reload();
        });
	 });
	 
    
    var dataCon;
    if ($(".intro .con").height() > 52) {
        dataCon = $(".intro .con").text();
        $(".intro .con").text($(".intro .con").attr("data-t"));
        $(".film-info-detail .flag").show();
    }
    $(".film-info-detail .flag").toggle(function () {
        $(".intro .con").text(dataCon)
        $(this).css("bottom", "30px").text("收起");
        $(".intro").removeClass("ovhide").addClass("tag");
    }, function () {
        $(".intro .con").text($(".intro .con").attr("data-t"));
        $(this).css("bottom", "40px").text("展开")
        $(".intro").removeClass("tag").addClass("ovhide");
    });
    $(".message-list .jpage").jPages({
        containerID: "message-container",
        perPage: 10,
        delay: 30,
        fallback: 200,
        minHeight: false,
        previous: "上一页",
        next: "下一页"
    });
    $(".do-flim-comment").click(function () {
        $("html, body").animate({
            scrollTop: $($(this).attr("data-rel")).offset().top + "px"
        }, {
            duration: 500,
            easing: "swing"
        });
        return false;
    });
    $("#recomment").focus(function () {
        if ("${ylrc_account!"false"}".toLowerCase() == "false") {
            $(".boxLogin").overlay({ api: true }).load();
            return false;
        }
    });
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
    $(".schedule-filte .cinema li").live('click', function () {
        $(this).siblings().removeClass("act").end().addClass("act");
        var cid = $(this).attr('data-cid')
        var name = $(this).attr('data-name')
        var address = $(this).attr('data-address')
        $(".film-date-list li").each(function (i,e) {
            if($(e).attr("data-cid") != cid) {
                $(e).addClass("fn-hide");
            }else{
            	$(e).removeClass("fn-hide");
            }
        });
        $("#focus-cinema").text(name);
        $("#focus-cinema").attr('href','/home/cinema/detail?id='+cid);
        $("#focus-cinema-address").text(address);
    });
    $(".film-date-list li").live('click', function () {
        $(this).siblings().removeClass("act").end().addClass("act");
        var mid = ${movie.id};
        var cid = $(".schedule-filte .cinema li[class='act']").attr("data-cid");
        var showDate = $(this).children("a").text();
    	$.get("get_show_session",{mid:mid,cid:cid,showDate:showDate},function(data,status){
	        $("#focus-schedule-list").empty();
	        $("#focus-schedule-list").append(data);
	    });
    });
    $(".schedule-filte .cinema li:first").trigger("click");
    $(".film-date-list li:first").trigger("click");
});
var test;
var $slider;
$(".filmPics").overlay({
    closeOnClick: false,
    top: 'center',
    mask: {
        color: '#333',
        closeSpeed: 700,
        opacity: 0.8
    },
    onBeforeLoad: function () {
        $('body').on('mousewheel', function (e) {
            scrollFunc(e);
        });
    },
    onLoad: function (e) {
        $('#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            directionNav:false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 120,
            startAt: $(e.target).attr("data-index"),
            asNavFor: '#slider'
        });
        $('#slider').flexslider({
            animation: "fade",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            startAt: $(e.target).attr("data-index"),
            sync: "#carousel",
            after: function () {
                $(".verlay-film-thumb .flex-direction-nav").show();
                var idx = parseInt($("#carousel .slides li.flex-active-slide").attr("data-i"));
                if (((idx + 1) % 5) == 0) {
                    $("#carousel").flexslider("next");
                }
            }
        });
        $(".filmPics").each(function (i) {
            $(this).click(function () {
                $('#carousel').flexslider(i);
                $('#slider').flexslider(i);
            });
        });
    },
    onClose: function () {
        $('body').off('mousewheel');
    }
});
$(".video-play").overlay({
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
        $('.box-video').flexslider({
            animation: "fade",
            slideshow: false,
            controlNav: "thumbnails",
            after: function (e) {
                var video = $(".box-video .slides li").eq(e.currentSlide);
                var html = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
                html += '<param name="movie" value="/home/images/flvplayer.swf" />';
                html += '<param name="quality" value="high" />';
                html += '<param name="allowFullScreen" value="true" />';
                html += '<param name="wmode" value="transparent"/>';
                html += '<param name="FlashVars" value="vcastr_file=' + video.attr("data-video") + '&&IsAutoPlay=1" />';
                html += '<embed src="/home/images/flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file=' + video.attr("data-video") + '&&IsAutoPlay=1" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
                html += '</object>';
                video.siblings().empty();
                video.html(html);
            }
        });
        $("#verlayVideo .flex-control-thumbs li").each(function () {
            $(this).css("backgroundImage", "url('" + $(this).find("img").attr("src") + "')");
            $(this).find("img").attr("src", "/home/images/ico_tb_5.png");
        });

    },
    onClose: function () {
        $('body').off('mousewheel');
    }
});
window._bd_share_config = {
        share: [{
            "tag": "share_2",
            "bdSize": 32
        }]
    }
with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
</body>
</html>