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
         <h1>意见反馈</h1>
        <p class="des">
            如果你在使用过程中遇到问题，或者你希望给我们提出一些建议，欢迎你在这里提交给我们，你的支持是我们前进的动力！
        </p>
        <div class="con feedback-helpcenter">
            <p class="fn-clear">
                <span class="fn-left">反馈类别：</span>
                <select id="Title" name="Title" class="title fn-left" style="width:100%">
                    <option value="0">请选择</option>
                    <option value="网站功能">网站功能</option>
                    <option value="网站服务">网站服务</option>
                    <option value="手机购票问题">手机购票问题</option>
                    <option value="其他建议">其他建议</option>
                </select>
            </p>
            <p class="fn-clear">
                <span class="fn-left">反馈内容：</span>
                <textarea id="Note" name="Note" class="content fn-left" cols="93" rows="7"></textarea>
            </p>
            <p class="fn-clear"><a id="btnConfirm" class="btn fn-left">提交</a></p>
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
            if ($(this).attr("data-i") == "feedback") {
                $(this).parent().addClass("act");
            }
        });
    });
</script>
<script type="text/javascript">
     var submit = false;
     $(function () {
         $("#btnConfirm").click(function () {
             if ($("#Title").val() == 0) {
                 alert("请选择类别");
                 return false;
             }
             if (!$.trim($("#Note").val())) {
                 alert("请填写内容");
                 return false;
             }
             var moduleForm = $("#moduleForm");
             $.ajax({
                 url: '/help/addopinion',
                 data: $(moduleForm).serializeArray(),
                 type: 'post',
                 dataType: 'json',
                 success: function (data) {
                     if (data.ResultCode == "0") {
                         alert("意见反馈成功,我们将尽快处理您的意见反馈");
                         window.location.reload();
                     } else {
                         alert(data.ErrMsg);
                     }
                 },
                 error: function () {
                     submit = false;
                     alert("网络错误,稍后再试！");
                 }
             });
         });
     })
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