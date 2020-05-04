package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.ActivityCategory;

public interface ActivityCategoryDao {
	public List<ActivityCategory> activityCategoryList(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory2List(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory3List(ActivityCategory aCategory);
	public List<ActivityCategory> activityCategory4List(ActivityCategory aCategory);
	public int activityCategoryCheck(ActivityCategory aCategory);
	public List<ActivityCategory> allCateList(ActivityCategory aCategory);
}
