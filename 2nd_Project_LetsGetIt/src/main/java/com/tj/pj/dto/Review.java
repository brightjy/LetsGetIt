package com.tj.pj.dto;

import java.sql.Timestamp;

public class Review {
	private int    	  rId;		// 후기 순차번호
	private String 	  rTitle;	// 후기 제목
	private String 	  rWriter;	// 작성자
	private String 	  rPw;		// 후기 비밀번호
	private String 	  rContent;	// 후기 본문
	private String	  rImg;		// 첨부이미지
	private int    	  rGroup;	// 후기 글 그룹
	private int    	  rStep;	// 후기 글 답변
	private int    	  rIndent;	// 후기 글 들여쓰기
	private int	   	  rGrade;	// 후기 평점
	private int    	  actId;	// 액티비티 아이디
	private int    	  rLike;	// 후기 글 좋아요
	private Timestamp rDate;	// 후기 작성일
	private String	  actName;	// 액티비티 이름
	private String	  mId;		// 멤버 아이디
	private String	  hId;		// 호스트 아이디
	private int    	  startRow;
	private int    	  endRow;
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrPw() {
		return rPw;
	}
	public void setrPw(String rPw) {
		this.rPw = rPw;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getrGroup() {
		return rGroup;
	}
	public void setrGroup(int rGroup) {
		this.rGroup = rGroup;
	}
	public int getrStep() {
		return rStep;
	}
	public void setrStep(int rStep) {
		this.rStep = rStep;
	}
	public int getrIndent() {
		return rIndent;
	}
	public void setrIndent(int rIndent) {
		this.rIndent = rIndent;
	}
	public int getActId() {
		return actId;
	}
	public void setActId(int actId) {
		this.actId = actId;
	}
	public int getrLike() {
		return rLike;
	}
	public void setrLike(int rLike) {
		this.rLike = rLike;
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
	public int getrGrade() {
		return rGrade;
	}
	public void setrGrade(int rGrade) {
		this.rGrade = rGrade;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public String getrImg() {
		return rImg;
	}
	public void setrImg(String rImg) {
		this.rImg = rImg;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String actName) {
		this.actName = actName;
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
	
	@Override
	public String toString() {
		return "Review [rId=" + rId + ", rTitle=" + rTitle + ", rWriter=" + rWriter + ", rPw=" + rPw + ", rContent="
				+ rContent + ", rImg=" + rImg + ", rGroup=" + rGroup + ", rStep=" + rStep + ", rIndent=" + rIndent
				+ ", rGrade=" + rGrade + ", actId=" + actId + ", rLike=" + rLike + ", rDate=" + rDate + ", actName="
				+ actName + ", mId=" + mId + ", hId=" + hId + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
