package com.tj.pj.dto;

import java.util.Date;

public class AdminQna {
	private int qId;
	private String qTitle;
	private String qWriter;
	private String qPw;
	private String qContent;
	private String qFile;
	private int qGroup;
	private int qStep;
	private int qIndent;
	private String mId;
	private String aId;
	private Date qRdate;
	private String qIp;
	private int qHit;
	private int startRow; // 페이징 용
	private int endRow; // 페이징 용
	private String searchText; // 검색 용
	
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
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public Date getqRdate() {
		return qRdate;
	}
	public void setqRdate(Date qRdate) {
		this.qRdate = qRdate;
	}
	public String getqIp() {
		return qIp;
	}
	public void setqIp(String qIp) {
		this.qIp = qIp;
	}
	public int getqHit() {
		return qHit;
	}
	public void setqHit(int qHit) {
		this.qHit = qHit;
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
	public String getqFile() {
		return qFile;
	}
	public void setqFile(String qFile) {
		this.qFile = qFile;
	}
	@Override
	public String toString() {
		return "AdminQna [qId=" + qId + ", qTitle=" + qTitle + ", qWriter=" + qWriter + ", qPw=" + qPw + ", qContent="
				+ qContent + ", qFile=" + qFile + ", qGroup=" + qGroup + ", qStep=" + qStep + ", qIndent=" + qIndent
				+ ", mId=" + mId + ", aId=" + aId + ", qRdate=" + qRdate + ", qIp=" + qIp + ", qHit=" + qHit
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", searchText=" + searchText + "]";
	}
	

	
}
