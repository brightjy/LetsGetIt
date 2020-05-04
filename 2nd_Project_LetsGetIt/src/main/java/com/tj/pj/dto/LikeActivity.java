package com.tj.pj.dto;

import java.sql.Date;

public class LikeActivity {
	// LikeActivity 테이블
	private int laId;
	private String mId;
	private int actId;
	private Date laRdate;
	
	private String tempActCno;
	
	// Member 테이블 필요정보
	private String mName;
	private String mEmail;
	private String mPhone;
	
	// Activity 테이블 필요정보
	private String actName;
	private String actImg;
	private int actPrice;
	private int actDiscount;
	private String hId;
	
	// 페이징 시 필요
	private int startRow;
	private int endRow;
	
	public int getLaId() {
		return laId;
	}
	public void setLaId(int laId) {
		this.laId = laId;
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
	public Date getLaRdate() {
		return laRdate;
	}
	public void setLaRdate(Date laRdate) {
		this.laRdate = laRdate;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
	}
	public String getActImg() {
		return actImg;
	}
	public void setActImg(String actImg) {
		this.actImg = actImg;
	}
	public int getActPrice() {
		return actPrice;
	}
	public void setActPrice(int actPrice) {
		this.actPrice = actPrice;
	}
	public int getActDiscount() {
		return actDiscount;
	}
	public void setActDiscount(int actDiscount) {
		this.actDiscount = actDiscount;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
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
	public String getTempActCno() {
		return tempActCno;
	}
	public void setTempActCno(String tempActCno) {
		this.tempActCno = tempActCno;
	}
	@Override
	public String toString() {
		return "LikeActivity [laId=" + laId + ", mId=" + mId + ", actId=" + actId + ", laRdate=" + laRdate
				+ ", tempActCno=" + tempActCno + ", mName=" + mName + ", mEmail=" + mEmail + ", mPhone=" + mPhone
				+ ", actName=" + actName + ", actImg=" + actImg + ", actPrice=" + actPrice + ", actDiscount="
				+ actDiscount + ", hId=" + hId + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	
	

}
