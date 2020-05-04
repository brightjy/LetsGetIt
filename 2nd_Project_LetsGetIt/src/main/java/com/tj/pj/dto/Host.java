package com.tj.pj.dto;

import java.sql.Date;

public class Host {
	private String hId;
	private String hPw;
	private String hName;
	private String hPhone;
	private String hEmail;
	private String hPhoto;
	private Date hRdate;
	private int hBlack;
	private String hPost;
	private String hAddress;
	private int hCntLike;
	private int startRow;
	private int endRow;
	private String searchText;
	
	
	public String gethPhoto() {
		return hPhoto;
	}
	public void sethPhoto(String hPhoto) {
		this.hPhoto = hPhoto;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
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
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public String gethPw() {
		return hPw;
	}
	public void sethPw(String hPw) {
		this.hPw = hPw;
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
	public Date gethRdate() {
		return hRdate;
	}
	public void sethRdate(Date hRdate) {
		this.hRdate = hRdate;
	}
	public int gethBlack() {
		return hBlack;
	}
	public void sethBlack(int hBlack) {
		this.hBlack = hBlack;
	}
	public String gethPost() {
		return hPost;
	}
	public void sethPost(String hPost) {
		this.hPost = hPost;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public int gethCntLike() {
		return hCntLike;
	}
	public void sethCntLike(int hCntLike) {
		this.hCntLike = hCntLike;
	}
	@Override
	public String toString() {
		return "Host [hId=" + hId + ", hPw=" + hPw + ", hName=" + hName + ", hPhone=" + hPhone + ", hEmail=" + hEmail
				+ ", hPhoto=" + hPhoto + ", hRdate=" + hRdate + ", hBlack=" + hBlack + ", hPost=" + hPost
				+ ", hAddress=" + hAddress + ", hCntLike=" + hCntLike + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", searchText=" + searchText + "]";
	}

	
	
	
	
}
