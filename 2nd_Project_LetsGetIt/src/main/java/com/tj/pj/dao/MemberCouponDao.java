package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.MemberCoupon;

public interface MemberCouponDao {
	public int couponPayments(MemberCoupon memberCoupon);
	public List<MemberCoupon> couponList(MemberCoupon memberCoupon);
	public int memberCouponTotCnt();
	public MemberCoupon getMemberCoupon(MemberCoupon memberCoupon);
	public int autoCouponPayments();
	public int getMemberCouponCnt(MemberCoupon memberCoupon);
	public int myCouponCnt(MemberCoupon memberCoupon);
	public int myCouponDelete(MemberCoupon memberCoupon);
}
