package com.tj.pj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Member;
@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int memberJoin(Member member) {
		
		return sessionTemplate.insert("memberJoin",member);
	}

	@Override
	public Member memberGet(String mId) {
		
		return sessionTemplate.selectOne("memberGet", mId);
	}

	@Override
	public int memberModify(Member member) {
		
		return sessionTemplate.update("memberModify",member);
	}

	@Override
	public int member_idconfirm(String mId) {
		
		return sessionTemplate.selectOne("member_idconfirm", mId);
	}

	@Override
	public Member idCk(Member member) {

		return sessionTemplate.selectOne("idCk",member );
	}
	
	@Override
	public int pwChange(Member member) {

		return sessionTemplate.selectOne("pwChange",member);
	}

	@Override
	public int member_emailconfirm(String mEmail) {

		return sessionTemplate.selectOne("member_emailconfirm",mEmail);
	}

	@Override
	public int pwCk(Member member) {

		return sessionTemplate.update("pwCk",member);
	}

}
