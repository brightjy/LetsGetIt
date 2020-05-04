package com.tj.pj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.HostQna;

public interface HostQnaService {
	public List<HostQna> hostQnaList(HostQna hostQna);
	public int hostQnaCnt(HostQna hostQna);
	public HostQna hostQnaDetail(int qId);
	public int hostQnaWrite(HostQna hostQna,MultipartHttpServletRequest mRequest);
	public int hostQnaModify(HostQna hostQna,MultipartHttpServletRequest mRequest);
	public int hostQnaDelete(HostQna hostQna);
	public int hostQnaReplyStepA(int qGroup);
	public int hostQnaReply(HostQna hostQna, HttpServletRequest request);
}
