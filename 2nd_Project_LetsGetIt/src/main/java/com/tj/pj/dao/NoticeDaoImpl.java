package com.tj.pj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int noticeWrite(Notice notice) {
		
		return sessionTemplate.insert("noticeWrite",notice);
	}

	@Override
	public int noticeModify(Notice notice) {
		
		return sessionTemplate.update("noticeModify",notice);
	}

	@Override
	public List<Notice> noticeList(Notice notice) {
		
		return sessionTemplate.selectList("noticeList",notice);
	}

	@Override
	public int noticeDelete(Notice notice) {
		
		return sessionTemplate.delete("noticeDelete",notice);
	}

	@Override
	public int cntNotice(Notice notice) {
		
		return sessionTemplate.selectOne("cntNotice",notice);
	}

	@Override
	public Notice detailNotice(int nNo) {
		
		return sessionTemplate.selectOne("detailNotice",nNo);
	}

}
