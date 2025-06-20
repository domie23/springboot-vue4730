<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>帮助中心|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-helpcenter fn-clear">
    <div class="menu-helpcenter">
    <#include "../common/help-menu.ftl"/>
</div>

</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".menu-helpcenter li a").each(function () {
            if ($(this).attr("data-i") == "contactus") {
                $(this).parent().addClass("act");
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        var url = window.location.href;
        var strs = url.split("#");
        $(".wrapper-helpcenter .help-aq li a:[name=" + strs[1] + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        $(".info-help .help-nav li a").click(function () {
            var name = $(this).attr("href").split("#")[1];
            $(".wrapper-helpcenter .help-aq li a:[name=" + name + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        });
        $(".wrapper-helpcenter .help-aq li").click(function () {
            if (!$(this).hasClass("act")) {
                $(this).siblings().removeClass("act pb10").end().addClass("act pb10");
            }
        });
    });
</script>
</body>
</html>