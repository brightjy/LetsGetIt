package com.tj.pj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.pj.dao.CouponDao;
import com.tj.pj.dao.MemberCouponDao;
import com.tj.pj.dto.Coupon;
import com.tj.pj.dto.MemberCoupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao cDao;
	@Autowired
	private MemberCouponDao mcDao;
	@Override
	public List<Coupon> couponAllList(Coupon coupon) {
		return cDao.couponAllList(coupon);
	}

	@Override
	public int couponWrite(Coupon coupon) {
		return cDao.couponWrite(coupon);
	}

	@Override
	public int couponPayments(MemberCoupon memberCoupon) {
		return mcDao.couponPayments(memberCoupon);
	}

	@Override
	public List<MemberCoupon> couponList(MemberCoupon memberCoupon) {
		return mcDao.couponList(memberCoupon);
	}

	@Override
	public int couponModify(Coupon coupon) {
		return cDao.couponModify(coupon);
	}

	@Override
	public int couponDelete(Coupon coupon) {
		return cDao.couponDelete(coupon);
	}

	@Override
	public int couponTotCnt() {
		return cDao.couponTotCnt();
	}

	@Override
	public int memberCouponTotCnt() {
		return mcDao.memberCouponTotCnt();
	}

	@Override
	public Coupon getCoupon(Coupon coupon) {
		return cDao.getCoupon(coupon);
	}

	@Override
	public MemberCoupon getMemberCoupon(MemberCoupon memberCoupon) {
		return mcDao.getMemberCoupon(memberCoupon);
	}

	@Override
	public int autoCouponPayments() {
		return mcDao.autoCouponPayments();
	}

	@Override
	public int getMemberCouponCnt(MemberCoupon memberCoupon) {
		return mcDao.getMemberCouponCnt(memberCoupon);
	}

	@Override
	public int myCouponCnt(MemberCoupon memberCoupon) {
		return mcDao.myCouponCnt(memberCoupon);
	}

	@Override
	public int myCouponDelete(MemberCoupon memberCoupon) {
		return mcDao.myCouponDelete(memberCoupon);
	}

}
