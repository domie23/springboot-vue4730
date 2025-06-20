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
    <div class="box-con">
         <h1>合作伙伴</h1>
        <div class="con">
            <p>排名不分先后</p>
            <ul class="logo-partner">
                <li><img src="/home/images/hzfb_yd.jpg" width="200" height="67" alt="移动" /></li>
                <li><img src="/home/images/hzfb_dx.jpg" width="200" height="67" alt="电信" /></li>
                <li><img src="/home/images/hzfb_lt.jpg" width="200" height="67" alt="联通" /></li>
                <li><img src="/home/images/hzfb_ms.jpg" width="200" height="67" alt="民生银行" /></li>
                <li><img src="/home/images/hzfb_gs.jpg" width="200" height="67" alt="南昌银行" /></li>
                <li><img src="/home/images/hzfb_jh.jpg" width="200" height="67" alt="建设银行" /></li>
                <li><img src="/home/images/hzfb_nh.jpg" width="200" height="67" alt="中国农业银行" /></li>
                <li><img src="/home/images/hzfb_yl.jpg" width="200" height="67" alt="中国银联" /></li>
                <li><img src="/home/images/hzfb_zs.jpg" width="200" height="67" alt="招商银行" /></li>
                <li><img src="/home/images/hzfb_zx.jpg" width="200" height="67" alt="中信银行" /></li>
            </ul>

        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".menu-helpcenter li a").each(function () {
            if ($(this).attr("data-i") == "cooperativepartner") {
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