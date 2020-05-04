package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.LikeCategory;

public interface LikeCategoryDao {
	public int memberLikeCateCheck(LikeCategory likeCategory);
	public int memberLikeActCate(LikeCategory likeCategory);
	public int memberDeleteLikeActCate(LikeCategory likeCategory);
	public List<LikeCategory> memberLikeActCateList(LikeCategory likeCategory);
	public List<LikeCategory> memberLikeCateWithCommaList(String mId);
}
