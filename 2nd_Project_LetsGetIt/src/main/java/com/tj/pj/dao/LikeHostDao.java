package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.LikeHost;

public interface LikeHostDao {
	public int memberLikeHost(LikeHost likeHost);
	public int hostLikeMemberCnt(LikeHost likeHost);
	public List<LikeHost> memberLikeHostList(LikeHost likeHost);
	public int memberLikeHostCheck(LikeHost likeHost);
	public int memberLikeHostDelete(LikeHost likeHost);
	public List<LikeHost> hostLikedMemberList(LikeHost likeHost);
	public int memberLikeHostCnt(String mId);
}
