package com.tj.pj.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.Notice;

public interface NoticeService {
	public List<Notice> noticeList(Notice notice);
	public int noticeWrite(Notice notice,MultipartHttpServletRequest mRequest);
	public int noticeModify(Notice notice,MultipartHttpServletRequest mRequest);
	public int noticeDelete(Notice notice);
	public int cntNotice(Notice notice);
	public Notice detailNotice(int nNo);
	
}
