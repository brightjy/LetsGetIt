package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.LikeHost;
@Repository
public class LikeHostDaoImpl implements LikeHostDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int memberLikeHost(LikeHost likeHost) {
		return sessionTemplate.insert("memberLikeHost", likeHost);
	}

	@Override
	public int hostLikeMemberCnt(LikeHost likeHost) {
		return sessionTemplate.selectOne("hostLikeMemberCnt", likeHost);
	}

	@Override
	public List<LikeHost> memberLikeHostList(LikeHost likeHost) {
		return sessionTemplate.selectList("memberLikeHostList", likeHost);
	}

	@Override
	public int memberLikeHostCheck(LikeHost likeHost) {
		return sessionTemplate.selectOne("memberLikeHostCheck", likeHost);
	}

	@Override
	public int memberLikeHostDelete(LikeHost likeHost) {
		return sessionTemplate.delete("memberLikeHostDelete", likeHost);
	}

	@Override
	public List<LikeHost> hostLikedMemberList(LikeHost likeHost) {
		return sessionTemplate.selectList("hostLikedMemberList", likeHost);
	}

	@Override
	public int memberLikeHostCnt(String mId) {
		return sessionTemplate.selectOne("memberLikeHostCnt", mId);
	}

}
