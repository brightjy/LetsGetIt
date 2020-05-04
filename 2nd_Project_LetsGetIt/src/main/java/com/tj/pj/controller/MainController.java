package com.tj.pj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.pj.dto.Activity;
import com.tj.pj.dto.Member;
import com.tj.pj.service.ActivityService;
import com.tj.pj.util.Paging;

@Controller
public class MainController {
	
	@Autowired
	private ActivityService aService;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Activity activity, Model model, HttpSession httpsession) {	
		// 메인에서 인기순 베스트 10 뿌려주기(페이징X)
		model.addAttribute("activityLikeBestList", aService.activityLikeBestList(activity));
		// 메인에서 최신순 뿌려주기(페이징X)
		model.addAttribute("activityNewList", aService.activityNewList(activity));	
		model.addAttribute("actTotal", aService.activityCnt(activity));
		// 메인에서 호스트 좋아요 많은순 뿌려주기(페이징X)
		model.addAttribute("activityBestHostList", aService.activityBestHostList(activity));
		// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기(페이징X)
		String mId = null;
		Member member = (Member) httpsession.getAttribute("member");
		if(member!=null) {
			mId = member.getmId();
			model.addAttribute("memberCustomizedActList", aService.memberCustomizedActList(mId));	
			model.addAttribute("customizedTotal", aService.memberCustomizedActListAllCnt(mId));
		}
		return "main/main";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.POST)
	public String main_post(Activity activity, Model model, HttpSession httpsession) {	
		// 메인에서 인기순 베스트 10 뿌려주기(페이징X)
		model.addAttribute("activityLikeBestList", aService.activityLikeBestList(activity));
		// 메인에서 최신순 뿌려주기(페이징X)
		model.addAttribute("activityNewList", aService.activityNewList(activity));	
		model.addAttribute("actTotal", aService.activityCnt(activity));
		// 메인에서 호스트 좋아요 많은순 뿌려주기(페이징X)
		model.addAttribute("activityBestHostList", aService.activityBestHostList(activity));
		// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기(페이징X)
		String mId = null;
		Member member = (Member) httpsession.getAttribute("member");
		if(member!=null) {
			mId = member.getmId();
			model.addAttribute("memberCustomizedActList", aService.memberCustomizedActList(mId));
			model.addAttribute("customizedTotal", aService.memberCustomizedActListAllCnt(mId));
		}
		return "main/main";
	}
	
}
