package com.tj.pj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.pj.dao.OrderDao;
import com.tj.pj.dto.Orders;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	@Override
	public int addOrder(Orders order) {
	
		return orderDao.addOrder(order);
	}

	@Override
	public List<Orders> listOrder(Orders order) {
		
		return orderDao.listOrder(order);
	}

	@Override
	public int deleteOrder(int oNo) {
		
		return orderDao.deleteOrder(oNo);
	}

	@Override
	public int modifyOrder(Orders order) {
		
		return orderDao.modifyOrder(order);
	}

	@Override
	public int sumMoney(int oNo) {
		
		return orderDao.sumMoney(oNo);
	}

	@Override
	public int countOrder(int actId, String mId) {
		
		return orderDao.countOrder(actId, mId);
	}

	@Override
	public int updateOrder(Orders order) {
		
		return orderDao.updateOrder(order);
	}

	@Override
	public int AllsumMoney(String mId) {
		
		return orderDao.AllsumMoney(mId);
	}

	@Override
	public int modifyOrderType(String mId) {
		// TODO Auto-generated method stub
		return orderDao.modifyOrderType(mId);
	}

	/*
	 * @Override public List<Orders> ordersCheckList(Orders orders) { return
	 * orderDao.ordersCheckList(orders); }
	 */
}
