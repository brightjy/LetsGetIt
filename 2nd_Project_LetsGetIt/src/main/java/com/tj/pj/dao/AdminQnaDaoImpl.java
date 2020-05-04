package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.AdminQna;

@Repository
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<AdminQna> adminQnaList(AdminQna adminQna) {
		return sessionTemplate.selectList("adminQnaList", adminQna);
	}

	@Override
	public int adminQnaCnt(AdminQna adminQna) {
		return sessionTemplate.selectOne("adminQnaCnt", adminQna);
	}

	@Override
	public int adminQnaHitup(AdminQna adminQna) {
		return sessionTemplate.update("adminQnaHitup", adminQna);
	}

	@Override
	public AdminQna adminQnaDetail(int qId) {
		return sessionTemplate.selectOne("adminQnaDetail", qId);
	}

	@Override
	public int adminQnaWrite(AdminQna adminQna) {
		return sessionTemplate.insert("adminQnaWrite", adminQna);
	}

	@Override
	public int adminQnaModify(AdminQna adminQna) {
		return sessionTemplate.update("adminQnaModify", adminQna);
	}

	@Override
	public int adminQnaDelete(AdminQna adminQna) {
		return sessionTemplate.delete("adminQnaDelete", adminQna);
	}

	@Override
	public int adminQnaReplyStepA(int qGroup) {
		return sessionTemplate.update("adminQnaReplyStepA", qGroup);
	}

	@Override
	public int adminQnaReply(AdminQna adminQna) {
		return sessionTemplate.insert("adminQnaReply", adminQna);
	}
}
