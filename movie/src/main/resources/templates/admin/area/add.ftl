<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|地域管理-添加地域</title>
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
              <div class="card-header"><h4>添加地域</h4></div>
              <div class="card-body">
                <form action="add" id="area-add-form" method="post" class="row">
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属省份</span>
                    <select name="provinceId" class="form-control" id="province">
                        <option value="">请选择省份</option>
                        	<#if proviceList??>
                        	<#list proviceList as provice>
                        		<option value="${provice.id}" style="font-weight:bold;">${provice.name}</option>
                        	</#list>
                        	</#if>
                      </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属城市</span>
                    <select name="cityId" class="form-control" id="city">
                        <option value="">请选择城市</option>
                        	<#if cityList??>
                        	<#list cityList as city>
                        		<option value="${city.id}" style="font-weight:bold;">${city.name}</option>
                        	</#list>
                        	</#if>
                      </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">地域名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入地域名称" tips="请填写地域名称" />
                  </div>
                  <div class="input-group m-b-10">
                    是否显示：
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
<#include "../common/icons.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("area-add-form")){
			return;
		}
		var data = $("#area-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('地域添加成功!',function(){
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
	//监听省份下拉框改变
	$("#province").change(function(){
		var pid = $(this).val();
		ajaxRequest('get_citys','POST',{pid:pid},function(data){
			var citys = data.data;
			var options = '<option value="">请选择城市</option>';
			for(var i=0;i < citys.length;i++){
				var option = '<option value="'+citys[i].id+'">'+citys[i].name+'</option>';
				options += option;
			}
			$("#city option").remove();
			$("#city").append(options);
		});
	});
});

</script>
</body>
</html>