package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.LikeActivity;

@Repository
public class LikeActivityDaoImpl implements LikeActivityDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int memberLikeActivity(LikeActivity likeActivity) {
		return sessionTemplate.insert("memberLikeActivity", likeActivity);
	}

	@Override
	public int memberLikeActivityCnt(LikeActivity likeActivity) {
		return sessionTemplate.selectOne("memberLikeActivityCnt", likeActivity);
	}

	@Override
	public List<LikeActivity> memberLikeActivityList(LikeActivity likeActivity) {
		return sessionTemplate.selectList("memberLikeActivityList", likeActivity);
	}

	@Override
	public int activityLikeMemberCnt(LikeActivity likeActivity) {
		return sessionTemplate.selectOne("activityLikeMemberCnt", likeActivity );
	}

	@Override
	public List<LikeActivity> activityLikeMemberList(LikeActivity likeActivity) {
		return sessionTemplate.selectList("activityLikeMemberList", likeActivity);
	}

	@Override
	public int memberLikeActivityCheck(LikeActivity likeActivity) {
		return sessionTemplate.selectOne("memberLikeActivityCheck", likeActivity);
	}

	@Override
	public int memberLikeActivityDelete(LikeActivity likeActivity) {
		return sessionTemplate.delete("memberLikeActivityDelete", likeActivity);
	}

	@Override
	public int whenMemberActLike(int actId) {
		return sessionTemplate.update("whenMemberActLike", actId);
	}

	@Override
	public int whenMemberActDislike(int actId) {
		return sessionTemplate.update("whenMemberActDislike", actId);
	}

}
