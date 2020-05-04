package com.tj.pj.dto;

public class LikeCategory {
	private int lcId;
	private String mId;
	private int actCno;
	// 추가로 필요한 것
	private String actCategory4;
	private String tempActCno;
	
	public String getTempActCno() {
		return tempActCno;
	}
	public void setTempActCno(String tempActCno) {
		this.tempActCno = tempActCno;
	}
	public int getLcId() {
		return lcId;
	}
	public void setLcId(int lcId) {
		this.lcId = lcId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getActCno() {
		return actCno;
	}
	public void setActCno(int actCno) {
		this.actCno = actCno;
	}
	public String getActCategory4() {
		return actCategory4;
	}
	public void setActCategory4(String actCategory4) {
		this.actCategory4 = actCategory4;
	}
	@Override
	public String toString() {
		return "LikeCategory [lcId=" + lcId + ", mId=" + mId + ", actCno=" + actCno + ", actCategory4=" + actCategory4
				+ "]";
	}
	
	
}
