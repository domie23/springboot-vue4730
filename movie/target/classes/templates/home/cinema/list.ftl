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
<div class="wrapper-cinemalist fn-clear">
    
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
    <div style="overflow:hidden">
        <div style="padding-bottom:10px;padding-top:40px;border-bottom:1px solid #f5f5f5;overflow:hidden">
            <span class="fn-left" style="font-size: 24px;"><#if ylrc_area??>${ylrc_area.name}电影院<#else>全部电影院</#if></span>
            <span class="fn-left cor999" style="margin-left: 20px;padding-top:5px;">共 ${cinemaList?size} 家影院，上映场次 <font id="show-total-session" color="red">0</font> 场</span>
        </div>
        <div class="message-list">
            <ul id="message-container">
                    <#list cinemaList as cinema>
                    <li class="fn-clear"  style="border-bottom:1px solid #f5f5f5;padding-bottom:20px;padding-top:20px">
                        <div class="fn-left" style="border:1px solid #eee;">
                            <a href="/home/cinema/detail?id=${cinema.id}" target="_blank"><img src="/photo/view?filename=${cinema.picture}" alt="${cinema.name}" style="height:88px;width:88px"/></a>
                        </div>
                        <div class="fn-right" style="line-height:88px;"><a href="/home/cinema/detail?id=${cinema.id}" class="btn" target="_blank">选座购票</a></div>
                        <div  style="padding-left:25px;padding-right:20px;overflow:hidden">
                            <div style="font-size:20px;"><a href="/home/cinema/detail?id=${cinema.id}" target="_blank">${cinema.name}</a></div>
                            <div style="margin-top:10px" class="cor999">${cinema.address}</div>
                            <div style="margin-top:12px;font-size:12px" class="cor999 show-stats" data-id="${cinema.id}">暂无场次-7部影片上映53场</div>
                        </div>
                    </li>
                    </#list>
                    
            </ul>
               <div class="fn-acenter box-jpage">
                    <div class="jpage"></div>
                </div> 
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
	 $(".message-list .jpage").jPages({
        containerID: "message-container",
        perPage: 10,
        delay: 30,
        fallback: 200,
        minHeight: false,
        previous: "上一页",
        next: "下一页"
    });
    var totalSession = 0;
    $(".show-stats").each(function(i,e){
    	ajaxRequest('get_show_stats','post',{cid:$(e).attr('data-id')},function(rst){
	    	if(rst.data[0] == 0){
		    	$(e).text('暂无场次');
	    	}else{
		    	$(e).text(rst.data[0]+' 部影片上映 '+rst.data[1]+' 场');
	    	}
	    	totalSession += rst.data[1];
	    	$("#show-total-session").text(totalSession); 	
	    });
    });
});
</script>
</body>
</html>