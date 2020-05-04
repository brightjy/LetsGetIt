package com.tj.pj.dto;

import java.sql.Date;

public class MemberCoupon {
	private int    mcNo;	// 순차번호
	private String mId;		// 멤버 아이디
	private int    cId;		// 쿠폰 순차번호
	private Date   mcDate;	// 쿠폰 유효기간
	private int	   mcUse;	// 쿠폰 사용여부
	private String mBirth;	// 멤버생일일자
	private String cName;	// 쿠폰 이름
	private int	   startRow;
	private int	   endRow;
	
	public int getMcNo() {
		return mcNo;
	}
	public void setMcNo(int mcNo) {
		this.mcNo = mcNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public Date getMcDate() {
		return mcDate;
	}
	public void setMcDate(Date mcDate) {
		this.mcDate = mcDate;
	}
	public int getMcUse() {
		return mcUse;
	}
	public void setMcUse(int mcUse) {
		this.mcUse = mcUse;
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
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	@Override
	public String toString() {
		return "MemberCoupon [mcNo=" + mcNo + ", mId=" + mId + ", cId=" + cId + ", mcDate=" + mcDate + ", mcUse="
				+ mcUse + ", mBirth=" + mBirth + ", cName=" + cName + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}
	
}
