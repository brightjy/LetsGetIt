package com.tj.pj.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.ActivityCategory;
import com.tj.pj.dto.ActivityReserve;
import com.tj.pj.dto.LikeActivity;
import com.tj.pj.dto.LikeCategory;
import com.tj.pj.dto.LikeHost;
import com.tj.pj.dto.Member;
import com.tj.pj.dto.MemberCoupon;
import com.tj.pj.service.ActivityService;
import com.tj.pj.service.CouponService;
import com.tj.pj.service.HostService;
import com.tj.pj.service.MemberService;
import com.tj.pj.util.Paging;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ActivityService aService;
	
	@Autowired
	private HostService hService;
	
	@Autowired
	private CouponService cService;
	
	//Member login
	@RequestMapping(value = "memberLoginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/memberLoginForm";
	}
	@RequestMapping(value = "memberLoginForm", method = RequestMethod.POST)
	public String loginForm1() {
		return "member/memberLoginForm";
	}
	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public String login(String mId,String mPw, Model model,HttpSession httpSession) {
		String result = memberService.memberLoginChk(mId, mPw, httpSession);
		if (result.equals("로그인 성공")) {
			model.addAttribute("result", result);
			return "redirect:main.do";
		} else {
			model.addAttribute("mId", mId);
			model.addAttribute("mPw", mPw);
			model.addAttribute("result", result);
			return "forward:memberLoginForm.do";
		}
	}
	@RequestMapping(value = "memberLogout", method = RequestMethod.GET)
	public String memberLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
	//
	
	
	//Member join
	@RequestMapping(value = "memberJoinForm", method = RequestMethod.GET)
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Member member, HttpSession httpSession) {
		memberService.memberJoin(member, httpSession);
		return "redirect:memberLoginForm.do";
	}
	@RequestMapping(value = "member_idconfirm", method = RequestMethod.POST)
	@ResponseBody
	public Object idConfirm(@RequestBody String mId) {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		int result = memberService.member_idconfirm(mId);
        returnMap.put("idConfirm", result);
		return returnMap;
	}
	@RequestMapping(value = "member_emailconfirm", method = RequestMethod.POST)
	@ResponseBody
	public Object emailConfirm(@RequestBody String mEmail) {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		int result = memberService.member_emailconfirm(mEmail);
        returnMap.put("emailConfirm", result);
		return returnMap;
	}

	
	//ID 찾기
	@RequestMapping(value = "memberSearchIdForm", method = RequestMethod.GET)
	public String idCkForm() {
		return "member/memberSearchIdForm";
	}
	@RequestMapping(value = "memberSearchId", method = RequestMethod.POST)
	public String memberSearchId(Member member, Model model,
			HttpSession httpSession) {
		Member result = memberService.idCk(member);
		if (result.equals("확인 성공")) {
			return "redirect:memberSearchId.do";
		} else {
			model.addAttribute("member", member);
			model.addAttribute("result", result);
			return "forward:memberSearchId.do";
		}
	}
	@RequestMapping(value = "idIdentify", method = RequestMethod.POST)
	public String idCkh() {
		return "member/idIdentify";
	}

	
	//PW 찾기
	@RequestMapping(value = "memberSearchPwForm", method = RequestMethod.GET)
	public String pwCkForm() {
		return "member/memberSearchPwForm";
	}
	@RequestMapping(value = "memberSearchPw", method = RequestMethod.POST)
	public String memberSearchPw(String mId, String mName, String mEmail, Model model) {
		// 사용자가 입력한 mId로 해당 회원 정보 가져오기
		Member member = memberService.memberGet(mId);
		// 사용자가 입력한 mName, mEmail과 실제 정보를 확인
		if (member.getmName().equals(mName) && member.getmEmail().equals(mEmail) && member.getmId().equals(mId)) {
			// 일치하는 경우
			memberService.pwCk(member);
			model.addAttribute("memberSearchPwMsg", "임시 비밀번호를 입력하신 메일로 발송했습니다.");
			
		} else {
			// 일치하지 않는 경우
			model.addAttribute("memberSearchPwMsg", "입력하신 내용과 일치하는 회원 정보가 없습니다.");
		}
		return "forward:memberLoginForm.do";
	}
	
	//Member Modify
	@RequestMapping(value = "memberModify")
	public String memberModify() {
		return "member/memberModifyForm";
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(Member member,MultipartHttpServletRequest mRequest, Model model,HttpSession httpSession) {
		int result = memberService.memberModify(member, mRequest);
		if (result == 1) {
			httpSession.setAttribute("member", member);
			model.addAttribute("modifyResult", result);
			return "redirect:main.do";
		} else {
			return "forward:memberModifyForm.do";
		}
	}
	
	// 멤버가 관심사 설정 페이지를 가는 경우
	@RequestMapping(value="memberLikeActCateForm", method = RequestMethod.GET)
	public  String memberLikeActCateForm(ActivityCategory aCategory, LikeCategory likeCategory, Model model, HttpSession httpsession) {		
		model.addAttribute("allCateList", aService.allCateList(aCategory)); // 페이지에 관심사를 뿌리기 위함
		model.addAttribute("myList", memberService.memberLikeCateWithCommaList(likeCategory, httpsession, model)); // 리스트에 있는 것 미리 표시해주기 위함 1, 3,
		System.out.println(memberService.memberLikeCateWithCommaList(likeCategory, httpsession, model).toString());
		return "member/memberLikeActCateForm";
	}
	
	// 멤버가 관심사 골라서 저장을 눌러서 여기에 온 경우
	@RequestMapping(value="memberLikeActCate", method = RequestMethod.GET)
	public String memberLikeActCate(LikeCategory likeCategory, Model model, HttpSession httpsession) {
		String mId = null;
		int result=0;
		Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
		if(member!=null) mId = member.getmId();
		likeCategory.setmId(mId);
		// 멤버가 이미 좋아한 카테고리인지 체크
		int checkResult = memberService.memberLikeCateCheck(likeCategory);
		if(checkResult!=1) { // 좋아한 적 없으면
			result = memberService.memberLikeActCate(likeCategory); // 좋아하기
			model.addAttribute("memberLikeActCate", result);
			model.addAttribute("resultMsg", "관심 카테고리가 저장되었습니다. ");
		}else { // 이미 좋아한거면
			result = memberService.memberDeleteLikeActCate(likeCategory); // 좋아요 취소하기
			model.addAttribute("memberLikeActCate", result); // result=mylist
			model.addAttribute("resultMsg", "관심 카테고리에서 제외되었습니다."); // 좋아요 취소하기
		}
		return "forward:memberLikeActCateForm.do";
	}
	
	// 멤버가 내가 좋아한 액티비티 보기를 클릭한 경우
		@RequestMapping(value="likeactivityList", method=RequestMethod.GET)
		public String memberLikeActivityList(LikeActivity likeActivity, Model model, HttpSession httpsession, String pageNum) {
			Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
			String mId = null;
			if(member!=null) mId = member.getmId();
			likeActivity.setmId(mId);	
			
			Paging paging = new Paging(aService.memberLikeActivityCnt(likeActivity), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			likeActivity.setStartRow(paging.getStartRow());
			likeActivity.setEndRow(paging.getEndRow());
			model.addAttribute("memberLikeActivityList", aService.memberLikeActivityList(likeActivity));
			model.addAttribute("paging", paging);
			return "member/likeActivityList";
		}
	
	// 멤버가 예약한 액티비티 리스트
	@RequestMapping(value="myActivityList", method=RequestMethod.GET)
	public String myActivityList(ActivityReserve activityReserve, String pageNum, Model model) {
		int total = aService.myActivityReserveCnt(activityReserve);
		Paging paging = new Paging(total, pageNum, 10, 10);
		activityReserve.setStartRow(paging.getStartRow());
		activityReserve.setEndRow(paging.getEndRow());
		model.addAttribute("activityList", aService.myActivityList(activityReserve));
		model.addAttribute("paging", paging);
		model.addAttribute("mId", activityReserve.getmId());
		return "member/myActivityList2";
	}
	// 멤버가 보유한 쿠폰 리스트
	@RequestMapping(value="myCouponList", method=RequestMethod.GET)
	public String myCouponList(MemberCoupon memberCoupon, Model model, String pageNum) {
		int total = cService.myCouponCnt(memberCoupon);
		Paging paging = new Paging(total, pageNum, 10, 10);
		memberCoupon.setStartRow(paging.getStartRow());
		memberCoupon.setEndRow(paging.getEndRow());
		model.addAttribute("couponList", cService.couponList(memberCoupon));
		model.addAttribute("paging", paging);
		return "member/couponList";
	}
	// 멤버가 헤더에서 '좋아한 호스트' 클릭
	@RequestMapping(value="memberlikeHostList", method=RequestMethod.GET)
	public String memberlikeHostList(LikeHost likeHost, Model model, HttpSession httpsession, String pageNum) {
		Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
		String mId = null;
		if(member!=null) mId = member.getmId();
		likeHost.setmId(mId);
		// 페이징
		Paging paging = new Paging(hService.memberLikeHostCnt(mId), pageNum, 10, 10);
		likeHost.setStartRow(paging.getStartRow());
		likeHost.setEndRow(paging.getEndRow());
		
		model.addAttribute("memberLikeHostList", hService.memberLikeHostList(likeHost));
		model.addAttribute("paging", paging);
		
		return "member/likeHostList";
	}
}
