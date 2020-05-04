package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.ActivityCategory;

@Repository
public class ActivityCategoryDaoImpl implements ActivityCategoryDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<ActivityCategory> activityCategoryList(ActivityCategory aCategory) {
		return sessionTemplate.selectList("activityCategoryList", aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory2List(ActivityCategory aCategory) {
		return sessionTemplate.selectList("activityCategory2List", aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory3List(ActivityCategory aCategory) {
		return sessionTemplate.selectList("activityCategory3List", aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory4List(ActivityCategory aCategory) {
		return sessionTemplate.selectList("activityCategory4List", aCategory);
	}
	@Override
	public int activityCategoryCheck(ActivityCategory aCategory) {
		return sessionTemplate.selectOne("activityCategoryCheck", aCategory);
	}
	@Override
	public List<ActivityCategory> allCateList(ActivityCategory aCategory) {
		return sessionTemplate.selectList("allCateList", aCategory);
	}

}
