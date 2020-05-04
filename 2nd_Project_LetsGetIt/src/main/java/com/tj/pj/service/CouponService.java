package com.tj.pj.service;

import java.util.List;

import com.tj.pj.dto.Coupon;
import com.tj.pj.dto.MemberCoupon;

public interface CouponService {
	public List<Coupon> couponAllList(Coupon coupon);
	public int couponWrite(Coupon coupon);
	public int couponPayments(MemberCoupon memberCoupon);
	public List<MemberCoupon> couponList(MemberCoupon memberCoupon);
	public int couponModify(Coupon coupon);
	public int couponDelete(Coupon coupon);
	public int couponTotCnt();
	public int memberCouponTotCnt();
	public Coupon getCoupon(Coupon coupon);
	public MemberCoupon getMemberCoupon(MemberCoupon memberCoupon);
	public int autoCouponPayments();
	public int getMemberCouponCnt(MemberCoupon memberCoupon);
	public int myCouponCnt(MemberCoupon memberCoupon);
	public int myCouponDelete(MemberCoupon memberCoupon);
}
