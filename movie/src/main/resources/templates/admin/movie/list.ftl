<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|电影管理-${title!""}</title>
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
                <form class="pull-right search-bar" method="get" action="list" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      电影名 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">电影名</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${name!""}" name="name" placeholder="请输入电影名">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
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
                        <th>剧照</th>
                        <th>电影名</th>
                        <th>类型</th>
                        <th>地区</th>
                        <th>导演</th>
                        <th>演员</th>
                        <th>片长</th>
                        <th>上映时间</th>
                        <th>状态</th>
                        <th>添加时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content??>
                      <#list pageBean.content as movie>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${movie.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<a href="/home/movie/detail?id=${movie.id}" target="_blank">
                        	<#if movie.mainPic??>
                        		<#if movie.mainPic?length gt 0>
                        		<img src="/photo/view?filename=${movie.mainPic}" width="60px" height="60px">
                        		<#else>
                        		<img src="/admin/images/default-head.jpg" width="60px" height="60px">
                        		</#if>
                        	</#if>
                        	</a>
                        </td>
                        <td style="vertical-align:middle;"><a href="/home/movie/detail?id=${movie.id}" target="_blank">${movie.name}</a></td>
                        <td style="vertical-align:middle;">
                        	<#if movie.typeList??>
                        		<#list movie.typeList as type>
                        		<span class="tag" style="float:left;padding:2px 5px;background:#33cabb;color:#fff;margin-right:5px;margin-bottom:5px;font-size:13px;line-height:18px;"><span>${type.getName()}</span></span>
                        		</#list>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">
                        	${movie.area.getName()}
                        </td>
                        <td style="vertical-align:middle;">
                        	${movie.directedBy}
                        </td>
                        <td style="vertical-align:middle;">${movie.actor}</td>
                        <td style="vertical-align:middle;">${movie.time}分钟</td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${movie.showTime}</font></td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><#if movie.isShow == true><font class="text-success">上映<#else><font class="text-gray">下映</#if></font></td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${movie.createTime}</font></td>
                      </tr>
                    </#list>
                    <#if (pageBean.content?size == 0 ) >
                    <tr align="center"><td colspan="11">这里空空如也！</td></tr>
                    </#if>
                    <#else>
                    <tr align="center"><td colspan="11">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                  <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
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
				showSuccessMsg('电影删除成功!',function(){
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