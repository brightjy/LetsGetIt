package com.tj.pj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tj.pj.dto.ActivityReserve;
import com.tj.pj.dto.Member;
import com.tj.pj.dto.Orders;
import com.tj.pj.service.ActivityService;
import com.tj.pj.service.OrderService;
	@Controller
	public class OrderController {
		@Autowired
		private OrderService orderService;
		
		@Autowired
		private ActivityService aService;
		
		@RequestMapping(value="addOrder", method=RequestMethod.GET)
		public String addOrder(ActivityReserve activityReserve,Orders order,HttpSession session,String mId) {
			 Member member = (Member)session.getAttribute("member");
			 order.setmId(member.getmId());
			 order.setoType("ORDERS");
			 order.setArCHECK(0);
			 orderService.addOrder(order);
			 aService.hostActivityReserve(activityReserve);
			return "forward:listOrder.do?oType=ORDERS";
		}
		
		@RequestMapping(value="listOrder", method=RequestMethod.GET)
		public ModelAndView listOrder(Orders order,HttpSession session,ModelAndView mv , @RequestParam("oType") String  oType) {
			String mId = (String) session.getAttribute("mId");
			Map<String, Object>map = new HashMap<String, Object>();
			order.setmId(mId);
			order.setoType(oType);
			System.out.println(order.getoType());
			List<Orders> list = orderService.listOrder(order);
			int AllsumMoney = orderService.AllsumMoney(mId);
		/* int sumMoney = orderService.sumMoney(order.getoNo()); */
			map.put("list",list);
			map.put("count",list.size());
			map.put("AllsumMoney",AllsumMoney);
		/* map.put("sumMoney",sumMoney); */
			if(oType.equals("ACTIVITY")) {
				mv.setViewName("member/myActivityList");
			}else if(oType.equals("ORDERS")) {
				mv.setViewName("order/orderList");
			}
			mv.addObject("map",map);
			return mv;
		}
		@RequestMapping(value="deleteOrder", method=RequestMethod.GET)
		public String deleteOrder(int oNo) {
			orderService.deleteOrder(oNo);
			return "redirect:listOrder.do";
		}
		@RequestMapping(value="modifyOredr", method=RequestMethod.GET)
		public String modifyOredr(@RequestParam int[] oQty,@RequestParam int[] actId,HttpSession session) {
			String mId =(String)session.getAttribute("mId");
			for(int i=0; i<actId.length; i++) {
				Orders orders = new Orders();
				orders.setmId(mId);
				orders.setoQty(oQty[i]);
				orders.setActId(actId[i]);
				orderService.modifyOrder(orders);
			}
			return "redirect:listOrder.do";
		}

	
//		 @RequestMapping(value="myActivityList", method=RequestMethod.POST)
//		 public String myActivityList(Orders order,HttpSession session,String mId) {
//			 Member member = (Member)session.getAttribute("member");
//		 	 order.setmId(member.getmId());
//		 	 orderService.addOrder(order);
//		 	 return "member/myActivityList";
//		 }
//		 
//		 @RequestMapping(value="myActivityList", method=RequestMethod.GET)
//		 public String myActivityListGet(Orders order,HttpSession session,String mId) {
//			 Member member = (Member)session.getAttribute("member");
//			 order.setmId(member.getmId());
//			 orderService.addOrder(order);
//			 return "member/myActivityList";
//		}
		 	
		@RequestMapping(value="modifyOrderType", method=RequestMethod.GET)
		public String modifyOrderType(Orders order,HttpSession session,String mId) {
			 Member member = (Member)session.getAttribute("member");
			 orderService.modifyOrderType(member.getmId());
			return "forward:listOrder.do?oType=ACTIVITY";
		}
		
		
		
		
	}

