package com.tj.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tj.pj.service.CouponService;

@Component
public class ScheduledController {
	@Autowired
	private CouponService cService;

	@Scheduled(cron = "0 0 8 * * *")
	public void autoCouponPayments() { // 생일자 자동 쿠폰 지급 ( 매일 오전 08:00 )
		cService.autoCouponPayments();
	}
}
