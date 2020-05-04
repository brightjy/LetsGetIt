package com.tj.pj.dto;

import java.sql.Timestamp;

public class ActEventDate {
	private int 	  eNo;			// 순차번호
	private Timestamp actStartdate;	// 액티비티 시작 날짜
	private Timestamp actEnddate;	// 액티비티 종료 날짜
	private String 	  hId;			// 호스트 아이디
	private int 	  actId;		// 액티비티 아이디
	private String	  actName;		// 액티비티 이름
	private String	  actImg;		// 액티비티 이미지
	private int 	actPrice;
	private int		  startRow;
	private int		  endRow;
	private int		  MAX_QTY;
	
	public int getMAX_QTY() {
		return MAX_QTY;
	}
	public void setMAX_QTY(int mAX_QTY) {
		MAX_QTY = mAX_QTY;
	}
	public int getActPrice() {
		return actPrice;
	}
	public void setActPrice(int actPrice) {
		this.actPrice = actPrice;
	}
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public int getActId() {
		return actId;
	}
	public void setActId(int actId) {
		this.actId = actId;
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
	
	@Override
	public String toString() {
		return "ActEventDate [eNo=" + eNo + ", actStartdate=" + actStartdate + ", actEnddate=" + actEnddate + ", hId="
				+ hId + ", actId=" + actId + ", actName=" + actName + ", actImg=" + actImg + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
}
