package com.demo.movie.interceptor.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.demo.movie.service.common.AreaService;

/**
 * 前台统一管理拦截器
 * @author Administrator
 *
 */
@Component
public class Gloablinterceptor implements HandlerInterceptor{

	private Logger log = LoggerFactory.getLogger(Gloablinterceptor.class);
	
	@Autowired
	private AreaService areaService;
	
	@Override
	public boolean  preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		String requestURI = request.getRequestURI();
		log.info("进入前台全局拦截器" + requestURI);
		request.setAttribute("provinceList", areaService.getAllEnableProvince());
		request.setAttribute("cityList", areaService.getAllEnableCity());
		return true;
	}
}
