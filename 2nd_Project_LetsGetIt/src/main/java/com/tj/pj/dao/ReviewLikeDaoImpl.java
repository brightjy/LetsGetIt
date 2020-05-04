package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.ReviewLike;

@Repository
public class ReviewLikeDaoImpl implements ReviewLikeDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public ReviewLike reviewLikeCheck(ReviewLike reviewLike) {
		return sessionTemplate.selectOne("reviewLikeCheck", reviewLike);
	}

	@Override
	public int reviewLikeClickWrite(ReviewLike reviewLike) {
		return sessionTemplate.insert("reviewLikeClickWrite", reviewLike);
	}

	@Override
	public int reviewLikeClick(ReviewLike reviewLike) {
		return sessionTemplate.update("reviewLikeClick", reviewLike);
	}

	@Override
	public ReviewLike likeReviewCheck(ReviewLike reviewLike) {
		return sessionTemplate.selectOne("likeReviewCheck", reviewLike);
	}

	@Override
	public List<ReviewLike> reviewListLikeCheck(ReviewLike reviewLike) {
		return sessionTemplate.selectList("reviewListLikeCheck", reviewLike);
	}

}
