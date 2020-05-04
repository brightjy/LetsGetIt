package com.tj.pj.dto;

public class LikeHost {
	// 테이블 : LikeHost
	private int lhId;
	// 테이블 : Member 에서 필요정보
	private String mId;
	private String mName;
	private String mPhone;
	private String mEmail;
	// 테이블 : Host 에서 필요정보
	private String hId;
	private String hName;
	private String hPhone;
	private String hEmail;
	private String hPhoto;
	// 페이징
	private int startRow;
	private int endRow;
		
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethPhone() {
		return hPhone;
	}
	public void sethPhone(String hPhone) {
		this.hPhone = hPhone;
	}
	public String gethEmail() {
		return hEmail;
	}
	public void sethEmail(String hEmail) {
		this.hEmail = hEmail;
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
	public int getLhId() {
		return lhId;
	}
	public void setLhId(int lhId) {
		this.lhId = lhId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public String gethPhoto() {
		return hPhoto;
	}
	public void sethPhoto(String hPhoto) {
		this.hPhoto = hPhoto;
	}
	@Override
	public String toString() {
		return "LikeHost [lhId=" + lhId + ", mId=" + mId + ", mName=" + mName + ", mPhone=" + mPhone + ", mEmail="
				+ mEmail + ", hId=" + hId + ", hName=" + hName + ", hPhone=" + hPhone + ", hEmail=" + hEmail
				+ ", hPhoto=" + hPhoto + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
	
	
	
	
}
