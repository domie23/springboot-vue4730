<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼|影厅管理-编辑影厅座位</title>
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
              <div class="card-header"><h4>编辑影厅座位</h4></div>
              <div class="card-body">
                <form action="add" id="cinema-hall-add-form" method="post" class="row">
                  <input type="hidden" name="cinemaHall" value="${cinemaHall.id}">
                  <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <#if cinemaHallSeats??>
                      <#list cinemaHallSeats as cinemaHallSeat>
                      <#if cinemaHallSeat.x == 1>
                      <tr>
                      </#if>
                      <th style="text-align:center;" class="seat" x="${cinemaHallSeat.x}" y="${cinemaHallSeat.y}" data-id="${cinemaHallSeat.id}" data-createTime="${cinemaHallSeat.createTime}" >
	                        <#if cinemaHallSeat.status == 1>
	                        <#if cinemaHallSeat.type == 1>
	                        <img src="/admin/images/seat.png">
	                        <#else>
	                        <img src="/admin/images/love-seat.png">
	                        </#if>
	                        <#else>
	                        <#if cinemaHallSeat.type == 1>
	                        <img src="/admin/images/unable-seat.png">
	                        <#else>
	                        <img src="/admin/images/unable-love-seat.png">
	                        </#if>
	                        </#if>
	                        ${cinemaHallSeat.y}排${cinemaHallSeat.x}座
	                        <label class="lyear-radio radio-inline radio-primary enable-seat">
		                    	<input type="radio" name="status-${cinemaHallSeat.x}-${cinemaHallSeat.y}" value="1" <#if cinemaHallSeat.status == 1>checked</#if>><span>可&nbsp;&nbsp;&nbsp;&nbsp;用</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-grey unable-seat">
		                    	<input type="radio" name="status-${cinemaHallSeat.x}-${cinemaHallSeat.y}" value="0" <#if cinemaHallSeat.status == 0>checked</#if>><span>不可用</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-primary normal-seat">
		                    	<input type="radio" name="type-${cinemaHallSeat.x}-${cinemaHallSeat.y}" value="1" <#if cinemaHallSeat.type == 1>checked</#if>><span>普通座</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-pink love-seat">
		                    	<input type="radio" name="type-${cinemaHallSeat.x}-${cinemaHallSeat.y}" value="2" <#if cinemaHallSeat.type == 2>checked</#if>><span>情侣座</span>
		                    </label>
                        </th>
                      <#if cinemaHallSeat.x == cinemaHall.maxX>
                      </tr>
                      </#if>
                      </#list>
                      <#else>
                      <#list 1..cinemaHall.maxY as y>
                      <tr>
                        <#list 1..cinemaHall.maxX as x>
                        <th style="text-align:center;" class="seat" x="${x}" y="${y}" >
	                        <img src="/admin/images/seat.png">
	                        ${y}排${x}座
	                        <label class="lyear-radio radio-inline radio-primary enable-seat">
		                    	<input type="radio" name="status-${x}-${y}" value="1" checked><span>可&nbsp;&nbsp;&nbsp;&nbsp;用</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-grey unable-seat">
		                    	<input type="radio" name="status-${x}-${y}" value="0"><span>不可用</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-primary normal-seat">
		                    	<input type="radio" name="type-${x}-${y}" value="1" checked><span>普通座</span>
		                    </label>
		                    <br/>
	                        <label class="lyear-radio radio-inline radio-pink love-seat">
		                    	<input type="radio" name="type-${x}-${y}" value="2"><span>情侣座</span>
		                    </label>
                        </th>
                        </#list>
                      </tr>
                      </#list>
                      </#if>
                    </thead>
                  </table>
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
		var data = new Array();
		$(".seat").each(function(i,e){
			var x = $(e).attr("x");
			var y = $(e).attr("y");
			var status = $(e).find("input[type='radio'][name='status-"+x+"-"+y+"']:checked").val();
			var type = $(e).find("input[type='radio'][name='type-"+x+"-"+y+"']:checked").val();
			var seat = {x:x,y:y,status:status,type:type,cinemaHall:{id:${cinemaHall.id}}};
			var id = $(e).attr("data-id");
			var createTime = $(e).attr("data-createTime");
			if(id != 'undefined' && id != '' && id != null){
				seat.id = id;
			}
			if(createTime != 'undefined' && createTime != '' && createTime != null){
				seat.createTime = createTime;
			}
			data.push(seat);
		});
		ajaxRequest('edit_seat','post',{seats:JSON.stringify(data)},function(){
			showSuccessMsg('座位保存成功!',function(){
				window.location.href = 'list';
			})
		});
	});
	//监听点击可用按钮
	$(".enable-seat").click(function(){
		var img = $(this).prev("img");
		var x = $(this).closest("th").attr('x');
		var y = $(this).closest("th").attr('y');
		var type = $("input[type='radio'][name='type-"+x+"-"+y+"']:checked").val();
		var src = parseInt(type) == 1 ? '/admin/images/seat.png' : '/admin/images/love-seat.png';
		img.attr('src',src);
	});
	//监听点击不可用按钮
	$(".unable-seat").click(function(){
		var img = $(this).prevAll("img");
		var x = $(this).closest("th").attr('x');
		var y = $(this).closest("th").attr('y');
		var type = $("input[type='radio'][name='type-"+x+"-"+y+"']:checked").val();
		var src = parseInt(type) == 1 ? '/admin/images/unable-seat.png' : '/admin/images/unable-love-seat.png';
		img.attr('src',src);
	});
	//监听点击普通座位按钮
	$(".normal-seat").click(function(){
		var img = $(this).prevAll("img");
		var x = $(this).closest("th").attr('x');
		var y = $(this).closest("th").attr('y');
		var status = $("input[type='radio'][name='status-"+x+"-"+y+"']:checked").val();
		var src = parseInt(status) == 1 ? '/admin/images/seat.png' : '/admin/images/unable-seat.png';
		img.attr('src',src);
	});
	//监听点击情侣座位按钮
	$(".love-seat").click(function(){
		var img = $(this).prevAll("img");
		var x = $(this).closest("th").attr('x');
		var y = $(this).closest("th").attr('y');
		var status = $("input[type='radio'][name='status-"+x+"-"+y+"']:checked").val();
		var src = parseInt(status) == 1 ? '/admin/images/love-seat.png' : '/admin/images/unable-love-seat.png';
		img.attr('src',src);
	});
	
});


</script>
</body>
</html>