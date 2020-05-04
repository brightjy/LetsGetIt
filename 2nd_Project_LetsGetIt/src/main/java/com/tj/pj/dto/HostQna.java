package com.tj.pj.dto;

import java.sql.Date;

public class HostQna {
	private int qId;
	private String qTitle;
	private String qWriter;
	private String qPw;
	private String qContent;
	private int qGroup;
	private int qStep;
	private int qIndent;
	private Date qRdate;
	private String qImg;
	private int startRow; 
	private int endRow; 
	private String searchText;
	private int actId;
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqPw() {
		return qPw;
	}
	public void setqPw(String qPw) {
		this.qPw = qPw;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public int getqGroup() {
		return qGroup;
	}
	public void setqGroup(int qGroup) {
		this.qGroup = qGroup;
	}
	public int getqStep() {
		return qStep;
	}
	public void setqStep(int qStep) {
		this.qStep = qStep;
	}
	public int getqIndent() {
		return qIndent;
	}
	public void setqIndent(int qIndent) {
		this.qIndent = qIndent;
	}
	public Date getqRdate() {
		return qRdate;
	}
	public void setqRdate(Date qRdate) {
		this.qRdate = qRdate;
	}
	public String getqImg() {
		return qImg;
	}
	public void setqImg(String qImg) {
		this.qImg = qImg;
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
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getActId() {
		return actId;
	}
	public void setActId(int actId) {
		this.actId = actId;
	}
	@Override
	public String toString() {
		return "HostQna [qId=" + qId + ", qTitle=" + qTitle + ", qWriter=" + qWriter + ", qPw=" + qPw + ", qContent="
				+ qContent + ", qGroup=" + qGroup + ", qStep=" + qStep + ", qIndent=" + qIndent + ", qRdate=" + qRdate
				+ ", qImg=" + qImg + ", startRow=" + startRow + ", endRow=" + endRow + ", searchText=" + searchText
				+ ", actId=" + actId + "]";
	}
	
}
