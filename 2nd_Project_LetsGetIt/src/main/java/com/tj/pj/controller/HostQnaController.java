package com.tj.pj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.HostQna;
import com.tj.pj.service.HostQnaService;
import com.tj.pj.util.Paging;
@Controller
public class HostQnaController {
	@Autowired
	private HostQnaService hostQnaService;
	
	@RequestMapping(value = "hostQnaList", method = RequestMethod.GET)
	public String hostQnaList(String pageNum, HostQna hostQna, Model model) {
		System.out.println(hostQna);
		Paging paging = new Paging(hostQnaService.hostQnaCnt(hostQna), pageNum, 10, 10);
		hostQna.setStartRow(paging.getStartRow());
		hostQna.setEndRow(paging.getEndRow());
		model.addAttribute("hostQnaList", hostQnaService.hostQnaList(hostQna));
		model.addAttribute("paging", paging);
		model.addAttribute("writeActid", hostQna.getActId());
		return "hostQna/hostqnaList";
	}
	@RequestMapping(value = "hostQnaList", method = RequestMethod.POST)
	public String hostQnaList1(String pageNum, HostQna hostQna, Model model) {
		System.out.println(hostQna);
		Paging paging = new Paging(hostQnaService.hostQnaCnt(hostQna), pageNum, 10, 10);
		hostQna.setStartRow(paging.getStartRow());
		hostQna.setEndRow(paging.getEndRow());
		model.addAttribute("hostQnaList", hostQnaService.hostQnaList(hostQna));
		model.addAttribute("paging", paging);
		model.addAttribute("writeActid", hostQna.getActId());
		return "hostQna/hostqnaList"; 
	}
	@RequestMapping(value = "hostqnaWriteForm", method = RequestMethod.GET)
	public String hostqnaWriteForm(int writeActid,Model model) {
		model.addAttribute("writeActid", writeActid);
		return "hostQna/hostqnaWriteForm";
	}
	@RequestMapping(value = "hostQnaWrite", method = RequestMethod.POST)
	public String hostQnaWrite(HostQna hostQna,MultipartHttpServletRequest mRequest) {
		
		hostQnaService.hostQnaWrite(hostQna,mRequest);
		
		return "forward:hostQnaList.do";
	}
	@RequestMapping(value = "hostQnaDetail", method = RequestMethod.GET)
	public String hostQnaDetail(HostQna hostQna,Model model,String pageNum,int qId) {
		hostQna = hostQnaService.hostQnaDetail(qId);
		model.addAttribute("hostQna",hostQna);
		return "hostQna/hostqnaDetail";
	}
	@RequestMapping(value = "hostQnaModifyForm", method = RequestMethod.GET)
	public String hostQnaModifyForm(int writeActid,Model model,HostQna hostQna) {
		model.addAttribute("hostQna", hostQna);
		model.addAttribute("writeActid", writeActid);
		return "hostQna/hostqnaModifyForm";
	}
	@RequestMapping(value = "hostQnaModify", method = RequestMethod.POST)
	public String hostQnaModify(String pageNum,HostQna hostQna,MultipartHttpServletRequest mRequest) {
		int qId = hostQna.getqId();
		String MPw = hostQna.getqPw();
		HostQna ModifyQna = hostQnaService.hostQnaDetail(qId);
		String Pw = ModifyQna.getqPw();
		if(MPw.equals(Pw)) {
			hostQnaService.hostQnaModify(hostQna,mRequest);
			return "forward:hostQnaList.do";
		}else {
			return "forward:hostQnaModifyForm.do";
		}
	}
	@RequestMapping(value = "hostQnaReplyForm", method = RequestMethod.GET)
	public String hostQnaReplyForm(int qId, Model model) {
		model.addAttribute("qId", qId);
		model.addAttribute("hostQna", hostQnaService.hostQnaDetail(qId));
		return "hostQna/hostqnaReplyForm";
	}
	@RequestMapping(value="hostQnaReply", method=RequestMethod.POST)
	public String hostQnaReply(String pageNum, HostQna hostQna, HttpServletRequest request, Model model) {
		int qGroup = hostQna.getqGroup();
		hostQnaService.hostQnaReplyStepA(qGroup); // ���� A ����
		int result = hostQnaService.hostQnaReply(hostQna, request); // �亯 �ޱ�
		if(result==1) {		
			model.addAttribute("resultMsg", "1:1���� �亯�� �ۼ��Ǿ����ϴ�.");
			return "forward:hostQnaList.do";
		}else {
			model.addAttribute("resultMsg", "1:1���� �亯 �ۼ� ����");
			return "forward:hostQnaReplyForm.do";
		}
	}
	@RequestMapping(value = "hostQnaDelete", method = RequestMethod.GET)
	public String hostQnaDelete(String pageNum, int qId, String qPw, Model model,HostQna hostQna) {
		//model.addAttribute("hostQna", hostQna);
		if(hostQna.getqPw().equals(qPw)) {
			hostQnaService.hostQnaDelete(hostQna);
			return "forward:hostQnaList.do";
		}else {
			model.addAttribute("resultMsg", "�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "forward:hostQnaModifyForm.do";
		}
	}
}
