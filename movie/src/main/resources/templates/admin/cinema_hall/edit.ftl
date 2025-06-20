<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|影厅管理-编辑影厅</title>
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
              <div class="card-header"><h4>编辑影厅</h4></div>
              <div class="card-body">
                <form action="add" id="cinema-hall-add-form" method="post" class="row">
                  <input type="hidden" name="id" value="${cinemaHall.id}">
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影厅名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="${cinemaHall.name}" placeholder="请输入影厅名" tips="请填写影厅名" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属影院</span>
                    <select class="form-control" name="cinema" id="cinema-area-province">
                    	<#list cinemaList as cinema>
                    	<option value="${cinema.id}" <#if cinema.id == cinemaHall.cinema.id>selected</#if>>${cinema.name}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">横向座位数</span>
                    <input type="number" class="form-control required" disabled id="max-x" name="maxX" value="${cinemaHall.maxX}" placeholder="请填写影厅最大横向座位数" tips="请填写影厅最大横向座位数" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">纵向座位数</span>
                    <input type="number" class="form-control required" disabled id="max-y" name="maxY" value="${cinemaHall.maxY}" placeholder="请填写影厅最大纵向座位数" tips="请填写影厅最大纵向座位数" />
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
		if(!checkForm("cinema-hall-add-form")){
			return;
		}
		var data = $("#cinema-hall-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('影厅编辑成功!',function(){
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
	//监听影厅服务选择事件
	$(".cinema-service").click(function(){
		selectedService();
	});
});
//获取选中的影厅类型
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