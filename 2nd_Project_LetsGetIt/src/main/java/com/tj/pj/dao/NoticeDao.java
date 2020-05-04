package com.tj.pj.dao;

import java.util.List;
import com.tj.pj.dto.Notice;

public interface NoticeDao {
	public List<Notice> noticeList(Notice notice);
	public int cntNotice(Notice notice);
	public int noticeWrite(Notice notice);
	public int noticeModify(Notice notice);
	public int noticeDelete(Notice notice);
	public Notice detailNotice(int nNo);
}
