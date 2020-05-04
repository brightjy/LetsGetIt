package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.LikeActivity;

public interface LikeActivityDao {
	public int memberLikeActivity(LikeActivity likeActivity);
	public int memberLikeActivityCnt(LikeActivity likeActivity);
	public List<LikeActivity> memberLikeActivityList(LikeActivity likeActivity);
	public int memberLikeActivityCheck(LikeActivity likeActivity);
	public int activityLikeMemberCnt(LikeActivity likeActivity);
	public List<LikeActivity> activityLikeMemberList(LikeActivity likeActivity);
	public int memberLikeActivityDelete(LikeActivity likeActivity);
	public int whenMemberActLike(int actId);
	public int whenMemberActDislike(int actId);
}
