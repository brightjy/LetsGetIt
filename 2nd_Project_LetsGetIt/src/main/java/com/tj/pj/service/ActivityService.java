package com.tj.pj.service;

import java.util.List;

import com.tj.pj.dto.ActEventDate;
import com.tj.pj.dto.Activity;
import com.tj.pj.dto.ActivityCategory;
import com.tj.pj.dto.ActivityReserve;
import com.tj.pj.dto.LikeActivity;

public interface ActivityService {
	public int activityWrite(Activity activity);
	public int activityDate(ActEventDate actEventDate);
	public List<Activity> hostActivityList(Activity activity);
	public List<Activity> hostActivityList2(String hId);
	public List<ActEventDate> hostActivityDateList(int actId);
	public List<ActivityReserve> hostActivityReserveList(ActivityReserve activityReserve);
	public int hostActivityCheck(int arId);
	public List<ActEventDate> hostActivityCheckList(ActEventDate actEventDate);
	public int hostActivityReserve(ActivityReserve activityReserve);
	public List<ActivityCategory> activityCategoryList(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory2List(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory3List(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory4List(ActivityCategory aCategory);
	public int activityCategoryCheck(ActivityCategory aCategory);
	public int activityModify(Activity activity);
	public int activityDelete(Activity activity);
	public Activity getActivity(Activity activity);
	public int activityDateModify(ActEventDate actEventDate);
	public int activityDateDelete(ActEventDate actEventDate);
	public List<ActEventDate> getActivityDate(int actId);
	public ActEventDate getActDate(ActEventDate actEventDate);
	public int hostActivityTotal(Activity activity);
	public int hostActivityCheckTotal(ActEventDate actEventDate);
	public int hostActivityReserveCnt(ActEventDate actEventDate);
	public int getActivityDateCnt(ActEventDate actEventDate);
	public int activityCnt(Activity activity); // 액티비티 개수
	public int activityBestCateCnt(Activity activity); // 카테고리 별 액티비티 개수
	public List<Activity> activityAllList(Activity activity); // 전체리스트(검색용)
	public List<Activity> activityAsCateList(Activity activity); // 카테고리별 리스트
	public List<Activity> activityBestHostList(Activity activity); // 좋아요가 많은 호스트 순
	public List<Activity> activityLikeBestList(Activity activity); // 좋아요가 많은 액티비티 순
	public List<Activity> activityNewList(Activity activity); // 최신순
	public List<Activity> activityBestCateList(Activity activity); // 베스트 카테고리 리스트
	public Activity activityDetail(Activity activity); // 액티비티 상세보기
	public List<Activity> activityByCateList(Activity activity);// 카테고리 번호로 액티비티 가져오기
	public int memberLikeActivity(LikeActivity likeActivity); //멤버가 액티비티 좋아하기
	public int memberLikeActivityCnt(LikeActivity likeActivity); //멤버가 좋아한 총 액티비티 개수
	public List<LikeActivity> memberLikeActivityList(LikeActivity likeActivity); //멤버가 좋아한 액티비티 리스트(+페이징)
	public int memberLikeActivityCheck(LikeActivity likeActivity); // 멤버가 이 액티비티를 이미 좋아했는가??? 체크용
	public int activityLikeMemberCnt(LikeActivity likeActivity); //이 액티비티를 좋아하는 멤버 명 수
	public List<LikeActivity> activityLikeMemberList(LikeActivity likeActivity); //이 액티비티를 좋아하는 멤버 리스트(페이징)
	public int memberLikeActivityDelete(LikeActivity likeActivity); // 멤버가 액티비티 좋아하기 취소
	public List<ActivityCategory> allCateList(ActivityCategory aCategory); // 액티비티 카테고리 전체 가져오기
	public List<Activity> memberCustomizedActList(String mId);// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기
	public List<Activity> memberCustomizedActListAll(Activity activity);// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기(페이징ver)
	public int memberCustomizedActListAllCnt(String mId);// 멤버의 관심 카테고리에 맞는 액티비티 개수
	public List<Activity> activitySameCate3List(int actId); //category3이 같은 액티비티 불러오기(상세보기 하단에 뿌릴용)
	public List<ActivityReserve> myActivityList(ActivityReserve activityReserve); // 자신이 예약한 액티비티 리스트 보기
	public int myActivityReserveCnt(ActivityReserve activityReserve);	// 자신이 예약한 액티비티 개수
	public int whenMemberActLike(int actId); // 멤버가 액티비티 좋아하면, 액티비티 테이블에도 actLike+1
	public int whenMemberActDislike(int actId); // 멤버가 액티비티 좋아한거 취소하면 , 액티비티 테이블에도 actLike-1
	public int activityReviewGrade(Activity activity);


}