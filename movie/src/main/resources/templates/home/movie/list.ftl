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
<div class="wrapper-filmlist fn-clear">
    <div class="box-filmlist">
        <div class="title">
            <span><a href="list" <#if type == 0>class="pr act"</#if>>正在热映</a>/</span>
            <span><a href="list?type=1" <#if type == 1>class="pr act"</#if>>即将上映</a></span>
            <em>共 ${movieList?size} <#if type == 0>部热映电影<#else>部电影即将上映</#if></em>
        </div>
        <ul id="filmShowNow">
            <#list movieList as movie>
            <li>
                <h3><a href="detail?id=${movie.id}" target="_blank">${movie.name}</a><span>${movie.rate!0}分</span></h3>
                <p class="tip">${movie.abs!"暂无介绍"}</p>
                <p class="tag fn-clear"><span>${movie.language.getName()}</span><span><#if movie.typeList??><#list movie.typeList as type>${type.getName()}/</#list></#if> ${movie.area.getName()}</span><span>${movie.time} 分钟</span></p>
                <p><span>导演：</span><span>${movie.directedBy}</span></p>
                <p class="actor"><span>主演：</span><span>${movie.actor}</span></p>
                <span class="pic"><a href="detail?id=${movie.id}" target="_blank"><img src="/photo/view?filename=${movie.mainPic}" width="145" height="200" alt="${movie.name}" /></a></span>
                <#if type == 0>
                <div class="show-btn">
                    <p class="ctip" data-id="${movie.id}">0家影院上映0场</p>
                    <p><a href="detail?id=${movie.id}" class="btn" >选座购票</a></p>
                </div>
                <#else>
                <div class="show-time">
                    <p class="clock">上映时间</p>
                    <p class="blue fn-acenter">${movie.showTime}</p>
                </div>
                </#if>
            </li>
            </#list>
            
        </ul>
            <div class="fn-acenter">
                <div class="jpage"></div>
            </div>
        
    </div>
    <div class="active-filmtop-filmlist">
        <div class="active">
            <ul>
                    <#list topNewsList as topNews>
                    <li>
                        <p><a href="/home/news/detail?id=${topNews.id}" target="_blank"><img src="/photo/view?filename=${topNews.picture}" width="270" height="156" alt="${topNews.title}" /></a></p>
                        <p class="overhide"><a href="/home/news/detail?id=${topNews.id}" target="_blank">${topNews.title}</a></p>
                    </li>
                    </#list>
            </ul>
        </div>
        <div class="film-top">
            <div class="title"><span class="titb">一周票房排行</span></div>
            <ul>
                <#list topMoneyMovieList as moneyMovie>
                <li class="fn-clear">
                	<a href="/home/movie/detail?id=${moneyMovie.id}" title="${moneyMovie.name}" target="_blank">
                	<#if moneyMovie.name?length gt 20>
            		${moneyMovie.name?substring(0,20)}...
            		<#else>
            		${moneyMovie.name}
            		</#if>
                	</a>
                	<span>
                	${moneyMovie.rate!"0"}
                	</span>
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
	 $(".box-filmlist .jpage").jPages({
        containerID: "filmShowNow",
        perPage: 10,
        delay: 30,
        fallback: 200,
        minHeight: false,
        previous: "上一页",
        next: "下一页"
    });
    $(".ctip").each(function(i,e){
    	ajaxRequest('get_show_stats','post',{mid:$(e).attr('data-id')},function(rst){
	    	$(e).text(rst.data[0]+'家影院上映'+rst.data[1]+'场');
	    }); 
    });
      	
});
</script>
</body>
</html>