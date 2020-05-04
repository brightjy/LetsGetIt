package com.tj.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.pj.dto.Cart;
@Repository
public class CartImpl implements CartDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int addCart(Cart cart) {
		
		return sessionTemplate.insert("addCart",cart);
	}
	@Override
	public List<Cart> listCart(String mId) {
		
		return sessionTemplate.selectList("listCart",mId);
	}
	@Override
	public int deleteCart(int cId) {
		
		return sessionTemplate.delete("deleteCart",cId);
	}
	@Override
	public int modifyCart(Cart cart) {
		
		return sessionTemplate.update("modifyCart",cart);
	}
	@Override
	public int sumMoney(String mId) {
		
		return sessionTemplate.selectOne("sumMoney",mId);
	}
	@Override
	public int countCart(int actId, String mId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("actId",actId);
		map.put("mId",mId);
		return sessionTemplate.selectOne("cart.countCart",map);
	}
	@Override
	public int updateCart(Cart cart) {
		
		return sessionTemplate.update("updateCart",cart);
	}

}
