package com.tj.pj.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.pj.dao.ActEventDateDao;
import com.tj.pj.dao.ActivityCategoryDao;
import com.tj.pj.dao.ActivityDao;
import com.tj.pj.dao.ActivityReserveDao;
import com.tj.pj.dao.LikeActivityDao;
import com.tj.pj.dto.ActEventDate;
import com.tj.pj.dto.Activity;
import com.tj.pj.dto.ActivityCategory;
import com.tj.pj.dto.ActivityReserve;
import com.tj.pj.dto.LikeActivity;

@Service
public class ActivityServiceImpl implements ActivityService {
	@Autowired
	private ActivityDao aDao;
	@Autowired
	private ActEventDateDao aeDao;
	@Autowired
	private ActivityReserveDao arDao;
	@Autowired
	private ActivityCategoryDao acDao;
	@Autowired
	private LikeActivityDao laDao;
	
	@Override
	public int activityWrite(Activity activity) {
		return aDao.activityWrite(activity);
	}
	@Override
	public int activityDate(ActEventDate actEventDate) {
		return aeDao.activityDate(actEventDate);
	}
	@Override
	public List<Activity> hostActivityList(Activity activity) {
//		System.out.println("서비스단  : " +  aDao.hostActivityList(activity));
		return aDao.hostActivityList(activity);
	}
	@Override
	public List<Activity> hostActivityList2(String hId) {
		return aDao.hostActivityList2(hId);
	}
	@Override
	public List<ActEventDate> hostActivityDateList(int actId) {
		return aeDao.hostActivityDateList(actId);
	}
	@Override
	public List<ActivityReserve> hostActivityReserveList(ActivityReserve activityReserve) {
		return arDao.hostActivityReserveList(activityReserve);
	}
	@Override
	public int hostActivityCheck(int arId) {
		return arDao.hostActivityCheck(arId);
	}
	@Override
	public List<ActEventDate> hostActivityCheckList(ActEventDate actEventDate) {
		return aeDao.hostActivityCheckList(actEventDate);
	}	
	@Override
	public int hostActivityReserve(ActivityReserve activityReserve) {
		return arDao.hostActivityReserve(activityReserve);
	}
	@Override
	public List<ActivityCategory> activityCategoryList(ActivityCategory aCategory) {
		return acDao.activityCategoryList(aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory2List(ActivityCategory aCategory) {
		return acDao.activityCategory2List(aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory3List(ActivityCategory aCategory) {
		return acDao.activityCategory3List(aCategory);
	}
	@Override
	public List<ActivityCategory> activityCategory4List(ActivityCategory aCategory) {
		return acDao.activityCategory4List(aCategory);
	}
	@Override
	public int activityCategoryCheck(ActivityCategory aCategory) {
		return acDao.activityCategoryCheck(aCategory);
	}
	@Override
	public Activity getActivity(Activity activity) {
		return aDao.getActivity(activity);
	}
	@Override
	public int activityModify(Activity activity) {
		return aDao.activityModify(activity);
	}
	@Override
	public int activityDelete(Activity activity) {
		return aDao.activityDelete(activity);
	}
	@Override
	public int activityCnt(Activity activity) {
		return aDao.activityCnt(activity);
	}
	@Override
	public List<Activity> activityAllList(Activity activity) {
		return aDao.activityAllList(activity);
	}
	@Override
	public List<Activity> activityAsCateList(Activity activity) {
		return aDao.activityAsCateList(activity);
	}
	@Override
	public List<Activity> activityBestHostList(Activity activity) {
		return aDao.activityBestHostList(activity);
	}
	@Override
	public List<Activity> activityLikeBestList(Activity activity) {
		return aDao.activityLikeBestList(activity);
	}
	@Override
	public List<Activity> activityNewList(Activity activity) {
		return aDao.activityNewList(activity);
	}
	@Override
	public List<Activity> activityBestCateList(Activity activity) {
		return aDao.activityBestCateList(activity);
	}
	@Override
	public int activityBestCateCnt(Activity activity) {
		return aDao.activityBestCateCnt(activity);
	}
	@Override
	public Activity activityDetail(Activity activity) {
		return aDao.activityDetail(activity);
	}
	@Override
	public List<Activity> activityByCateList(Activity activity) {
		return aDao.activityByCateList(activity);
	}
	@Override
	public int memberLikeActivity(LikeActivity likeActivity) {
		return laDao.memberLikeActivity(likeActivity);
	}
	@Override
	public int memberLikeActivityCnt(LikeActivity likeActivity) {
		return laDao.memberLikeActivityCnt(likeActivity);
	}
	@Override
	public List<LikeActivity> memberLikeActivityList(LikeActivity likeActivity) {
		return laDao.memberLikeActivityList(likeActivity);
	}
	@Override
	public int activityLikeMemberCnt(LikeActivity likeActivity) {
		return laDao.activityLikeMemberCnt(likeActivity);
	}
	@Override
	public List<LikeActivity> activityLikeMemberList(LikeActivity likeActivity) {
		return laDao.activityLikeMemberList(likeActivity);
	}
	@Override
	public int memberLikeActivityCheck(LikeActivity likeActivity) {
		return laDao.memberLikeActivityCheck(likeActivity);
	}
	@Override
	public int memberLikeActivityDelete(LikeActivity likeActivity) {
		return laDao.memberLikeActivityDelete(likeActivity);
	}
	@Override
	public List<ActivityCategory> allCateList(ActivityCategory aCategory) {
		return acDao.allCateList(aCategory);
	}
	@Override
	public List<Activity> memberCustomizedActList(String mId) {
		return aDao.memberCustomizedActList(mId);
	}
	@Override
	public List<Activity> memberCustomizedActListAll(Activity activity) {
		return aDao.memberCustomizedActListAll(activity);
	}
	@Override
	public List<Activity> activitySameCate3List(int actId) {
		return aDao.activitySameCate3List(actId);
	}
	@Override
	public int memberCustomizedActListAllCnt(String mId) {
		return aDao.memberCustomizedActListAllCnt(mId);
	}
	@Override
	public int hostActivityCheckTotal(ActEventDate actEventDate) {
		return aeDao.hostActivityCheckTotal(actEventDate);
	}
	@Override
	public int hostActivityReserveCnt(ActEventDate actEventDate) {
		return aeDao.hostActivityReserveCnt(actEventDate);
	}
	@Override
	public int getActivityDateCnt(ActEventDate actEventDate) {
		return aeDao.getActivityDateCnt(actEventDate);
	}
	@Override
	public int activityDateModify(ActEventDate actEventDate) {
		return aeDao.activityDateModify(actEventDate);
	}
	@Override
	public int activityDateDelete(ActEventDate actEventDate) {
		return aeDao.activityDateDelete(actEventDate);
	}
	@Override
	public List<ActEventDate> getActivityDate(int actId) {
		return aeDao.getActivityDate(actId);
	}
	@Override
	public ActEventDate getActDate(ActEventDate actEventDate) {
		return aeDao.getActDate(actEventDate);
	}
	@Override
	public int hostActivityTotal(Activity activity) {
		return aDao.hostActivityTotal(activity);
	}
	@Override
	public List<ActivityReserve> myActivityList(ActivityReserve activityReserve) {
		return arDao.myActivityList(activityReserve);
	}
	@Override
	public int myActivityReserveCnt(ActivityReserve activityReserve) {
		return arDao.myActivityReserveCnt(activityReserve);
	}
	@Override
	public int whenMemberActLike(int actId) {
		return laDao.whenMemberActLike(actId);
	}
	@Override
	public int whenMemberActDislike(int actId) {
		return laDao.whenMemberActDislike(actId);
	}
	@Override
	public int activityReviewGrade(Activity activity) {
		return aDao.activityReviewGrade(activity);
	}
}
