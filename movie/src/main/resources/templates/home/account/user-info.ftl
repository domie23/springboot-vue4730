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
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-user-center">
    <div class="container fn-clear">
        <div class="menu-usercenter">
    	<#include "../common/account-menu.ftl"/>
		</div>
        <div class="box-con userinfo-usercenter">
            <div class="title tag fn-clear">
                <span class="act"><a href="user-info">个人资料</a></span>
                <span><a href="update-pwd">修改密码</a></span>
                <span><a href="update-head-pic">修改头像</a></span>
            </div>
            <div class="box-info">
                <p class="fn-clear">
                    <span>账号：</span>
                    <span class="pr mobile">${ylrc_account.mobile}</span>
                </p>
                <p class="fn-clear">
                    <span class="pt5">昵称：</span>
                    <span class="nick-name pr ipt"><input type="text" name="nickName" value="${ylrc_account.nickname!""}" /></span>
                </p>
                <p class="fn-clear">
                    <span>性别：</span>
                    <span class="sex pr fn-clear">
                        <label><input type="radio" name="sex" value="1" <#if ylrc_account.sex == 1>checked</#if> /><span>男</span></label>
                        <label><input type="radio" name="sex" value="2" <#if ylrc_account.sex == 2>checked</#if> /><span>女</span></label>
                    </span>
                </p>
                <p class="fn-clear">
                    <span class="btn prb">保存</span>
                </p>
            </div>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">
$(function () {
    var nickName = '${ylrc_account.nickname!""}';
    var mobile = '${ylrc_account.mobile!""}';
    var Sex = '${ylrc_account.sex}';
    var submit = false;
    $(".userinfo-usercenter .btn").click(function () {
        if (submit) return;
        submit = true;
        var cnickName = $.trim($(".userinfo-usercenter .box-info .nick-name input").val());
        var csex = $("input[name='sex']:checked").val();
        if (!cnickName) {
            alert("昵称不能为空！");
            return;
        }
        if ((cnickName == nickName) && (csex == Sex)) {
            alert("你没有做任何修改!");
            return;
        }
        $.ajax({
            url: 'update_info',
            data: {
                nickname: cnickName,
                sex: csex
                },
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    alert("提交成功！");
                    window.location.reload();
                } else {
                    submit = false;
                    alert("提交失败，请稍后再试！");
                    
                }
            },
            error: function () {
                submit = false;
                alert("网络错误,稍后再试！");
            }
        });
    });
});
$(".menu-usercenter li").each(function () {
    if ($(this).attr("data-i") == "userinfo") {
        $(this).siblings().find(".tag").hide().end().end().addClass("select").find(".tag").show();
    }
});  
</script>
</body>
</html>