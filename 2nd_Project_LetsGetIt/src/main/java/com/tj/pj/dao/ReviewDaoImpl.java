package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<Review> reviewList(Review review) {
		return sessionTemplate.selectList("reviewList", review);
	}

	@Override
	public int reviewWrite(Review review) {
		return sessionTemplate.insert("reviewWrite", review);
	}

	@Override
	public int reviewModify(Review review) {
		return sessionTemplate.update("reviewModify", review);
	}

	@Override
	public int reviewDelete(Review review) {
		return sessionTemplate.delete("reviewDelete", review);
	}

	@Override
	public int reviewLike(int rId) {
		return sessionTemplate.update("reviewLike", rId);
	}

	@Override
	public int reviewStepA(Review review) {
		return sessionTemplate.update("reviewStepA", review);
	}

	@Override
	public int reviewReply(Review review) {
		return sessionTemplate.insert("reviewReply", review);
	}

	@Override
	public Review LikeReview(int actId) {
		return sessionTemplate.selectOne("LikeReview", actId);
	}

	@Override
	public int reviewCnt(int actId) {
		return sessionTemplate.selectOne("reviewCnt", actId);
	}

	@Override
	public double reviewGrade(int actId) {
		return sessionTemplate.selectOne("reviewGrade", actId);
	}

	@Override
	public Review getReview(Review review) {
		return sessionTemplate.selectOne("getReview", review);
	}

	@Override
	public int reviewUnLike(int rId) {
		return sessionTemplate.update("reviewUnLike", rId);
	}

	@Override
	public List<Review> myReviewList(Review review) {
		return sessionTemplate.selectList("myReviewList", review);
	}

	@Override
	public int myReviewCnt(Review review) {
		return sessionTemplate.selectOne("myReviewCnt", review);
	}

}
