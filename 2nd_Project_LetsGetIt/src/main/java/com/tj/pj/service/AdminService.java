package com.tj.pj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.Admin;
import com.tj.pj.dto.AdminQna;

public interface AdminService {
	public List<AdminQna> adminQnaList(AdminQna adminQna);
	public int adminQnaCnt(AdminQna adminQna);
	public int adminQnaHitup(AdminQna adminQna);
	public AdminQna adminQnaDetail(int qId);
	public int adminQnaWrite(MultipartHttpServletRequest mRequest, AdminQna adminQna);
	public int adminQnaModify(MultipartHttpServletRequest mRequest, AdminQna adminQna);
	public int adminQnaDelete(AdminQna adminQna);
	public int adminQnaReplyStepA(int qGroup);
	public int adminQnaReply(AdminQna adminQna, HttpServletRequest request);
	public int adminJoin(Admin admin);
	public Admin getAdmin(String aId);
	public String adminLoginChk(String aId, String aPw, HttpSession httpSession);
	public Admin adminGet(String aId);
}
