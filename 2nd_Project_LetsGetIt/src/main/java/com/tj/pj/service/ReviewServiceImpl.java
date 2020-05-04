package com.tj.pj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.pj.dao.ReviewDao;
import com.tj.pj.dao.ReviewLikeDao;
import com.tj.pj.dto.Review;
import com.tj.pj.dto.ReviewLike;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao rDao;
	@Autowired
	private ReviewLikeDao rlDao;
	@Override
	public List<Review> reviewList(Review review) {
		return rDao.reviewList(review);
	}

	@Override
	public int reviewWrite(Review review) {
		return rDao.reviewWrite(review);
	}

	@Override
	public int reviewModify(Review review) {
		return rDao.reviewModify(review);
	}

	@Override
	public int reviewDelete(Review review) {
		return rDao.reviewDelete(review);
	}

	@Override
	public int reviewLike(int rId) {
		return rDao.reviewLike(rId);
	}

	@Override
	public int reviewStepA(Review review) {
		return rDao.reviewStepA(review);
	}

	@Override
	public int reviewReply(Review review) {
		return rDao.reviewReply(review);
	}

	@Override
	public Review LikeReview(int actId) {
		return rDao.LikeReview(actId);
	}

	@Override
	public int reviewCnt(int actId) {
		return rDao.reviewCnt(actId);
	}

	@Override
	public double reviewGrade(int actId) {
		return rDao.reviewGrade(actId);
	}

	@Override
	public Review getReview(Review review) {
		return rDao.getReview(review);
	}

	@Override
	public int reviewUnLike(int rId) {
		return rDao.reviewUnLike(rId);
	}

	@Override
	public ReviewLike reviewLikeCheck(ReviewLike reviewLike) {
		return rlDao.reviewLikeCheck(reviewLike);
	}

	@Override
	public int reviewLikeClickWrite(ReviewLike reviewLike) {
		return rlDao.reviewLikeClickWrite(reviewLike);
	}

	@Override
	public int reviewLikeClick(ReviewLike reviewLike) {
		return rlDao.reviewLikeClick(reviewLike);
	}

	@Override
	public ReviewLike likeReviewCheck(ReviewLike reviewLike) {
		return rlDao.likeReviewCheck(reviewLike);
	}

	@Override
	public List<ReviewLike> reviewListLikeCheck(ReviewLike reviewLike) {
		return rlDao.reviewListLikeCheck(reviewLike);
	}

	@Override
	public List<Review> myReviewList(Review review) {
		return rDao.myReviewList(review);
	}

	@Override
	public int myReviewCnt(Review review) {
		return rDao.myReviewCnt(review);
	}

}
