<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|新闻管理-编辑新闻</title>
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
              <div class="card-header"><h4>编辑新闻</h4></div>
              <div class="card-body">
                <form action="add" id="user-add-form" method="post" class="row">
                  <input type="hidden" name="id" value="${news.id}">
                  <div class="form-group col-md-12">
                    <label>封面上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="/photo/view?filename=${news.picture}" id="show-picture-img" alt="默认头像">
                          </figure>
                        </li>
                        <input type="hidden" value="${news.picture}" name="picture" class="required" id="picture" tips="请上传新闻封面!">
                        <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','picture')">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">新闻标题</span>
                    <input type="text" class="form-control required" id="title" name="title" value="${news.title}" placeholder="请输入新闻标题" tips="请填写新闻标题" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属分类</span>
                    <select name="newsCategory.id" class="form-control" id="newsCategory">
                    	<#list newsCategoryList as newsCategory>
                    	<option value="${newsCategory.id}" <#if news.newsCategory.id == newsCategory.id>selected</#if>>${newsCategory.name}</option>
                    	</#list>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">新闻摘要</span>
                    <textarea class="form-control required" id="abs" name="abs" rows="3" maxlength="252" placeholder="请填写新闻摘要" tips="请填写新闻摘要">${news.abs}</textarea>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">新闻内容</span>
                    <textarea class="form-control required" id="content" name="content" rows="8" maxlength="2500" placeholder="请填写新闻内容" tips="请填写新闻内容">${news.content}</textarea>
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
					showSuccessMsg('新闻保存成功!',function(){
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
		$("#select-file").click();
	});
});

</script>
</body>
</html>