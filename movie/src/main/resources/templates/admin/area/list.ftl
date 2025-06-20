<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|地域管理-${title!""}</title>
<#include "../common/header.ftl"/>
<style>
td{
	vertical-align:middle;
}
</style>
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
              <div class="card-toolbar clearfix">
                <!--
                <form class="pull-right search-bar" method="get" action="#!" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <input type="hidden" name="search_field" id="search-field" value="title">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      名称 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">名称</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${name!""}" name="name" placeholder="请输入名称">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="button">搜索</button>
                    </span>
                  </div>
                </form>
                -->
                <#include "../common/third-menu.ftl"/>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>名称</th>
                        <th>是否显示</th>
                        <th>添加时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if proviceList??>
                      <#list proviceList as province>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${province.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;"><b>${province.name}</b></td>
                        <td style="vertical-align:middle;"><#if province.isShow == true><font class="text-success">是</font><#else><font class="text-info">否</font></#if></td>
                        <td style="vertical-align:middle;"><font class="text-success">${province.createTime}</font></td>
                      </tr>
					   <#if cityList??>
					   <#list cityList as city>
					   <#if city.provinceId == province.id>
					   <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${city.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">|-----${city.name}</td>
                        <td style="vertical-align:middle;"><#if city.isShow == true><font class="text-success">是</font><#else><font class="text-info">否</font></#if></td>
                        <td style="vertical-align:middle;"><font class="text-success">${city.createTime}</font></td>
                      </tr>
                      <#if districtList??>
                      <#list districtList as district>
                      	<#if district.cityId == city.id>
					    <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${district.id}"><span></span>
                          </label>
                        </td>
                        <td style="padding-left:45px;vertical-align:middle;">|-----${district.name}</td>
                        <td style="vertical-align:middle;"><#if district.isShow == true><font class="text-success">是</font><#else><font class="text-info">否</font></#if></td>
                        <td style="vertical-align:middle;"><font class="text-success">${district.createTime}</font></td>
                      	</tr>
                      	</#if>
                      </#list>
                      </#if>
                      </#if>
                      </#list>
                      </#if>
                    </#list>
                    </#if>
                    </tbody>
                  </table>
                </div>
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
	
});
function del(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行删除！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	$.confirm({
        title: '确定删除？',
        content: '删除后数据不可恢复，请慎重！',
        buttons: {
            confirm: {
                text: '确认',
                action: function(){
                    deleteReq(id,url);
                }
            },
            cancel: {
                text: '关闭',
                action: function(){
                    
                }
            }
        }
    });
}
//打开编辑页面
function edit(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行编辑！');
		return;
	}
	window.location.href = url + '?id=' + $("input[type='checkbox']:checked").val();
}
//调用删除方法
function deleteReq(id,url){
	$.ajax({
		url:url,
		type:'POST',
		data:{id:id},
		dataType:'json',
		success:function(data){
			if(data.code == 0){
				showSuccessMsg('地域删除成功!',function(){
					$("input[type='checkbox']:checked").parents("tr").remove();
				})
			}else{
				showErrorMsg(data.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
</script>
</body>
</html>