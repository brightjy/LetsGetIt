package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.ReviewLike;

public interface ReviewLikeDao {
	public ReviewLike reviewLikeCheck(ReviewLike reviewLike);
	public int reviewLikeClickWrite(ReviewLike reviewLike);
	public int reviewLikeClick(ReviewLike reviewLike);
	public ReviewLike likeReviewCheck(ReviewLike reviewLike);
	public List<ReviewLike> reviewListLikeCheck(ReviewLike reviewLike);
}
