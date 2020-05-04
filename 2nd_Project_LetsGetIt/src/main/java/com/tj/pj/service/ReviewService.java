package com.tj.pj.service;

import java.util.List;

import com.tj.pj.dto.Review;
import com.tj.pj.dto.ReviewLike;

public interface ReviewService {
	public List<Review> reviewList(Review review);
	public int reviewWrite(Review review);
	public int reviewModify(Review review);
	public int reviewDelete(Review review);
	public int reviewLike(int rId);
	public int reviewStepA(Review review);
	public int reviewReply(Review review);
	public Review LikeReview(int actId);
	public int reviewCnt(int actId);
	public double reviewGrade(int actId);
	public Review getReview(Review review);
	public int reviewUnLike(int rId);
	public ReviewLike reviewLikeCheck(ReviewLike reviewLike);
	public int reviewLikeClickWrite(ReviewLike reviewLike);
	public int reviewLikeClick(ReviewLike reviewLike);
	public ReviewLike likeReviewCheck(ReviewLike reviewLike);
	public List<ReviewLike> reviewListLikeCheck(ReviewLike reviewLike);
	public List<Review> myReviewList(Review review);
	public int myReviewCnt(Review review);
}
