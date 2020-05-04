package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Review;

public interface ReviewDao {
	public List<Review> reviewList(Review review);
	public int reviewWrite(Review review);
	public int reviewModify(Review review);
	public int reviewDelete(Review review);
	public int reviewLike(int rId);
	public int reviewUnLike(int rId);
	public int reviewStepA(Review review);
	public int reviewReply(Review review);
	public Review LikeReview(int actId);
	public int reviewCnt(int actId);
	public double reviewGrade(int actId);
	public Review getReview(Review review);
	public List<Review> myReviewList(Review review);
	public int myReviewCnt(Review review);
}
