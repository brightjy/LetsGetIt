package com.tj.pj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.pj.dao.CartDao;
import com.tj.pj.dto.Cart;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao ;
	@Override
	public int addCart(Cart cart) {
		
		return cartDao.addCart(cart);
	}
	@Override
	public List<Cart> listCart(String mId) {
		
		return cartDao.listCart(mId);
	}
	@Override
	public int deleteCart(int cId) {
		
		return cartDao.deleteCart(cId);
	}
	@Override
	public int modifyCart(Cart cart) {
		
		return cartDao.modifyCart(cart);
	}
	@Override
	public int sumMoney(String mId) {
		
		return cartDao.sumMoney(mId);
	}
	@Override
	public int countCart(int actId, String mId) {
		
		return cartDao.countCart(actId, mId);
	}
	@Override
	public int updateCart(Cart cart) {
		
		return cartDao.updateCart(cart);
	}

}
