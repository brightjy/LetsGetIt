package com.tj.pj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Admin;
@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int adminJoin(Admin admin) {
		return sessionTemplate.insert("adminJoin", admin);
	}

	@Override
	public Admin getAdmin(String aId) {
		return sessionTemplate.selectOne("getAdmin", aId);
	}
	@Override
	public Admin adminGet(String aId) {		
		return sessionTemplate.selectOne("adminGet",aId);
	}
}
