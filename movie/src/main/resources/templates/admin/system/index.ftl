<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>猫眼后台管理系统主页</title>
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
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">入驻影院</p>
                  <p class="h3 text-white m-b-0">${cinemaTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-movie fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">电影总数</p>
                  <p class="h3 text-white m-b-0">${movieTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-film fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">注册用户</p>
                  <p class="h3 text-white m-b-0">${userTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account-multiple fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">累计订单</p>
                  <p class="h3 text-white m-b-0">${orderTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-keyboard-close fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">放映场次</p>
                  <p class="h3 text-white m-b-0">${cinemaHallSessionTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-lightbulb fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">充值记录总数</p>
                  <p class="h3 text-white m-b-0">${payLogTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-cash-multiple fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">充值成功数</p>
                  <p class="h3 text-white m-b-0">${paySuccessTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-cash fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">累计票房</p>
                  <p class="h3 text-white m-b-0">${moneyTotal!"0"}(元)</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

        
        <div class="row">
          
          <div class="col-sm-6">
            <div class="card">
              <div class="card-header"><h4>最近一周充值记录图</h4></div>
              <div class="card-body">
                <canvas id="chart-line-3"></canvas>
              </div>
            </div>
          </div>
          
          <div class="col-sm-6">
            <div class="card">
              <div class="card-header"><h4>票房排行榜前五</h4></div>
              <div class="card-body">
                <canvas id="chart-vbar-1"></canvas>
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
<script type="text/javascript" src="/admin/js/Chart.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	new Chart($("#chart-line-3"), {
	    type: 'line',
	    data: {
	        labels: [<#list allPayLogList as payLog>"${payLog.day}",</#list>],
	        datasets: [{
	            label: "充值次数",
	            fill: false,
	            backgroundColor: "#36a2eb",
	            borderColor: "#36a2eb",
	            borderWidth: 3,
	            pointRadius: 0,
	            data: [<#list allPayLogList as payLog>"${payLog.num}",</#list>]
	        },
	        {
	            label: "充值成功次数",
	            fill: false,
	            borderColor: "#ff6384",
	            backgroundColor: "#ff6384",
	            borderWidth: 3,
	            pointRadius: 0,
	            data: [<#list paidPayLogList as payLog>"${payLog.num}",</#list>]
	        }]
	    },
	    options: {tooltips: {
						mode: 'index',
						intersect: false,
				  },   }
	});
	new Chart($("#chart-vbar-1"), {
	    type: 'bar',
	    data: {
	        labels: [<#list topMovieList as movie>"<#if movie.name?length gt 4>${movie.name?substring(0,4)}...<#else>${movie.name}</#if>",</#list>],
	        datasets: [{
	            label: "累计票房",
	            backgroundColor: "rgba(51,202,185,0.5)",
	            borderColor: "rgba(0,0,0,0)",
	            hoverBackgroundColor: "rgba(51,202,185,0.7)",
	            hoverBorderColor: "rgba(0,0,0,0)",
	            data: [<#list topMovieList as movie>"${movie.totalMoney}",</#list>]
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        },
	        axisLabel: { interval:0, rotate:40 }
	    }
	});
});

</script>
</body>
</html>