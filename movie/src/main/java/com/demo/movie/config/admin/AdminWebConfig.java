package com.demo.movie.config.admin;
/**
 * 用来配置后台拦截器的配置类
 */
import com.demo.movie.constant.RuntimeConstant;
import com.demo.movie.interceptor.admin.AdminLoginInterceptor;
import com.demo.movie.interceptor.admin.AuthorityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdminWebConfig implements WebMvcConfigurer {
	
	@Autowired
	private AdminLoginInterceptor adminLoginInterceptor;
	
	@Autowired
	private AuthorityInterceptor authorityInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(adminLoginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.adminLoginExcludePathPatterns);
	    registry.addInterceptor(authorityInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.adminAuthorityExcludePathPatterns);
	}

}
