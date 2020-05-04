package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.ActivityReserve;

public interface ActivityReserveDao {
	public List<ActivityReserve> hostActivityReserveList(ActivityReserve activityReserve);
	public int hostActivityCheck(int arId);
	public int hostActivityReserve(ActivityReserve activityReserve);
	public List<ActivityReserve> myActivityList(ActivityReserve activityReserve);
	public int myActivityReserveCnt(ActivityReserve activityReserve);
}
