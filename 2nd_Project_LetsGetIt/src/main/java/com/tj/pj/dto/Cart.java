package com.tj.pj.dto;

public class Cart {
	private int cId;
	private int cAmount;
	private int actId;
	private String actName;
	private int actPrice;
	private String mId;
	private String mName;
	private int cMoney;
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	public int getActId() {
		return actId;
	}
	public void setActId(int actId) {
		this.actId = actId;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
	}
	public int getActPrice() {
		return actPrice;
	}
	public void setActPrice(int actPrice) {
		this.actPrice = actPrice;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getcMoney() {
		return cMoney;
	}
	public void setcMoney(int cMoney) {
		this.cMoney = cMoney;
	}
}
