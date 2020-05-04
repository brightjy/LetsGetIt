package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Cart;

public interface CartDao {
	public int addCart(Cart cart);
	public List<Cart> listCart(String mId);
	public int deleteCart(int cId);
	public int modifyCart(Cart cart);
	public int sumMoney(String mId);
	public int countCart(int actId, String mId);
	public int updateCart(Cart cart);
}
