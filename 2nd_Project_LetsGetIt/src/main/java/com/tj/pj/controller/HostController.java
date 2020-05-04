package com.tj.pj.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.Host;
import com.tj.pj.service.HostService;

@Controller
public class HostController {

	@Autowired
	private HostService hostService;

	@RequestMapping(value = "hostMain.do", method = RequestMethod.GET)
	public String hostMain() {
		return "host/hostMain";
	}

	@RequestMapping(value = "hostMain.do", method = RequestMethod.POST)
	public String hostMainPost() {
		return "host/hostMain";
	}

	@RequestMapping(value = "hostLoginForm")
	public String hostLoginForm() {
		return "host/loginForm";
	}

	@RequestMapping(value = "hostjoinForm", method = RequestMethod.GET)
	public String hostjoinForm() {
		return "host/joinForm";
	}

	@RequestMapping(value = "idConfirm", method = RequestMethod.GET)
	public String hostIdChk(String hId, Model model) {
		int result = hostService.idConfirm(hId);
		model.addAttribute("result", result);
		return "host/idConfirm";
	}

	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public String hostEmailChk(String hEmail, Model model) {
		int result = hostService.emailConfirm(hEmail);
		model.addAttribute("result", result);
		return "host/emailConfirm";
	}

	@RequestMapping(value = "hostJoin", method = RequestMethod.POST)
	public String hostJoin(Host host, HttpSession httpSession) {
		hostService.hostJoin(host, httpSession);
		return "host/loginForm";
	}

	@RequestMapping(value = "hostSearchPwForm", method = RequestMethod.GET)
	public String hostSearchPwForm() {
		return "host/hostSearchPwForm";
	}

	@RequestMapping(value = "hostSearchPw", method = RequestMethod.GET)
	public String hostSearchPw(String hId, String hName, String hEmail, Model model) {
		Host host = hostService.getHost(hId);
		if (host.gethName().equals(hName) && host.gethEmail().equals(hEmail)) {
			hostService.hostSearchPw(host);
			model.addAttribute("hostSearchPwMsg", "임시 비밀번호를 입력하신 메일로 발송했습니다.");
		} else if(!host.gethName().equals(hName) && !host.gethEmail().equals(hEmail)) {
			model.addAttribute("hostSearchPwMsg", "입력하신 내용과 일치하는 회원 정보가 없습니다.");
		}
		return "forward:hostSearchPwForm.do";
	}
	@RequestMapping(value = "hostLogin", method = RequestMethod.POST)
	public String hostLogin(String hId, String hPw, Model model, HttpSession httpSession) {
		String result = hostService.hostLoginChk(hId, hPw, httpSession);
		Host host = hostService.getHost(hId);
		if (result.equals("로그인 성공")) {
			model.addAttribute("result", result);
			httpSession.setAttribute("host", host );
			return "redirect:main.do";
		} else {
			model.addAttribute("hId", hId);
			model.addAttribute("hPw", hPw);
			model.addAttribute("result", result);
			return "forward:hostLoginForm.do";
		}
	}

	@RequestMapping(value = "hostLogout", method = RequestMethod.GET)
	public String hostLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping(value = "hostModifyForm", method = RequestMethod.GET)
	public String modifyForm() {
		return "host/modifyForm";
	}

	@RequestMapping(value = "hostModify", method = RequestMethod.POST)
	public String modify(Host host, MultipartHttpServletRequest mRequest, HttpSession httpSession, Model model) {
		int result = hostService.hostModify(mRequest, host);
		if (result == 1) {
			httpSession.setAttribute("host", host);
			model.addAttribute("modifyResult", result);
			return "forward:main.do";
		} else {
			return "forward:hostModifyForm.do";
		}
	}
	


}
