package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Activity;

public interface ActivityDao {
	public int activityWrite(Activity activity);
	public List<Activity> hostActivityList(Activity activity);
	public List<Activity> hostActivityList2(String hId);
	public int activityModify(Activity activity);
	public int activityDelete(Activity activity);
	public Activity getActivity(Activity activity);
	public int hostActivityTotal(Activity activity);	
	public int activityCnt(Activity activity); // 액티비티 개수
	public int activityBestCateCnt(Activity activity); // 카테고리(카테고리3 기준) 별 액티비티 개수
	public List<Activity> activityAllList(Activity activity); // 전체리스트(검색용)
	public List<Activity> activityAsCateList(Activity activity); // 카테고리별 리스트
	public List<Activity> activityBestHostList(Activity activity); // 좋아요가 많은 호스트 순
	public List<Activity> activityLikeBestList(Activity activity); // 좋아요가 많은 액티비티 순
	public List<Activity> activityNewList(Activity activity); // 최신순 리스트
	public List<Activity> activityBestCateList(Activity activity); // 베스트 카테고리 리스트
	public Activity activityDetail(Activity activity); // 액티비티 상세보기
	public List<Activity> activityByCateList(Activity activity);// 카테고리 번호로 액티비티 가져오기
	public List<Activity> memberCustomizedActList(String mId);// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기
	public List<Activity> memberCustomizedActListAll(Activity activity);// 멤버가 관심 카테고리로 지정한 카테고리 번호로 액티비티 가져오기(페이징ver)
	public List<Activity> activitySameCate3List(int actId); //category3이 같은 액티비티 불러오기(상세보기 하단에 뿌릴용)
	public int memberCustomizedActListAllCnt(String mId);// 멤버의 관심 카테고리에 맞는 액티비티 개수
	public int activityReviewGrade(Activity activity);
}
