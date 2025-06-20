<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-修改个人资料|猫眼电影票网_电影在线选座购票平台</title>
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
        <div class="box-con userinfo-usercenter index-usercenter">
            <div class="title tag fn-clear">
                <span <#if type == 0>class="act"</#if>><a href="user-comment">电影评价</a></span>
                <span <#if type == 1>class="act"</#if>><a href="user-comment?type=1">影院评价</a></span>
            </div>
            <div class="box-con comment-usercenter order-recently">
	            <div class="fn-clear th">
                    <span class="p1" style="width:200px;"><#if type==0>电影<#else>影院</#if></span>
                    <span class="p2" style="width:100px;">评分</span>
                    <span class="p3">评价内容</span>
                    <span class="p3" style="width:150px;">评价时间</span>
                </div>
	            <ul id="commentlist" class="my-order-usercenter">
	            	<#if type == 0>
	            	<#list movieCommentList as movieComment>
	            	<li style="padding:0px;" class="fn-clear" title="${movieComment.movie.name}">
                        <div class="film-info wd1" style="width:200px;">
                            <h3>
	                            <a href="/home/movie/detail?id=${movieComment.movie.id}" target="_blank">
			            		${movieComment.movie.name}
	                            </a>
                            </h3>
                            <span class="pic">
	                            <a href="/home/movie/detail?id=${movieComment.movie.id}" target="_blank">
	                            	<img src="/photo/view?filename=${movieComment.movie.mainPic}" width="72" height="100" alt="${movieComment.movie.name}">
	                            </a>
                            </span>
                        </div>
                        <div class="wd2 pt" style="width:100px;">
                        	<p class="score" data-average="${movieComment.rate}" title="${movieComment.rate}分" data-id="${movieComment.id}"></p>
                        </div>
                        <div class="wd2 pt" style="width:320px;">${movieComment.content}</div>
                        <div class="wd2 pt" style="width:150px;">${movieComment.createTime}</div>
                    </li>
                    </#list>
                    </#if>
	            	<#if type == 1>
	            	<#list cinemaCommentList as cinemaComment>
	            	<li style="padding:0px;" class="fn-clear" title="${cinemaComment.cinema.name}">
                        <div class="film-info wd1" style="width:200px;">
                            <h3>
	                            <a href="/home/cinema/detail?id=${cinemaComment.cinema.id}" target="_blank">
			            		${cinemaComment.cinema.name}
	                            </a>
                            </h3>
                            <span class="pic">
	                            <a href="/home/cinema/detail?id=${cinemaComment.cinema.id}" target="_blank">
	                            	<img src="/photo/view?filename=${cinemaComment.cinema.picture}" width="72" height="100" alt="${cinemaComment.cinema.name}">
	                            </a>
                            </span>
                        </div>
                        <div class="wd2 pt" style="width:100px;">
                        	<p class="score" data-average="${cinemaComment.rate}" title="${cinemaComment.rate}分" data-id="${cinemaComment.id}"></p>
                        </div>
                        <div class="wd2 pt" style="width:320px;">${cinemaComment.content}</div>
                        <div class="wd2 pt" style="width:150px;">${cinemaComment.createTime}</div>
                    </li>
                    </#list>
                    </#if>
	            </ul>
	            <#if type == 0>
	            <#if movieCommentList?? && movieCommentList?size gt 0>
	            <#else>
	            <p class="error">暂无评论信息</p>
	            </#if>
	            </#if>
	            <#if type == 1>
	            <#if cinemaCommentList?? && cinemaCommentList?size gt 0>
	            <#else>
	            <p class="error">暂无评论信息</p>
	            </#if>
	            </#if>
		        <div class="fn-acenter">
	                <div class="jpage"></div>
	            </div>
        	</div>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/>
<script src="/home/js/jquery.jPages.min.js" type="text/javascript"></script> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">
$(function () {
    $(".comment-usercenter .jpage").jPages({
	    containerID: "commentlist",
	    perPage: 4,
	    delay: 30,
	    fallback: 200,
	    minHeight: false,
	    previous: "上一页",
	    next: "下一页"
	});
	$('.score').jRating({
        rateMax: 10,
        isDisabled: true,
        length: 5,
        type:'small',
        smallStarsPath: '/home/images/ico_tb_stars_small.png'
    });
});
$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "usercomment") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});  
</script>
</body>
</html>