package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.HostQna;
@Repository
public class HostQnaDaoImpl implements HostQnaDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<HostQna> hostQnaList(HostQna hostQna) {
		
		return sessionTemplate.selectList("hostQnaList",hostQna);
	}

	@Override
	public int hostQnaCnt(HostQna hostQna) {
		
		return sessionTemplate.selectOne("hostQnaCnt",hostQna);
	}

	@Override
	public HostQna hostQnaDetail(int qId) {
		
		return sessionTemplate.selectOne("hostQnaDetail",qId);
	}

	@Override
	public int hostQnaWrite(HostQna hostQna) {
		
		return sessionTemplate.insert("hostQnaWrite",hostQna);
	}

	@Override
	public int hostQnaModify(HostQna hostQna) {
		
		return sessionTemplate.update("hostQnaModify",hostQna);
	}

	@Override
	public int hostQnaDelete(HostQna hostQna) {
		
		return sessionTemplate.delete("hostQnaDelete",hostQna);
	}

	@Override
	public int hostQnaReplyStepA(int qGroup) {
		
		return sessionTemplate.update("hostQnaReplyStepA",qGroup);
	}

	@Override
	public int hostQnaReply(HostQna hostQna) {
		
		return sessionTemplate.insert("hostQnaReply",hostQna);
	}

}
