<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|排片场次管理-添加排片场次</title>
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
              <div class="card-header"><h4>添加排片场次</h4></div>
              <div class="card-body">
                <form action="add" id="cinema-hall-add-form" method="post" class="row">
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">排片电影</span>
                    <select class="form-control" name="movie" >
                    	<#list movieList as movie>
                    	<option value="${movie.id}">${movie.name}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属影院</span>
                    <select class="form-control" name="cinema" id="cinema">
                    	<option value="">请选择所属影院</option>
                    	<#list cinemaList as cinema>
                    	<option value="${cinema.id}">${cinema.name}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属影厅</span>
                    <select class="form-control" name="cinemaHall" id="cinema-hall">
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">放映类型</span>
                    <select class="form-control" name="cinemaSessionType" id="cinemaSessionType">
                    	<#list cinemaSessionTypeList as cinemaSessionType>
                    	<option value="${cinemaSessionType}">${cinemaSessionType.getName()}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">放映日期</span>
                    <input type="text" class="form-control required js-datetimepicker" id="show-date" name="showDate" value="" placeholder="请选择场次放映日期" tips="请选择场次放映日期" data-side-by-side="true" data-locale="zh-cn" data-format="YYYY-MM-DD" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">放映时间</span>
                    <input type="text" class="form-control required js-datetimepicker" id="show-time" name="showTime" value="" placeholder="请选择场次放映时间" tips="请选择场次放映时间" data-side-by-side="true" data-locale="zh-cn" data-format="HH:mm" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影票原价</span>
                    <input type="number" class="form-control required" id="old-price" name="oldPrice" value="" placeholder="请填写影票原价" tips="请填写影票原价" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">影票现价</span>
                    <input type="number" class="form-control required" id="new-price" name="newPrice" value="" placeholder="请填写影票现价" tips="请填写影票现价" />
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
		if(!checkForm("cinema-hall-add-form")){
			return;
		}
		if($("#cinema").val() == ''){
			showErrorMsg('请选择所属影院！');
			return;
		}
		if($("#cinema-hall").val() == ''){
			showErrorMsg('请选择所属影厅！');
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
					showSuccessMsg('排片场次添加成功!',function(){
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
	//监听影院改变
	$("#cinema").change(function(){
		var cid = $(this).val();
		if(cid == '')return;
		ajaxRequest('/admin/cinema_hall/get_cinema_halls','POST',{cid:cid},function(data){
			var halls = data.data;
			var options = '<option value="">请选择影厅</option>';
			for(var i=0;i < halls.length;i++){
				var option = '<option value="'+halls[i].id+'">'+halls[i].name+'</option>';
				options += option;
			}
			$("#cinema-hall option").remove();
			$("#cinema-hall").append(options);
		});
	});
	
});
//获取选中的排片场次类型
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