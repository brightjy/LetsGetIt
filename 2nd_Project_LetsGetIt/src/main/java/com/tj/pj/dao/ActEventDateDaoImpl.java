package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.ActEventDate;

@Repository
public class ActEventDateDaoImpl implements ActEventDateDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int activityDate(ActEventDate actEventDate) {
		return sessionTemplate.insert("activityDate", actEventDate);
	}

	@Override
	public List<ActEventDate> hostActivityDateList(int actId) {
		return sessionTemplate.selectList("hostActivityDateList", actId);
	}

	@Override
	public int activityDateModify(ActEventDate actEventDate) {
		return sessionTemplate.update("activityDateModify", actEventDate);
	}

	@Override
	public int activityDateDelete(ActEventDate actEventDate) {
		return sessionTemplate.delete("activityDateDelete", actEventDate);
	}

	@Override
	public List<ActEventDate> getActivityDate(int actId) {
		return sessionTemplate.selectList("getActivityDate", actId);
	}

	@Override
	public ActEventDate getActDate(ActEventDate actEventDate) {
		return sessionTemplate.selectOne("getActDate", actEventDate);
	}

	@Override
	public List<ActEventDate> hostActivityCheckList(ActEventDate actEventDate) {
		return sessionTemplate.selectList("hostActivityCheckList", actEventDate);
	}

	@Override
	public int hostActivityCheckTotal(ActEventDate actEventDate) {
		return sessionTemplate.selectOne("hostActivityCheckTotal", actEventDate);
	}

	@Override
	public int hostActivityReserveCnt(ActEventDate actEventDate) {
		return sessionTemplate.selectOne("hostActivityReserveCnt", actEventDate);
	}

	@Override
	public int getActivityDateCnt(ActEventDate actEventDate) {
		return sessionTemplate.selectOne("getActivityDateCnt", actEventDate);
	}

}
