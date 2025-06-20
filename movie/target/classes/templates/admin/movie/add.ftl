<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|电影管理-添加电影</title>
<#include "../common/header.ftl"/>
<!--时间选择插件-->
<link rel="stylesheet" href="/admin/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<!--日期选择插件-->
<link rel="stylesheet" href="/admin/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo.png" title="猫眼" alt="猫眼" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>添加电影</h4></div>
              <div class="card-body">
                <form action="add" id="user-add-form" method="post" class="row">
                  <div class="form-group col-md-12">
                    <label>剧照上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic" id="show-uploaded-pic">
                        <input type="hidden" name="picture" id="picture">
                        <input type="file" id="select-picture-file" style="display:none;" onchange="uploadPicture()">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="form-group col-md-12">
                    <label>预告视频</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2" style="display:none;">
                          <figure>
                            <video src="" id="preview-video"  width="160" height="160" controls="controls">
							Your browser does not support the video tag.
							</video>
                          </figure>
                        </li>
                        <input type="hidden" name="video" id="video">
                        <input type="file" id="select-video-file" style="display:none;" onchange="uploadVideo()">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-video-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入电影名" tips="请填写电影名" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影摘要</span>
                    <input type="text" class="form-control" id="abs" name="abs" value="" placeholder="请输入电影摘要" tips="请输入电影摘要" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影类型</span>
                    <#list movieTypeList as movieType>
                    <label style="margin-left:10px;" class="lyear-checkbox checkbox-inline checkbox-primary">
	                    <input type="checkbox" class="checkbox-parent movie-type" value="${movieType}">
	                    <span>${movieType.getName()}</span>
                    </label>
                    </#list>
                    <input type="hidden" name="type" id="movie-type" class="required" tips="请选择电影类型">
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影地区</span>
                    <select name="area" class="form-control" id="role">
                    	<#list movieAreaList as movieArea>
                    	<option value="${movieArea}">${movieArea.getName()}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影语言</span>
                    <select name="language" class="form-control" id="role">
                    	<#list movieLangList as movieLang>
                    	<option value="${movieLang}">${movieLang.getName()}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影导演</span>
                    <input type="text" class="form-control required" id="directedBy" name="directedBy" value="" placeholder="请填写电影导演" tips="请填写电影导演" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影主演</span>
                    <input type="text" class="form-control required" id="actor" name="actor" value="" placeholder="请填写电影主演" tips="请填写电影主演" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影片长</span>
                    <input type="number" class="form-control required" id="time" name="time" value="" placeholder="请填写电影片长（单位：分钟）" tips="请填写电影片长" />
                  	<span class="input-group-addon">分钟</span>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">上映时间</span>
                    <input type="text" class="form-control required js-datetimepicker" id="showTime" name="showTime" value="" placeholder="请选择电影上映日期" tips="请选择电影上映日期" data-side-by-side="true" data-locale="zh-cn" data-format="YYYY-MM-DD HH:mm:ss"  />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">剧情介绍</span>
                    <textarea class="form-control" id="info" name="info" rows="5" placeholder="请填写电影剧情介绍"></textarea>
                  </div>
                  <div class="input-group m-b-10">
                    是否上映：
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="isShow" value="true" checked="">
                    <span>是</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="isShow" value="false" >
                    <span>否</span>
                  </label>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<!--时间选择插件-->
<script src="/admin/js/bootstrap-datetimepicker/moment.min.js"></script>
<script src="/admin/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/admin/js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
<!--日期选择插件-->
<script src="/admin/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="/admin/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("user-add-form")){
			return;
		}
		var data = $("#user-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('电影添加成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-picture-file").click();
	});
	//监听上传视频按钮
	$("#add-video-btn").click(function(){
		$("#select-video-file").click();
	});
	//监听电影类型选择事件
	$(".movie-type").click(function(){
		selectedType();
	});
});
//获取选中的电影类型
function selectedType(){
	var selectedVal = '';
	$("input.movie-type[type='checkbox']:checked").each(function(i,e){
		selectedVal += $(e).val() + ',';
	});
	selectedVal = selectedVal.substring(0,selectedVal.length-1);
	$("#movie-type").val(selectedVal);
}
function uploadPicture(){
	if($("#select-picture-file").val() == '')return;
	var picture = document.getElementById('select-picture-file').files[0];
	uploadPhoto(picture,function(data){
		var html = '<li class="col-xs-4 col-sm-3 col-md-2 show-img"><figure>';
        html += '<img src="/photo/view?filename='+data.data+'" alt="剧照"></figure></li>';              
		if($("#show-uploaded-pic>li.show-img").length > 0){
			$("#show-uploaded-pic>li.show-img:last").after(html);
		}else{
			$("#show-uploaded-pic").prepend(html);
		}
		var pictures = $("#picture").val() == '' ? '' : $("#picture").val() + ';';
		$("#picture").val( pictures + data.data);
	});
}
function uploadVideo(){
	if($("#select-video-file").val() == '')return;
	var video = document.getElementById('select-video-file').files[0];
	uploadVideoToServer(video,function(data){
		$("#video").val(data.data);
		$("#preview-video").attr('src','/download/download_video?filename=' + data.data);
		$("#preview-video").closest("li").show();
	});
}
</script>
</body>
</html>