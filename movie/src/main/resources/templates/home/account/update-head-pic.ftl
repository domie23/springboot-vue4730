<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>用户中心-修改头像|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
<link href="/home/css/imgareaselect-default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .imgareaselect-main {
        width: 750px;
        height: 440px;
        margin: 0 auto;
    }
    .imgareaselect-main .top {
        width: 730px;
        height: 30px;
        margin: 5px 0 0 10px;
    }
    .imgareaselect-main .top .msg {
        width: 535px;
        height: 25px;
        color: #4DD0C8;
        float: left;
        padding-top: 5px;
        overflow: hidden;
        text-align: center;
    }
    .imgareaselect-main .left {
        width: 500px;
        height: 375px;
        margin: 10px 0 0 10px;
        float: left;
        border: 1px solid #4DD0C8;
    }

    .imgareaselect-main .right {
        width: 218px;
        height: 375px;
        margin: 10px 0 0 10px;
        float: left;
        border: 1px solid #4DD0C8;
    }
    .imgareaselect-main .left .mainimg {
        text-align: center;
        max-width: 452px;
        height: 100%;
        margin: 0 auto;
        overflow: hidden;
    }
    .imgareaselect-main .left .mainimg .imgmid {
        display: inline-block;
        height: 100%;
        width: 1px;
        vertical-align: middle;
    }
    .imgareaselect-main .left .mainimg img {
        max-width: 450px;
        max-height: 337px;
        width: expression(width>450?"450px":width+"px");
        height: expression(height>337?"337px":height+"px");
        vertical-align: middle;
    }
    .imgareaselect-main .right .preview100 {
        margin-top:30px;       
        width: 64px;
        height: 64px;
        margin-left:auto;
        margin-right:auto;
        border: 1px solid #4DD0C8;
        overflow: hidden;
    }
    .imgareaselect-main .right .preview100note {
        height: 20px;
        line-height: 20px;
        color: #4DD0C8;
        text-align: center;
    }
    .imgareaselect-main .right .preview200 {
        width:160px;
        height:160px;
    margin-top:30px;       
            margin-left:auto;
        margin-right:auto;
        border: 1px solid #4DD0C8;
        overflow: hidden;
    }
    .imgareaselect-main .right .preview200note {
        height: 20px;
        line-height: 20px;
        color: #4DD0C8;
        text-align: center;
    }
    .imgareaselect-main .right .preview100 img {
        width: 64px;
        height:64px;
    }
    .imgareaselect-main .right .preview200 img {
        width: 160px;
        height: 160px;
    }
    .ifile {
        position: absolute;
        height: 25px;
        opacity: 0;
        filter: alpha(opacity = 0);
        -moz-opacity: 0;
        width: 360px;
        margin-top: 4px;
        display: none;
    }
    .btn_save {
        display: block;
        width: 95px;
        height: 30px;
        float: right;
        color:#fff;
        background-color:#4DD0C8;
        border:0;
        cursor: pointer;
    }
    .btn_fh {
        float: left;
        width: 95px;
        height: 30px;
        color:#fff;
        background-color:#4DD0C8;
        border:0;
        cursor: pointer;
    }
    .btn_save:hover {
        border: 0;
        width: 95px;
        height: 30px;
        float: right;
        cursor: pointer;
    }
    .btn_fh:hover {
        border: 0;
        width: 95px;
        height: 30px;
        float: left;
        cursor: pointer;
    }
    .buttton {
        background-color:#4DD0C8; 
        height:30px; 
        line-height:30px;
        width:80px;
        color:white;
        text-align:center;
        float:left;
        cursor:pointer;
        border:none
    }
    #oldphoto {
        position:absolute;
        width:128px;
        height:128px;
        top:50px;
        left:80px;
    }
    .box-photo {
        position:relative;
    }
    .imgareaselect-border1 {
		background: url(../images/border-v.gif) repeat-y left top;
	}
</style>
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
                <span><a href="user-info">个人资料</a></span>
                <span><a href="update-pwd">修改密码</a></span>
                <span class="act"><a href="update-head-pic">修改头像</a></span>
            </div>
            <div class="box-photo">
               <div style="margin-left: 20px; margin-right: 20px;margin-top:20px; overflow: hidden; text-align: center">
                    <div id="div1" style="width:86px; margin: 0px auto;display:block">
                        <div style="height:40px;clear:both"></div>
                        <div style="cursor:pointer;">
                            <form id="uploadForm"  method="post" enctype="multipart/form-data" action="/account/uploadphoto.html" style="position:relative;width:65px;height:30px" target="hidden_frame">
                                <div id="btnUpload" class="buttton" style="border-radius:3px!important; cursor:pointer">上传照片</div>
                                <input type="file" id="fileInput" name="fileInput" style="float:left;width:65px;height:30px;filter:alpha(opacity:0);opacity: 0;position:absolute;top: 0px; left:0px;cursor:pointer" />
                                <iframe name='hidden_frame' id="hidden_frame" style="display: none"></iframe>
                            </form>
                        </div>
                        <div style="height:40px;clear:both"></div>
                    </div>
                    <div id="div2" style="display:none;text-align:center">
                        <div class="imgareaselect-main">
                            <div class="top">
                                <input type="button" onclick="window.location.href = 'UploadImg.aspx';" class="btn_fh" value="返回" />
                                <div class="msg">友情提示:单击鼠标左键拖拽选择下方图像区域.</div>
                                <input type="button" onclick="ImgSave();" class="btn_save" value="保存" />
                            </div>
                            <div class="left">
                                <div class="mainimg"></div>
                            </div>
                            <div class="right">
                                <div style="text-align:center">
                                    <div class="preview100"></div>
                                    <div class="preview100note">64*64预览图</div>
                                </div>
                                <div style="text-align: center">
                                    <div class="preview200"></div>
                                    <div class="preview200note">160*160预览图</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="oldphoto"><img src="/photo/view?filename=${ylrc_account.headPic}" alt="" width="100" height="100" /></div>
            </div>
        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/>
<script type="text/javascript" src="/home/js/jquery.imgareaselect.pack.js"></script> 
<#include "../common/footer.ftl"/> 
<script type="text/javascript">
$(function () {
       $("#fileInput").change(function () {
           //开始上传图片，将上传完的图片传给callback方法
           uploadPhoto(document.getElementById('fileInput').files[0],function(data){
           		filename = data.data;
           		callback('0', '/photo/view?filename='+data.data);
           });
       });
       $(".btn_fh").click(function () {
           window.location.href = 'user-center';
       });
       setFrameHeight();
       $("#fileInput").click(function () {
           $("#oldphoto").hide();
       });

       
   });
   function callback(ResultCode, ErrMsg) {
       if (ResultCode === "0") {
           path = ErrMsg;
           ShowImg();
           $("#div1").css("display", "none");
           $("#div2").css("display", "block");
           setFrameHeight();
       }
       else
           alert(ErrMsg);
   }
   function setFrameHeight() {
       try {
           var clientheight = document.body.clientHeight + 20;
           var naviFrame = parent.document.getElementById("naviFrame");
           naviFrame.style.height = clientheight + "px";
       }
       catch (ex) { }
   }
   function ShowImg() {
       $(".imgareaselect-outer").remove();
       $(".imgareaselect-handle").parent().remove();
       $(".btn_save").show();
       $(".preview100").html("<img alt=\"预览缩略图.\" title=\"预览缩略图.\" />");
       $(".preview200").html("<img alt=\"预览缩略图.\" title=\"预览缩略图.\" />");
       $(".mainimg").html("<img src='" + path + "' alt=\"单击鼠标左键拖拽选择图像区域.\" title=\"单击鼠标左键拖拽选择图像区域.\" /><div class=\"imgmid\"></div>");
       $(".mainimg img").imgAreaSelect({ maxHeight: 300, maxWidth: 300, minHeight: 64, minWidth: 64, aspectRatio: '1:1', fadeSpeed: 200, x1: 102, y1: 102, x2: 198, y2: 198, handles: true, onSelectChange: preview });
       $(".preview100 img").attr("src", $(".mainimg img").attr("src"));
       $(".preview200 img").attr("src", $(".mainimg img").attr("src"));
   }
   var getInfo;
   function preview(img, selection) {
       if (!selection.width || !selection.height)
           return;
       $(".right div").show();
       getInfo = selection;
       var scale64X = 64 / selection.width;
       var scale64Y = 64 / selection.height;
       var scale160X = 160 / selection.width;
       var scale160Y = 160 / selection.height;
       $(".preview100 img").css({
           width: Math.round(scale64X * img.width),
           height: Math.round(scale64Y * img.height),
           marginLeft: -Math.round(scale64X * selection.x1),
           marginTop: -Math.round(scale64Y * selection.y1)
       }).attr("src", $(".mainimg img").attr("src"));
       $(".preview200 img").css({
           width: Math.round(scale160X  * img.width),
           height: Math.round(scale160Y  * img.height),
           marginLeft: -Math.round(scale160X * selection.x1),
           marginTop: -Math.round(scale160Y * selection.y1)
       }).attr("src", $(".mainimg img").attr("src"));
   }
   var path,filename;
   function ImgSave() {
       if (getInfo != undefined) {
           var image = new Image();
           image.src = $(".mainimg img").attr('src');
           var widthRate = image.width / $(".mainimg img").width();
           var heightRate = image.width / $(".mainimg img").height();
           var rate = (widthRate + heightRate) / 2;
           $.ajax({
               url: '/photo/cut_photo',
               type: "POST",
               data: {
                   filename: filename,
                   x: parseInt(getInfo.x1 * rate),
                   y: parseInt(getInfo.y1 * rate),
                   width: parseInt(getInfo.width * rate),
                   height: parseInt(getInfo.height * rate)
               },
               beforeSend: function () {
                   $(".mainimg").html("图片制作中,请耐心等待...")
               },
               success: function (data) {
                   if (data.code === 0) {
                       ajaxRequest('update_head_pic','post',{headPic:data.data},function(rst){
                       		window.location.reload();
                       });
                   }
                   else
                       alert(data.msg);
               }
           });
       } else {
           alert("请浏览图片并选择你要裁剪的区域!");
       }
   }
</script>
</body>
</html>