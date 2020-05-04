package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Host;
@Repository
public class HostDaoImpl implements HostDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int idConfirm(String hId) {
		return sessionTemplate.selectOne("idConfirm",hId);
	}
	
	@Override
	public int emailConfirm(String hEmail) {
		return sessionTemplate.selectOne("emailConfirm", hEmail);
	}

	@Override
	public int hostJoin(Host host) {
		return sessionTemplate.insert("hostJoin", host);
	}

	@Override
	public int hostSearchPw(Host host) {
		return sessionTemplate.update("hostSearchPw", host);
	}
	
	@Override
	public Host getHost(String hId) {
		return sessionTemplate.selectOne("getHost", hId);
	}

	@Override
	public int hostModify(Host host) {
		return sessionTemplate.update("hostModify", host);
	}

	@Override
	public List<Host> hostList(Host host) {
		return sessionTemplate.selectList("hostList", host);
	}

	@Override
	public List<Host> hostBestList(Host host) {
		return sessionTemplate.selectList("hostBestList", host);
	}

	@Override
	public int memberLikeHost(Host host) {
		return sessionTemplate.update("memberLikeHost", host);
	}

	@Override
	public int whenMemberHostLike(String hId) {
		return sessionTemplate.update("whenMemberHostLike", hId);
	}

	@Override
	public int whenMemberHostDislike(String hId) {
		return sessionTemplate.update("whenMemberHostDislike", hId);
	}

	



}
