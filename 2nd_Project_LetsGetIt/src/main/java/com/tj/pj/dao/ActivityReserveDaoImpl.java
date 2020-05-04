package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.ActivityReserve;

@Repository
public class ActivityReserveDaoImpl implements ActivityReserveDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<ActivityReserve> hostActivityReserveList(ActivityReserve activityReserve) {
		return sessionTemplate.selectList("hostActivityReserveList", activityReserve);
	}

	@Override
	public int hostActivityCheck(int arId) {
		return sessionTemplate.update("hostActivityCheck", arId);
	}

	@Override
	public int hostActivityReserve(ActivityReserve activityReserve) {
		return sessionTemplate.insert("hostActivityReserve", activityReserve);
	}

	@Override
	public List<ActivityReserve> myActivityList(ActivityReserve activityReserve) {
		return sessionTemplate.selectList("myActivityList", activityReserve);
	}

	@Override
	public int myActivityReserveCnt(ActivityReserve activityReserve) {
		return sessionTemplate.selectOne("myActivityReserveCnt", activityReserve);
	}

}
