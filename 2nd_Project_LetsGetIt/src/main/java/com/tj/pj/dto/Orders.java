package com.tj.pj.dto;

import java.sql.Timestamp;

public class Orders {
	private int oNo;
	private int oPrice;
	private int oQty;
	private String mId;
	private int actId;
	private String actImg;
	private String actName;
	private int summoney;
	private String oType;
	private int eNo;
	private int arCHECK;
	private Timestamp actStartdate;	// 액티비티 시작 날짜
	private Timestamp actEnddate;
	private int startRow;
	private int endRow;
	public int geteNo() {
		return eNo;
	}
	public int getArCHECK() {
		return arCHECK;
	}
	public void setArCHECK(int arCHECK) {
		this.arCHECK = arCHECK;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public Timestamp getActStartdate() {
		return actStartdate;
	}
	public void setActStartdate(Timestamp actStartdate) {
		this.actStartdate = actStartdate;
	}
	public Timestamp getActEnddate() {
		return actEnddate;
	}
	public void setActEnddate(Timestamp actEnddate) {
		this.actEnddate = actEnddate;
	}
	public String getoType() {
		return oType;
	}
	public void setoType(String oType) {
		this.oType = oType;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public int getoQty() {
		return oQty;
	}
	public void setoQty(int oQty) {
		this.oQty = oQty;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getActId() {
		return actId;
	}
	public void setActId(int actId) {
		this.actId = actId;
	}
	public String getActImg() {
		return actImg;
	}
	public void setActImg(String actImg) {
		this.actImg = actImg;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
	}
	public int getSummoney() {
		return summoney;
	}
	public void setSummoney(int summoney) {
		this.summoney = summoney;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
