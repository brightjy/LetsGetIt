package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Activity;

@Repository
public class ActivityDaoImpl implements ActivityDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int activityWrite(Activity activity) {
		return sessionTemplate.insert("activityWrite", activity);
	}
	@Override
	public List<Activity> hostActivityList(Activity activity) {
		System.out.println("DAO  : activity" + activity);
		return sessionTemplate.selectList("hostActivityList", activity);
	}
	@Override
	public List<Activity> hostActivityList2(String hId) {
		return sessionTemplate.selectList("hostActivityList2", hId);
	}	
	@Override
	public int activityModify(Activity activity) {
		return sessionTemplate.update("activityModify", activity);
	}

	@Override
	public int activityDelete(Activity activity) {
		return sessionTemplate.delete("activityDelete", activity);
	}

	@Override
	public Activity getActivity(Activity activity) {
		return sessionTemplate.selectOne("getActivity", activity);
	}

	@Override
	public int hostActivityTotal(Activity activity) {
		return sessionTemplate.selectOne("hostActivityTotal", activity);
	}
	
	@Override
	public int activityCnt(Activity activity) {
		return sessionTemplate.selectOne("activityCnt", activity);
	}

	@Override
	public List<Activity> activityAllList(Activity activity) {
		return sessionTemplate.selectList("activityAllList", activity);
	}

	@Override
	public List<Activity> activityAsCateList(Activity activity) {
		return sessionTemplate.selectList("activityAsCateList", activity);
	}

	@Override
	public List<Activity> activityBestHostList(Activity activity) {
		return sessionTemplate.selectList("activityBestHostList", activity);
	}

	@Override
	public List<Activity> activityLikeBestList(Activity activity) {
		return sessionTemplate.selectList("activityLikeBestList", activity);
	}

	@Override
	public List<Activity> activityNewList(Activity activity) {
		return sessionTemplate.selectList("activityNewList", activity);
	}

	@Override
	public List<Activity> activityBestCateList(Activity activity) {
		return sessionTemplate.selectList("activityBestCateList", activity);
	}

	@Override
	public int activityBestCateCnt(Activity activity) {
		return sessionTemplate.selectOne("activityBestCateCnt", activity);
	}

	@Override
	public Activity activityDetail(Activity activity) {
		return sessionTemplate.selectOne("activityDetail", activity);
	}

	@Override
	public List<Activity> activityByCateList(Activity activity) {
		return sessionTemplate.selectList("activityByCateList", activity);
	}

	@Override
	public List<Activity> memberCustomizedActList(String mId) {
		return sessionTemplate.selectList("memberCustomizedActList", mId);
	}

	@Override
	public List<Activity> activitySameCate3List(int actId) {
		return sessionTemplate.selectList("activitySameCate3List", actId);
	}

	@Override
	public List<Activity> memberCustomizedActListAll(Activity activity) {
		return sessionTemplate.selectList("memberCustomizedActListAll", activity);
	}

	@Override
	public int memberCustomizedActListAllCnt(String mId) {
		return sessionTemplate.selectOne("memberCustomizedActListAllCnt", mId);
	}
	@Override
	public int activityReviewGrade(Activity activity) {
		return sessionTemplate.update("activityReviewGrade", activity);
	}


}
