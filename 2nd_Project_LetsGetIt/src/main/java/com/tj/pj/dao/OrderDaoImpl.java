package com.tj.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Orders;
@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int addOrder(Orders order) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("addOrder",order);
	}

	@Override
	public List<Orders> listOrder(Orders order) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("listOrder",order);
	}

	@Override
	public int deleteOrder(int oNo) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteOrder",oNo);
	}

	@Override
	public int modifyOrder(Orders order) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyOrder",order);
	}

	@Override
	public int sumMoney(int oNo) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("sumMoney",oNo);
	}

	@Override
	public int countOrder(int actId, String mId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("actId",actId);
		map.put("mId",mId);
		return sessionTemplate.selectOne("order.countOrder",map);
	}

	@Override
	public int updateOrder(Orders order) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("updateOrder",order);
	}

	@Override
	public int AllsumMoney(String mId) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("AllsumMoney",mId);
	}

	@Override
	public int modifyOrderType(String mId) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("modifyOrderType",mId);
	}

	/*
	 * @Override public List<Orders> ordersCheckList(Orders orders) { return
	 * sessionTemplate.selectList("ordersCheckList", orders); }
	 */
}
