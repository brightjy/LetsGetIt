package com.tj.pj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.util.Paging;
import com.tj.pj.dto.Admin;
import com.tj.pj.dto.HostQna;
import com.tj.pj.dto.Notice;
import com.tj.pj.service.AdminService;
import com.tj.pj.service.MemberService;
import com.tj.pj.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@RequestMapping(value = "noticeAllList", method = RequestMethod.GET)
	public String noticeAllList(Model model ,String pageNum, Notice notice) {
		
		// �Ķ���� ����
		notice.setnType("ALL");
		
		// ���� ȣ��
		//List<Notice> list = noticeService.noticeList(notice); 
		
		//��ܿ� ������ �Ѱ���
		//model.addAttribute("nList", list);
		Paging paging = new Paging(noticeService.cntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("nList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);
		return "notice/noticeAllList";
	}
	
	///////////////////////////////////////////////////////////////
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public String noticeList(Model model ,String pageNum, Notice notice) {
		/*Paging paging = new Paging(noticeService.cntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("noticeList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);*/
		
		notice.setnType("notice");
		
		// ���� ȣ��
		//List<Notice> list = noticeService.noticeList(notice); 
		
		//��ܿ� ������ �Ѱ���
		//model.addAttribute("nList", list);
		Paging paging = new Paging(noticeService.cntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("nList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);
		return "notice/noticeList";
	}
	
	/////////////////////////////////////////////////////////////////
	@RequestMapping(value = "noticeEventList", method = RequestMethod.GET)
	public String eventList(Model model ,String pageNum, Notice notice) {
		
		notice.setnType("event");
		
		// ���� ȣ��
		//List<Notice> list = noticeService.noticeList(notice); 
		
		//��ܿ� ������ �Ѱ���
		//model.addAttribute("nList", list);
		Paging paging = new Paging(noticeService.cntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("nList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);
		return "notice/noticeEventList";
	}
	/////////////////////////////////////////////////////////////////
	@RequestMapping(value = "announcementList", method = RequestMethod.GET)
	public String announcementList(Model model ,String pageNum, Notice notice) {
	
		notice.setnType("announce");
		
		// ���� ȣ��
		//List<Notice> list = noticeService.noticeList(notice); 
		
		//��ܿ� ������ �Ѱ���
		//model.addAttribute("nList", list);
		Paging paging = new Paging(noticeService.cntNotice(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		model.addAttribute("nList", noticeService.noticeList(notice));
		model.addAttribute("paging", paging);
		return "notice/announcementList";
	}
	/////////////////////////////////////////////////////////////////
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String writeForm() {				
		return "notice/writeForm";
	}
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public String noticewrite(Notice notice,MultipartHttpServletRequest mRequest) {
		noticeService.noticeWrite(notice,mRequest);
		return "notice/noticeList";
	}
	
	@RequestMapping(value = "noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Notice notice,String pageNum, Model model,int nNo) {
		notice = noticeService.detailNotice(nNo);
		model.addAttribute("noticeDetail",notice);
		return "notice/noticeDetail";
	}
	
	
	@RequestMapping(value = "noticeModifyForm", method = RequestMethod.GET)
	public String noticeModifyForm() {
		
		return "notice/noticeModifyForm";
	}
	@RequestMapping(value = "noticeModify", method = RequestMethod.POST)
	public String noticeModify(Notice notice,String pageNum,MultipartHttpServletRequest mRequest) {
			noticeService.noticeModify(notice,mRequest);
			return "forward:noticeAllList.do";

	}
}
