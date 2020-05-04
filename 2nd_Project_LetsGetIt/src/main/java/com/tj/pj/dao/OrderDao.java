package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Orders;

public interface OrderDao {
	public int addOrder(Orders order);
	public List<Orders> listOrder(Orders order);
	public int deleteOrder(int oNo);
	public int modifyOrder(Orders order);
	public int sumMoney(int oNo);
	public int countOrder(int actId, String mId);
	public int updateOrder(Orders order);
	public int AllsumMoney(String mId);
	public int modifyOrderType(String mId);
//	public List<Orders> ordersCheckList(Orders orders);
}
