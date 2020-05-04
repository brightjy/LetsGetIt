package com.tj.pj.dto;

import java.sql.Timestamp;

public class Activity {
	private int    actId;		// 액티비티 아이디
	private String actName;		// 액티비티 이름
	private String actImg;		// 액티비티 대표이미지
	private String actInfo;		// 액티비티 소개글
	private String actAddress1;	// 액티비티 우편번호
	private String actAddress2;	// 액티비티 도로명주소
	private int    actPrice;	// 액티비티 가격
	private double actGrade;	// 액티비티 평점
	private int    actLike;		// 액티비티 좋아요
	private String actInclude;	// 액티비티 포함사항
	private String actExclude;	// 액티비티 불포함사항
	private String actSchedule;	// 액티비티 준비물
	private String actPolicy;	// 액티비티 유의사항
	private String hId;			// 호스트 아이디
	private int    actDiscount;	// 액티비티 할인율
	private int    actCno;		// 액티비티 카테고리
	private int	   actMinMember;// 참여 최소인원
	private int    actMaxMember;// 참여 최대인원
	private String actOption;	// 액티비티 가격옵션
	
	
	// 테이블에는 없지만 추가로 필요한 것들
	private int    startRow;
	private int    endRow;
	private String searchText; // 메인에서 검색할때 사용됨
	private String actCategory; // 액티비티 1차 카테고리 - 조인에서 뿌릴 때 혹시 편하게 쓸 수 있을까 해서 추가를..
	private String actCategory2; // 액티비티 2차 카테고리 - 조인에서 뿌릴 때 혹시 편하게 쓸 수 있을까 해서 추가를..
	private String actCategory3; // 액티비티 3차 카테고리 - 조인에서 뿌릴 때 혹시 편하게 쓸 수 있을까 해서 추가를..
	private String actCategory4; // 액티비티 4차 카테고리 - 조인에서 뿌릴 때 혹시 편하게 쓸 수 있을까 해서 추가를..
	private String actCategory5;
	private Timestamp actEventdate;
	private String hName;
	private String hPhoto;
	private int hCntLike;
	private String mId;
	private int MAX_QTY;
	
	public int getMAX_QTY() {
		return MAX_QTY;
	}
	public void setMAX_QTY(int mAX_QTY) {
		MAX_QTY = mAX_QTY;
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
	public String getActImg() {
		return actImg;
	}
	public void setActImg(String actImg) {
		this.actImg = actImg;
	}
	public String getActInfo() {
		return actInfo;
	}
	public void setActInfo(String actInfo) {
		this.actInfo = actInfo;
	}
	public String getActAddress1() {
		return actAddress1;
	}
	public void setActAddress1(String actAddress1) {
		this.actAddress1 = actAddress1;
	}
	public String getActAddress2() {
		return actAddress2;
	}
	public void setActAddress2(String actAddress2) {
		this.actAddress2 = actAddress2;
	}
	public int getActPrice() {
		return actPrice;
	}
	public void setActPrice(int actPrice) {
		this.actPrice = actPrice;
	}
	public double getActGrade() {
		return actGrade;
	}
	public void setActGrade(double actGrade) {
		this.actGrade = actGrade;
	}
	public int getActLike() {
		return actLike;
	}
	public void setActLike(int actLike) {
		this.actLike = actLike;
	}
	public String getActInclude() {
		return actInclude;
	}
	public void setActInclude(String actInclude) {
		this.actInclude = actInclude;
	}
	public String getActExclude() {
		return actExclude;
	}
	public void setActExclude(String actExclude) {
		this.actExclude = actExclude;
	}
	public String getActSchedule() {
		return actSchedule;
	}
	public void setActSchedule(String actSchedule) {
		this.actSchedule = actSchedule;
	}
	public String getActPolicy() {
		return actPolicy;
	}
	public void setActPolicy(String actPolicy) {
		this.actPolicy = actPolicy;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public int getActDiscount() {
		return actDiscount;
	}
	public void setActDiscount(int actDiscount) {
		this.actDiscount = actDiscount;
	}
	public int getActCno() {
		return actCno;
	}
	public void setActCno(int actCno) {
		this.actCno = actCno;
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
	public int getActMinMember() {
		return actMinMember;
	}
	public void setActMinMember(int actMinMember) {
		this.actMinMember = actMinMember;
	}
	public int getActMaxMember() {
		return actMaxMember;
	}
	public void setActMaxMember(int actMaxMember) {
		this.actMaxMember = actMaxMember;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getActCategory() {
		return actCategory;
	}
	public void setActCategory(String actCategory) {
		this.actCategory = actCategory;
	}
	public String getActCategory2() {
		return actCategory2;
	}
	public void setActCategory2(String actCategory2) {
		this.actCategory2 = actCategory2;
	}
	public String getActCategory3() {
		return actCategory3;
	}
	public void setActCategory3(String actCategory3) {
		this.actCategory3 = actCategory3;
	}
	public String getActCategory4() {
		return actCategory4;
	}
	public void setActCategory4(String actCategory4) {
		this.actCategory4 = actCategory4;
	}
	public String getActCategory5() {
		return actCategory5;
	}
	public void setActCategory5(String actCategory5) {
		this.actCategory5 = actCategory5;
	}
	public Timestamp getActEventdate() {
		return actEventdate;
	}
	public void setActEventdate(Timestamp actEventdate) {
		this.actEventdate = actEventdate;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}

	public int gethCntLike() {
		return hCntLike;
	}
	public void sethCntLike(int hCntLike) {
		this.hCntLike = hCntLike;
	}
	public String gethPhoto() {
		return hPhoto;
	}
	public void sethPhoto(String hPhoto) {
		this.hPhoto = hPhoto;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getActOption() {
		return actOption;
	}
	public void setActOption(String actOption) {
		this.actOption = actOption;
	}
	@Override
	public String toString() {
//		return "Activity [actId=" + actId + ", actName=" + actName + ", actImg=" + actImg + ", actInfo=" + actInfo
//				+ ", actAddress1=" + actAddress1 + ", actAddress2=" + actAddress2 + ", actPrice=" + actPrice
//				+ ", actGrade=" + actGrade + ", actLike=" + actLike + ", actInclude=" + actInclude + ", actExclude="
//				+ actExclude + ", actSchedule=" + actSchedule + ", actPolicy=" + actPolicy + ", hId=" + hId
//				+ ", actDiscount=" + actDiscount + ", actCno=" + actCno + ", actMinMember=" + actMinMember
//				+ ", actMaxMember=" + actMaxMember + ", actOption=" + actOption + ", startRow=" + startRow + ", endRow="
//				+ endRow + ", searchText=" + searchText + ", actCategory=" + actCategory + ", actCategory2="
//				+ actCategory2 + ", actCategory3=" + actCategory3 + ", actCategory4=" + actCategory4 + ", actCategory5="
//				+ actCategory5 + ", actEventdate=" + actEventdate + ", hName=" + hName + ", hPhoto=" + hPhoto
//				+ ", hCntLike=" + hCntLike + ", mId=" + mId + ", MAX_QTY=" + MAX_QTY + "]";
		return "Activity [hId=" + hId +"startR : "+startRow + " / endR : "+endRow;
	}
	
	
}
