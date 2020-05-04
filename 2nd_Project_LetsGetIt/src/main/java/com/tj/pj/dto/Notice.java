package com.tj.pj.dto;

import java.sql.Date;

public class Notice {
	private int nNo;
	private String nType;
	private String nTitle;
	private String nContent;
	private int nGroup;
	private int nStep;
	private int nIndent;
	private Date nRdate;
	private String nImg;
	private int startRow; 
	private int endRow;
	public Notice() {
	}
	public Notice(int nNo, String nType, String nTitle, String nContent, int nGroup, int nStep, int nIndent,
			Date nRdate, String nImg, int startRow, int endRow) {
		this.nNo = nNo;
		this.nType = nType;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nGroup = nGroup;
		this.nStep = nStep;
		this.nIndent = nIndent;
		this.nRdate = nRdate;
		this.nImg = nImg;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnType() {
		return nType;
	}
	public void setnType(String nType) {
		this.nType = nType;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public int getnGroup() {
		return nGroup;
	}
	public void setnGroup(int nGroup) {
		this.nGroup = nGroup;
	}
	public int getnStep() {
		return nStep;
	}
	public void setnStep(int nStep) {
		this.nStep = nStep;
	}
	public int getnIndent() {
		return nIndent;
	}
	public void setnIndent(int nIndent) {
		this.nIndent = nIndent;
	}
	public Date getnRdate() {
		return nRdate;
	}
	public void setnRdate(Date nRdate) {
		this.nRdate = nRdate;
	}
	public String getnImg() {
		return nImg;
	}
	public void setnImg(String nImg) {
		this.nImg = nImg;
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
		return "Notice [nNo=" + nNo + ", nType=" + nType + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nGroup="
				+ nGroup + ", nStep=" + nStep + ", nIndent=" + nIndent + ", nRdate=" + nRdate + ", nImg=" + nImg
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	} 
}
