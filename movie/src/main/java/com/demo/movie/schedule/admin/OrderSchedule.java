package com.demo.movie.schedule.admin;

import java.util.Date;
import java.util.List;

import com.demo.movie.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.demo.movie.service.common.OrderService;

/**
 * 订单状态检测定时器
 * @author Administrator
 *
 */
@Configuration
@EnableScheduling
public class OrderSchedule {

	@Autowired
	private OrderService orderService;
	@Value("${movie.order.timeout}")
	private Integer orderTimeout;//订单过期时间
	
	private Logger log = LoggerFactory.getLogger(OrderSchedule.class);
	
	//@Scheduled(initialDelay=10000,fixedRate=5000)
	@Scheduled(fixedDelay=10000)//每隔5秒检查一次是否超时
	public void checkOrder(){
		log.info("开始执行订单状态检查任务！");
		Date outTime = StringUtil.getBeforeDate(new Date(), orderTimeout/60);
		List<String> snList = orderService.findTimeOutList(outTime);
		for(String sn : snList){
			orderService.cancelOrder(sn);
		}
		log.info("成功将【" + StringUtil.getFormatterDate(outTime, "yyyy-MM-dd HH:mm:ss") + "】时间内超时的【" + snList.size() + "】个订单自动取消!");
	}
}
