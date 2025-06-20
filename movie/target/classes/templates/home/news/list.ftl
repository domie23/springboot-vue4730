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
<div class="wrap-newslist fn-clear pt30">
    <div class="box-news-list">
        <div class="title fn-clear">
            <span class="fn-left titb">资讯</span>
            <ul class="fn-left">
                <#list newsCategoryList as newsCategory>
                <li data-i="dianyingzixun" <#if newsCategory.id == cid>class="act"</#if>><a href="list?cid=${newsCategory.id}">${newsCategory.name}</a>/</li>
                </#list>
            </ul>
        </div>
        <ul class="news-list" id="newslist">
                <#list newsList as news>
                <li class="fn-clear">
                        <img class="pic" src="/photo/view?filename=${news.picture}" width="120" height="80" />
                    <div class="con">
                        <h2><a href="detail?id=${news.id}" target="_blank">${news.title}</a></h2>
                        <p>${news.abs!""}</p>
                    </div>
                </li>
                </#list>
        </ul>
            <div class="fn-acenter box-jpage">
                    <div class="jpage"></div>
            </div> 
    </div>
    <div class="film-show">
        <div class="title"><span class="titb">正在热映</span></div>
        <ul>
                <#list topMovieList as topMovie>
                <li>
                    <h3>
                    	<a href="/movie/detail?id=${topMovie.id}" target="_blank">
                    		<#if topMovie.name?length gt 10>
		            		${topMovie.name?substring(0,10)}...
		            		<#else>
		            		${topMovie.name}
		            		</#if>
                    	</a>
                    </h3>
                    <div class="nscore" data-average="${topMovie.rate!"0"}" data-id="ac"></div>
                    <p>${topMovie.abs!"暂无介绍"}</p>
                    <span class="photo"><a href="/movie/detail?id=${topMovie.id}" target="_blank"><img src="/photo/view?filename=${topMovie.mainPic}" width="72" height="100" alt="" /></a></span>
                    <span class="tscore yellow">${topMovie.rate!"0"}</span>
                </li>
                </#list>
                
        </ul>
    </div>
</div>
    
    
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
$(document).ready(function(){
	 $(".box-news-list .jpage").jPages({
        containerID: "newslist",
        perPage: 10,
        delay: 30,
        fallback: 200,
        minHeight: false,
        previous: "上一页",
        next: "下一页"
    });
    $('.nscore').jRating({
        rateMax: 10,
        isDisabled: true,
        bigStarsPath: '/home/images/ico_tb_stars.png'
    });
});
</script>
</body>
</html>