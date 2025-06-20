<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|订单管理-${title!""}</title>
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
                      订单编号 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">订单编号</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${sn!""}" name="sn" placeholder="请输入订单编号">
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
                        <th>订单编号</th>
                        <th>所属用户</th>
                        <th>订单状态</th>
                        <th>影票数量</th>
                        <th>支付金额</th>
                        <th>下单时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as order>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${order.id}" data-movie-name="${order.cinemaHallSession.movie.name}" data-movie-pic="${order.cinemaHallSession.movie.mainPic}" data-cinema-name="${order.cinemaHallSession.cinema.name}" data-cinema-hall-session="${order.cinemaHallSession.startTime}" data-cinema-hall-name="${order.cinemaHallSession.cinemaHall.name}" data-order-item-num="${order.num}" data-cinema-hall-type="${order.cinemaHallSession.cinemaSessionType.getName()}" data-movie-language="${order.cinemaHallSession.movie.language.getName()}" data-cinema-hall-session-old-price="${order.cinemaHallSession.oldPrice}" data-cinema-hall-session-new-price="${order.cinemaHallSession.newPrice}" data-money="${order.newMoney}" data-mobile="${order.account.mobile}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	${order.sn}
                        </td>
                        <td style="vertical-align:middle;">${order.account.mobile}</td>
                        <td style="vertical-align:middle;">
                        	<#if order.status == 0>
                        	<font class="text-danger">待支付</font>
                        	<#elseif order.status == 1>
                        	<font class="text-success">已支付</font>
                        	<#else>
                        	<font class="text-secondary">已取消</font>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">${order.num}</td>
                        <td style="vertical-align:middle;">
                        	<font class="text-success">${order.newMoney}</font>
                        </td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${order.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="7">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?sn=${sn!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?sn=${sn!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?sn=${sn!""}&currentPage=${pageBean.totalPage}">»</a></li>
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
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="show-detail-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">查看订单详情</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12" style="">
          	<p id="movie-title">电影标题</p>
          	<table class="table table-bordered">
                    <thead>
                      <tr>
                      <th rowspan="7"><img id="movie-img" src="/photo/view?filename=20201004/1601795846759.jpg" width="156" height="270"></th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="cinema-name">
                          	影院：松江万达影城
                        </th>
                        <th style="border-bottom:0px;" id="cinema-hall-session">
                          	场次：2020-11-18 11:30
                        </th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="cinema-hall-name">
                          	影厅：1号巨幕影厅
                        </th>
                        <th style="border-bottom:0px;" id="order-num">
                          	数量：2
                        </th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="cinema-hall-type">
                          	版本：2D
                        </th>
                        <th style="border-bottom:0px;" id="movie-language">
                          	语言：英语
                        </th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="movie-old-price">
                          	票价：80 元
                        </th>
                        <th style="border-bottom:0px;" id="order-old-money">
                          	总价：160 元
                        </th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="order-discount">
                          	优惠：70 元
                        </th>
                        <th style="border-bottom:0px;" id="order-new-money">
                          	实付：90.00 元
                        </th>
                      </tr>
                      <tr>
                        <th style="border-bottom:0px;" id="order-item-seat">
                          	座位：2排3座 2排4座
                        </th>
                        <th style="border-bottom:0px;" id="order-mobile">
                          	手机号：13918661215
                        </th>
                      </tr>
                    </thead>
                  </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

//打开查看详情页面
function view(url){
	var checked = $("input[type='checkbox']:checked");
	if(checked.length != 1){
		showWarningMsg('请选择一条数据进行查看！');
		return;
	}
	ajaxRequest('view_detail','post',{orderId:checked.val()},function(rst){
		var oldPrice = parseFloat(checked.attr('data-cinema-hall-session-old-price'));
		var payMoney = parseFloat(checked.attr('data-money'));
		var num = parseInt(checked.attr('data-order-item-num'));
		var orderItems = rst.data;
		var seat = '';
		for(var i=0;i<orderItems.length;i++){
			seat += orderItems[i].cinemaHallSeat.y + '排' + orderItems[i].cinemaHallSeat.x + '座  ';
		}
		$("#movie-title").text(checked.attr('data-movie-name'));
		$("#movie-img").attr('src','/photo/view?filename='+checked.attr('data-movie-pic'));
		$("#cinema-name").text('影院：'+checked.attr('data-cinema-name'));
		$("#cinema-hall-session").text('场次：'+checked.attr('data-cinema-hall-session'));
		$("#cinema-hall-name").text('影厅：'+checked.attr('data-cinema-hall-name'));
		$("#order-num").text('数量：'+num);
		$("#cinema-hall-type").text('版本：'+checked.attr('data-cinema-hall-type'));
		$("#movie-language").text('语言：'+checked.attr('data-movie-language'));
		$("#movie-old-price").text('票价：'+oldPrice);
		$("#order-old-money").text('总价：'+(oldPrice * num));
		$("#order-discount").text('优惠：'+(oldPrice * num - payMoney));
		$("#order-new-money").text('实付：'+(payMoney));
		$("#order-item-seat").text('座位：'+(seat));
		$("#order-mobile").text('手机号：'+checked.attr('data-mobile'));
		$("#show-detail-modal").modal('show');
	});
	
}
</script>
</body>
</html>