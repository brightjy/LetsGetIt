package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.ActEventDate;

public interface ActEventDateDao {
	public int activityDate(ActEventDate actEventDate);
	public List<ActEventDate> hostActivityDateList(int actId);
	public int activityDateModify(ActEventDate actEventDate);
	public int activityDateDelete(ActEventDate actEventDate);
	public List<ActEventDate> getActivityDate(int actId);
	public ActEventDate getActDate(ActEventDate actEventDate);
	public List<ActEventDate> hostActivityCheckList(ActEventDate actEventDate);
	public int hostActivityCheckTotal(ActEventDate actEventDate);
	public int hostActivityReserveCnt(ActEventDate actEventDate);
	public int getActivityDateCnt(ActEventDate actEventDate);
}
