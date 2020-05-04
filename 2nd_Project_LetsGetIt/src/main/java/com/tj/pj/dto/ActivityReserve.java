package com.tj.pj.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ActivityReserve {
	private int       arId;			// 순차번호
	private String    hId;			// 호스트 아이디
	private String    mId;			// 멤버 아이디
	private int       actId;		// 액티비티 아이디
	private int       eNo;			// 액티비티 일정 순차번호
	private int       arCheck;		// 출석체크
	private Date   	  arRdate;		// 액티비티 예약 날짜
	private Timestamp arCheckDate;  // 액티비티 출석체크 날짜
	private String 	  mName;		// 멤버 이름
	private String 	  mPhone;		// 멤버 연락처
	private Date   	  mBirth;		// 멤버 생일
	private String    actName;		// 액티비티 이름
	private String	  actImg;		// 액티비티 대표이미지
	private Timestamp actStartdate; // 액티비티 시작 날짜
	private Timestamp actEnddate;	// 액티비티 종료 날짜
	private int    	  startRow;
	private int       endRow;
	
	public int getArId() {
		return arId;
	}
	public void setArId(int arId) {
		this.arId = arId;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
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
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public int getArCheck() {
		return arCheck;
	}
	public void setArCheck(int arCheck) {
		this.arCheck = arCheck;
	}
	public Date getArRdate() {
		return arRdate;
	}
	public void setArRdate(Date arRdate) {
		this.arRdate = arRdate;
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
	public Date getmBirth() {
		return mBirth;
	}
	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}
	public Timestamp getArCheckDate() {
		return arCheckDate;
	}
	public void setArCheckDate(Timestamp arCheckDate) {
		this.arCheckDate = arCheckDate;
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
	
	@Override
	public String toString() {
		return "ActivityReserve [arId=" + arId + ", hId=" + hId + ", mId=" + mId + ", actId=" + actId + ", eNo=" + eNo
				+ ", arCheck=" + arCheck + ", arRdate=" + arRdate + ", arCheckDate=" + arCheckDate + ", mName=" + mName
				+ ", mPhone=" + mPhone + ", mBirth=" + mBirth + ", actName=" + actName + ", actImg=" + actImg
				+ ", actStartdate=" + actStartdate + ", actEnddate=" + actEnddate + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
}
