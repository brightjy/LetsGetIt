package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.LikeCategory;

@Repository
public class LikeCategoryDaoImpl implements LikeCategoryDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int memberLikeCateCheck(LikeCategory likeCategory) {
		return sessionTemplate.selectOne("memberLikeCateCheck", likeCategory);
	}
	
	@Override
	public int memberLikeActCate(LikeCategory likeCategory) {
		return sessionTemplate.insert("memberLikeActCate", likeCategory);
	}

	@Override
	public int memberDeleteLikeActCate(LikeCategory likeCategory) {
		return sessionTemplate.delete("memberDeleteLikeActCate", likeCategory);
	}
	
	@Override
	public List<LikeCategory> memberLikeActCateList(LikeCategory likeCategory) {
		return sessionTemplate.selectList("memberLikeActCateList", likeCategory);
	}

	@Override
	public List<LikeCategory> memberLikeCateWithCommaList(String mId) {
		return sessionTemplate.selectList("memberLikeCateWithCommaList", mId);
	}



}
