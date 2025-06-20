<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|电影院管理-添加电影院</title>
<#include "../common/header.ftl"/>
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
              <div class="card-header"><h4>添加电影院</h4></div>
              <div class="card-body">
                <form action="add" id="cinema-add-form" method="post" class="row">
                  <div class="form-group col-md-12">
                    <label>照片上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic" id="show-uploaded-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2 show-img">
                        <figure>
                        <img src="/admin/images/default-cinema.jpg" id="picture-preview">
                        </figure>
                        </li>
                        <input type="hidden" name="picture" id="picture">
                        <input type="file" id="select-picture-file" style="display:none;" onchange="uploadPicture()">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影院名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入电影院名" tips="请填写电影院名" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">电影院地区</span>
                    <select class="form-control" id="cinema-area-province" style="width:33%;">
                    	<option value="">请选择省份</option>
                    	<#list provinceList as province>
                    	<option value="${province.id}">${province.name}</option>
                    	</#list>
                    </select>
                    <select class="form-control" id="cinema-area-city" style="width:33%;">
                    </select>
                    <select name="area" class="form-control" id="cinema-area-district" style="width:33%;">
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影院服务</span>
                    <#list cinemaServiceList as cinemaService>
                    <label style="margin-left:10px;" class="lyear-checkbox checkbox-inline checkbox-primary">
	                    <input type="checkbox" class="checkbox-parent cinema-service" value="${cinemaService}">
	                    <span>${cinemaService.getName()}</span>
                    </label>
                    </#list>
                    <input type="hidden" name="cinemaService" id="cinema-service" class="required" tips="请选择电影院服务">
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影院地址</span>
                    <input type="text" class="form-control required" id="address" name="address" value="" placeholder="请填写电影院详细地址" tips="请填写电影院详细地址" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">联系电话</span>
                    <input type="text" class="form-control required" id="tel" name="tel" value="" placeholder="请填写电影院联系电话" tips="请填写电影院联系电话" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">交通路线</span>
                    <input type="text" class="form-control required" id="transport" name="transport" value="" placeholder="请填写电影院交通路线" tips="请填写电影院交通路线" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影院介绍</span>
                    <textarea class="form-control" id="info" name="info" rows="5" placeholder="请填写电影院介绍"></textarea>
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
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("cinema-add-form")){
			return;
		}
		if($('#cinema-area-district').val() == '' || $('#cinema-area-district').val() == null){
			showErrorMsg('请选择地区!');
			return;
		}
		var data = $("#cinema-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('电影院添加成功!',function(){
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
	//监听地区省份改变
	$("#cinema-area-province").change(function(){
		var pid = $(this).val();
		if(pid == '')return;
		ajaxRequest('/admin/area/get_citys','POST',{pid:pid},function(data){
			var citys = data.data;
			var options = '<option value="">请选择城市</option>';
			for(var i=0;i < citys.length;i++){
				var option = '<option value="'+citys[i].id+'">'+citys[i].name+'</option>';
				options += option;
			}
			$("#cinema-area-city option").remove();
			$("#cinema-area-district option").remove();
			$("#cinema-area-city").append(options);
		});
	});
	//监听地区城市改变
	$("#cinema-area-city").change(function(){
		var cid = $(this).val();
		if(cid == '')return;
		ajaxRequest('/admin/area/get_districts','POST',{cid:cid},function(data){
			var districts = data.data;
			var options = '<option value="">请选择区</option>';
			for(var i=0;i < districts.length;i++){
				var option = '<option value="'+districts[i].id+'">'+districts[i].name+'</option>';
				options += option;
			}
			$("#cinema-area-district option").remove();
			$("#cinema-area-district").append(options);
		});
	});
	//监听电影院服务选择事件
	$(".cinema-service").click(function(){
		selectedService();
	});
});
//获取选中的电影院类型
function selectedService(){
	var selectedVal = '';
	$("input.cinema-service[type='checkbox']:checked").each(function(i,e){
		selectedVal += $(e).val() + ',';
	});
	selectedVal = selectedVal.substring(0,selectedVal.length-1);
	$("#cinema-service").val(selectedVal);
}
function uploadPicture(){
	if($("#select-picture-file").val() == '')return;
	var picture = document.getElementById('select-picture-file').files[0];
	uploadPhoto(picture,function(data){
		$("#picture-preview").attr('src','/photo/view?filename='+data.data);
		$("#picture").val(data.data);
	});
}

</script>
</body>
</html>