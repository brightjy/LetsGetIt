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

import com.tj.pj.dto.Cart;
import com.tj.pj.dto.Member;
import com.tj.pj.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@RequestMapping(value="addCart", method=RequestMethod.GET)
	public String addCart(Cart cart,HttpSession session,String mId) {
		 Member member = (Member)session.getAttribute("member");
		 cart.setmId(member.getmId());
		 cartService.addCart(cart);
		 int count =cartService.countCart(cart.getActId(), mId);
		 if(count==0) {
			 cartService.addCart(cart);
		 }else {
			 cartService.updateCart(cart);
		 }
		return "redirect:listCart.do";
	}
	@RequestMapping(value="listCart", method=RequestMethod.GET)
	public ModelAndView listCart(Cart cart,HttpSession session,ModelAndView mv) {
		String mId = (String) session.getAttribute("mId");
		Map<String, Object>map = new HashMap<String, Object>();
		List<Cart> list = cartService.listCart(mId);
		int sumMoney = cartService.sumMoney(mId);
		map.put("list",list);
		map.put("count",list.size());
		map.put("sumMoney",sumMoney);
		mv.setViewName("order/cartList");
		mv.addObject("map",map);
		return mv;
	}
	@RequestMapping(value="deleteCart", method=RequestMethod.GET)
	public String deleteCart(int cId) {
		cartService.deleteCart(cId);
		return "redirect:listCart.do";
	}
	@RequestMapping(value="modifyCart", method=RequestMethod.GET)
	public String modifyCart(@RequestParam int[] cAmount,@RequestParam int[] actId,HttpSession session) {
		String mId =(String)session.getAttribute("mId");
		for(int i=0; i<actId.length; i++) {
			Cart carts = new Cart();
			carts.setmId(mId);
			carts.setcAmount(cAmount[i]);
			carts.setActId(actId[i]);
			cartService.modifyCart(carts);
		}
		return "redirect:listCart.do";
	}
}
