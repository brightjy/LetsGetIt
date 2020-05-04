package com.tj.pj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Coupon> couponAllList(Coupon coupon) {
		return sessionTemplate.selectList("couponAllList", coupon);
	}

	@Override
	public int couponWrite(Coupon coupon) {
		return sessionTemplate.insert("couponWrite", coupon);
	}

	@Override
	public int couponModify(Coupon coupon) {
		return sessionTemplate.update("couponModify", coupon);
	}

	@Override
	public int couponDelete(Coupon coupon) {
		return sessionTemplate.delete("couponDelete", coupon);
	}

	@Override
	public int couponTotCnt() {
		return sessionTemplate.selectOne("couponTotCnt");
	}

	@Override
	public Coupon getCoupon(Coupon coupon) {
		return sessionTemplate.selectOne("getCoupon", coupon);
	}

}
