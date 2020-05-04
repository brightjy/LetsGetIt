package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Coupon;

public interface CouponDao {
	public List<Coupon> couponAllList(Coupon coupon);
	public int couponWrite(Coupon coupon);
	public int couponModify(Coupon coupon);
	public int couponDelete(Coupon coupon);
	public int couponTotCnt();
	public Coupon getCoupon(Coupon coupon);
	
}
