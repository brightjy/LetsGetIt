package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.MemberCoupon;

@Repository
public class MemberCouponDaoImpl implements MemberCouponDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int couponPayments(MemberCoupon memberCoupon) {
		return sessionTemplate.insert("couponPayments", memberCoupon);
	}

	@Override
	public List<MemberCoupon> couponList(MemberCoupon memberCoupon) {
		return sessionTemplate.selectList("couponList", memberCoupon);
	}

	@Override
	public int memberCouponTotCnt() {
		return sessionTemplate.selectOne("memberCouponTotCnt");
	}

	@Override
	public MemberCoupon getMemberCoupon(MemberCoupon memberCoupon) {
		return sessionTemplate.selectOne("getMemberCoupon", memberCoupon);
	}

	@Override
	public int autoCouponPayments() {
		return sessionTemplate.insert("autoCouponPayments");
	}

	@Override
	public int getMemberCouponCnt(MemberCoupon memberCoupon) {
		return sessionTemplate.selectOne("getMemberCouponCnt", memberCoupon);
	}

	@Override
	public int myCouponCnt(MemberCoupon memberCoupon) {
		return sessionTemplate.selectOne("myCouponCnt", memberCoupon);
	}

	@Override
	public int myCouponDelete(MemberCoupon memberCoupon) {
		return sessionTemplate.delete("myCouponDelete", memberCoupon);
	}

}
