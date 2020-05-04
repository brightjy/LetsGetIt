package com.tj.pj.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.Admin;
import com.tj.pj.dto.AdminQna;
import com.tj.pj.dto.Coupon;
import com.tj.pj.dto.MemberCoupon;
import com.tj.pj.service.AdminService;
import com.tj.pj.service.CouponService;
import com.tj.pj.util.Paging;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private CouponService cService;
	
	private int check = 0;
	
	@RequestMapping(value="adminLoginForm", method=RequestMethod.GET)
	public String adminLoginForm() {
		return "admin/loginForm";
	}
	@RequestMapping(value="adminLoginForm", method=RequestMethod.POST)
	public String adminLoginFormPOST() {
		return "admin/loginForm";
	}
	@RequestMapping(value="adminLogout", method=RequestMethod.GET)
	public String adminLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(value="adminLogin", method=RequestMethod.POST)
	public String adminLogin(String aId, String aPw, Model model, HttpSession httpSession, Admin admin) {
		String result = adminService.adminLoginChk(aId, aPw, httpSession);
		System.out.println(result);
		if(result.equals("관리자 로그인 성공")) {
			model.addAttribute("result", result);
			return "redirect:main.do";
		}else {
			model.addAttribute("aId", aId);
			model.addAttribute("aPw", aPw);
			model.addAttribute("result", result);
			return "forward:adminLoginForm.do";
		}
	}
	
	@RequestMapping(value="adminQnaList", method=RequestMethod.GET)
	public String adminQnaList(String pageNum, AdminQna adminQna, Model model) {
		// 페이징
		Paging paging = new Paging(adminService.adminQnaCnt(adminQna), pageNum, 10, 10);
		adminQna.setStartRow(paging.getStartRow());
		adminQna.setEndRow(paging.getEndRow());
		model.addAttribute("adminQnaList", adminService.adminQnaList(adminQna));
		model.addAttribute("paging", paging);
		return "admin/qnaList";
	}
	@RequestMapping(value="adminQnaList", method=RequestMethod.POST)
	public String adminQnaListPOST(String pageNum, AdminQna adminQna, Model model) {
		// 페이징
		Paging paging = new Paging(adminService.adminQnaCnt(adminQna), pageNum, 10, 10);
		adminQna.setStartRow(paging.getStartRow());
		adminQna.setEndRow(paging.getEndRow());
		model.addAttribute("adminQnaList", adminService.adminQnaList(adminQna));
		model.addAttribute("paging", paging);
		return "admin/qnaList";
	}
	
	@RequestMapping(value="adminQnaWriteForm", method=RequestMethod.GET)
	public String adminQnaWriteForm() {		
		return "admin/qnaWriteForm";
	}
	
	@RequestMapping(value="adminQnaWrite", method=RequestMethod.POST)
	public String adminQnaWrite(AdminQna adminQna, MultipartHttpServletRequest mRequest, Model model) {
		int result = adminService.adminQnaWrite(mRequest, adminQna);
		if(result == 1) {
			model.addAttribute("resultMsg", "1:1 문의가 작성되었습니다.");
			return "forward:adminQnaList.do";
		}else {
			model.addAttribute("resultMsg", "1:1 문의 작성 실패");
			return "forward:adminQnaWriteForm.do";
		}
	}
	
	@RequestMapping(value="adminQnaModifyForm", method=RequestMethod.GET)
	public String adminQnaModifyForm(String pageNum, int qId, Model model ) {
		AdminQna adminQna = adminService.adminQnaDetail(qId);
		model.addAttribute("adminQna", adminQna);
		return "admin/qnaModifyForm";
	}
	
	@RequestMapping(value="adminQnaModifyForm", method=RequestMethod.POST)
	public String adminQnaModifyFormPOST(String pageNum, int qId, Model model ) {
		AdminQna adminQna = adminService.adminQnaDetail(qId);
		model.addAttribute("adminQna", adminQna);
		return "admin/qnaModifyForm";
	}
	
	
	@RequestMapping(value="adminQnaModify", method=RequestMethod.POST)
	public String adminQnaModify(String pageNum, AdminQna adminQna, MultipartHttpServletRequest mRequest, Model model) {
		int qId = adminQna.getqId();
		String qPwModify = adminQna.getqPw();
		AdminQna adminQnaDB = adminService.adminQnaDetail(qId);
		String qPwDB = adminQnaDB.getqPw();
		if(qPwModify.equals(qPwDB)) {
			adminService.adminQnaModify(mRequest, adminQna);
			model.addAttribute("resultMsg", "1:1 문의가 수정되었습니다.");
			return "forward:adminQnaList.do";
		}else {
			model.addAttribute("resultMsg", "1:1 문의 수정 실패");
			return "forward:adminQnaModifyForm.do";
		}
	}
	
	@RequestMapping(value="adminQnaDetail", method=RequestMethod.GET)
	public String adminQnaDetail(int qId, String pageNum, Model model) {
		AdminQna adminQna = adminService.adminQnaDetail(qId);
		adminService.adminQnaHitup(adminQna);
		model.addAttribute("adminQna", adminService.adminQnaDetail(qId));
		return "admin/qnaDetail";
	}
	
	@RequestMapping(value="adminQnaReplyForm", method=RequestMethod.GET)
	public String adminQnaReplyForm(int qId, Model model) {
		model.addAttribute("qId", qId);
		model.addAttribute("adminQna", adminService.adminQnaDetail(qId));
		return "admin/qnaReplyForm";
	}
	
	@RequestMapping(value="adminQnaReply", method=RequestMethod.POST)
	public String adminQnaReply(String pageNum, AdminQna adminQna, HttpServletRequest request, Model model) {
		int qGroup = adminQna.getqGroup();
		adminService.adminQnaReplyStepA(qGroup); // 스텝 A 진행
		int result = adminService.adminQnaReply(adminQna, request); // 답변 달기
		if(result==1) {		
			model.addAttribute("resultMsg", "1:1문의 답변이 작성되었습니다.");
			return "forward:adminQnaList.do";
		}else {
			model.addAttribute("resultMsg", "1:1문의 답변 작성 실패");
			return "forward:adminQnaReplyForm.do";
		}
	}
	
	@RequestMapping(value="adminQnaDelete", method=RequestMethod.GET)
	public String adminQnaDelete(String pageNum, int qId, String qPw, Model model) {
		AdminQna adminQna = adminService.adminQnaDetail(qId);
		if(adminQna.getqPw().equals(qPw)) {
			adminService.adminQnaDelete(adminQna);
			model.addAttribute("resultMsg", "1:1문의가 삭제되었습니다.");
			return "forward:adminQnaList.do";
		}else {
			model.addAttribute("resultMsg", "글 비밀번호가 일치하지 않습니다.");
			return "forward:adminQnaModifyFrom.do";
		}
	}
	
	// 쿠폰 관련
	@RequestMapping(value="couponWriteForm", method=RequestMethod.GET)
	public String couponWriteForm() {
		check = 0;
		return "admin/couponWriteForm";
	}
	@RequestMapping(value="couponWrite", method=RequestMethod.POST)
	public String couponWrite(Coupon coupon, Model model) {
		if(check == 0) {
			int result = cService.couponWrite(coupon);
			if(result == 1) {
				model.addAttribute("couponWrite", "쿠폰 생성이 완료되었습니다");
			} else if(result == 0) {
				model.addAttribute("errorMsg", "쿠폰 생성에 실패했습니다");
			}
			check = 1;
		}
		return "forward:couponList.do";
	}
	@RequestMapping(value="couponList", method=RequestMethod.GET)
	public String couponList(Coupon coupon, Model model, String pageNum) {
		int total =	cService.couponTotCnt();
		Paging paging = new Paging(total, pageNum, 7, 10);
		coupon.setStartRow(paging.getStartRow());
		coupon.setEndRow(paging.getEndRow());
		model.addAttribute("couponList", cService.couponAllList(coupon));
		model.addAttribute("paging", paging);
		return "admin/couponList";
	}
	@RequestMapping(value="couponList", method=RequestMethod.POST)
	public String couponList_post(Coupon coupon, Model model, String pageNum) {
		int total =	cService.couponTotCnt();
		Paging paging = new Paging(total, pageNum, 10, 10);
		coupon.setStartRow(paging.getStartRow());
		coupon.setEndRow(paging.getEndRow());
		model.addAttribute("couponList", cService.couponAllList(coupon));
		model.addAttribute("paging", paging);
		return "admin/couponList";
	}
	@RequestMapping(value="couponModifyForm", method=RequestMethod.GET)
	public String couponModifyForm(Coupon coupon, Model model) {
		model.addAttribute("coupon", cService.getCoupon(coupon));
		check = 0;
		return "admin/couponModifyForm";
	}
	@RequestMapping(value="couponModifyForm", method=RequestMethod.POST)
	public String couponModifyForm_post(Coupon coupon, Model model) {
		model.addAttribute("coupon", cService.getCoupon(coupon));
		check = 0;
		return "admin/couponModifyForm";
	}
	@RequestMapping(value="couponModify", method=RequestMethod.POST)
	public String couponModify(Coupon coupon, Model model) {
		if(check == 0) {
			int result = cService.couponModify(coupon);
			if(result == 1) {
				model.addAttribute("couponModify", "쿠폰 수정이 완료되었습니다");
			} else if(result == 0) {
				model.addAttribute("errorMsg", "쿠폰 수정에 실패했습니다");
			}
			check = 1;
		}
		return "forward:couponList.do";
	}
	@RequestMapping(value="couponDelete", method=RequestMethod.GET)
	public String couponDelete(Coupon coupon, MemberCoupon memberCoupon, Model model) {
		int result = cService.getMemberCouponCnt(memberCoupon);
		if(result == 0) {
			result = cService.couponDelete(coupon);
			if(result == 1) {
				model.addAttribute("couponDelete", "쿠폰 삭제가 완료되었습니다");
			} else if(result == 0) {
				model.addAttribute("errorMsg", "쿠폰 삭제가 실패했습니다");
			}
		} else {
			model.addAttribute("errorMsg", "해당 쿠폰을 보유중인 회원이 있습니다");
		}
		return "forward:couponList.do";
	}
	@RequestMapping(value="couponPaymentsForm", method=RequestMethod.GET)
	public String couponPaymentsForm(Coupon coupon, Model model) {
		model.addAttribute("coupon", cService.getCoupon(coupon));
		check = 0;
		return "admin/couponPayments";
	}
	@RequestMapping(value="couponPayments", method=RequestMethod.POST)
	public String couponPayments(MemberCoupon memberCoupon, Model model, int cDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("MM/dd");
		memberCoupon.setmBirth(df.format(cal.getTime()));
		df = new SimpleDateFormat("yyyy-MM-dd");
		switch (cDate) {
		case 1:
			cal.add(Calendar.MONTH, 1);
			break;
		case 2:
			cal.add(Calendar.MONTH, 3);
			break;
		case 3:
			cal.add(Calendar.MONTH, 6);
			break;
		case 4:
			cal.add(Calendar.YEAR, 1);
			break;
		case 5:
			cal.add(Calendar.YEAR, 100);
			break;
		}
		String date = df.format(cal.getTime());
		memberCoupon.setMcDate(java.sql.Date.valueOf(date));
		if(check == 0) {
			int result = cService.couponPayments(memberCoupon);
			if(result > 0) {
				model.addAttribute("couponPayments", "쿠폰 지급이 완료되었습니다");
			} else if(result == 0) {
				model.addAttribute("errorMsg", "쿠폰 지급이 실패하였습니다. 생일인 회원이 없습니다");
			}
			check = 1;
		}
		return "forward:couponList.do";
	}
	
}
