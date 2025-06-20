<div class="header">
    <div class="top-nav">
        <div class="container fn-clear">
              <span class="tip">
              	欢迎来到猫眼电影票
              	<#if ylrc_account??>
              	<span class="user-name">${ylrc_account.nickname!ylrc_account.mobile}</span>
              	<a class="loginout" href="/home/index/logout">退出</a>
              	<#else>
              	<a rel="#verlayLogin" href="javascript:void(0)" class="boxLogin blue">登录</a>
              	<a href="/home/index/register">注册</a>
              	</#if>
              </span>
            <ul>
                <li><a href="/home/account/user-center" title="个人中心" data-flag="<#if ylrc_account??>0<#else>1</#if>">个人中心</a></li>
                <li><a href="/home/account/user-order-list" title="我的订单" data-flag="<#if ylrc_account??>0<#else>1</#if>">我的订单</a></li>
                <li><a href="/home/help/use-help" title="帮助中心" target="_blank">帮助中心</a></li>
                <li><a href="/system/login" title="后台管理中心" target="_blank">后台管理中心</a></li>
            </ul>
        </div>
    </div>

    <div class="main-nav">
        <div class="container fn-clear">
            <div class="logo"><a href="/home/index/index"><img src="/home/images/logo.png" alt="猫眼电影票" title="猫眼电影票" width="165"/></a></div>
            <div class="location" data-citycode="360100">
                <span class="lc"><#if ylrc_area??>${ylrc_area.name}<#else>请选择</#if></span>
                <ul class="other-city">
                    <#list provinceList as province>
                    	<li style="width:315px;"><a><font size="3px"><b>${province.name}</b></font></a></li>
                    	<#list cityList as city>
                    	<#if province.id == city.provinceId>
                    	<li><a onclick="changecity('${city.id}')" href="javascript:void(0)">${city.name}</a></li>
                    	</#if>
                    	</#list>
                    </#list>
                </ul>
            </div>
            <ul class="nav-list fn-clear">
                <li data-index="index"><a href="/home/index/index">首页</a></li>
                <li data-index="movie"><a href="/home/movie/list">电影</a></li>
                <li data-index="cinema"><a href="/home/cinema/list">影院</a></li>
                <li data-index="news"><a href="/home/news/list">资讯</a></li>
                
            </ul>
        </div>
    </div>
</div>