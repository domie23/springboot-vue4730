package com.demo.movie.controller.admin;

import java.util.List;

import com.demo.movie.bean.PageBean;
import com.demo.movie.bean.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.movie.entity.common.Order;
import com.demo.movie.entity.common.OrderItem;
import com.demo.movie.service.common.OrderItemService;
import com.demo.movie.service.common.OrderService;

/**
 * 订单管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/order")
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	
	/**
	 * 订单列表
	 * @param model
	 * @param order
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(Model model, Order order, PageBean<Order> pageBean){
		model.addAttribute("pageBean", orderService.findPage(order, pageBean));
		model.addAttribute("sn",order.getSn());
		return "admin/order/list";
	}
	
	/**
	 * 查看订单详情
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value="/view_detail",method=RequestMethod.POST)
	@ResponseBody
	public Result<List<OrderItem>> viewDetail(@RequestParam(name="orderId",required=true)Long orderId){
		return Result.success(orderItemService.find(orderId));
	}
}
