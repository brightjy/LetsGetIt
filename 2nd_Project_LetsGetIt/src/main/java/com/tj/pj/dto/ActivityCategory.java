package com.tj.pj.dto;

public class ActivityCategory {
	private int actCno;
	private String tempActCno;
	private String actCategory;
	private String actCategory2;
	private String actCategory3;
	private String actCategory4;
	private String actCategory5;
	
	public int getActCno() {
		return actCno;
	}
	public void setActCno(int actCno) {
		this.actCno = actCno;
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
	public String getTempActCno() {
		return tempActCno;
	}
	public void setTempActCno(String tempActCno) {
		this.tempActCno = tempActCno;
	}
	@Override
	public String toString() {
		return "ActivityCategory [actCno=" + actCno + ", tempActCno=" + tempActCno + ", actCategory=" + actCategory
				+ ", actCategory2=" + actCategory2 + ", actCategory3=" + actCategory3 + ", actCategory4=" + actCategory4
				+ ", actCategory5=" + actCategory5 + "]";
	}
	
	
	
}
