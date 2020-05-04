package com.tj.pj.dto;

public class Coupon {
	private int    cId;			// 쿠폰 순차번호
	private String cCode;		// 쿠폰 일련번호
	private String cName;		// 쿠폰 이름
	private int    cDiscount;	// 쿠폰 할인율
	private int	   cDate;		// 쿠폰 유효기간(1: 1개월, 2: 3개월, 3: 6개월, 4: 1년, 5: 무제한(100년))
	private int    startRow;
	private int    endRow;
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcCode() {
		return cCode;
	}
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcDiscount() {
		return cDiscount;
	}
	public void setcDiscount(int cDiscount) {
		this.cDiscount = cDiscount;
	}
	public int getcDate() {
		return cDate;
	}
	public void setcDate(int cDate) {
		this.cDate = cDate;
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
	@Override
	public String toString() {
		return "Coupon [cId=" + cId + ", cCode=" + cCode + ", cName=" + cName + ", cDiscount=" + cDiscount + ", cDate="
				+ cDate + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
}
