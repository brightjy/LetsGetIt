package com.tj.pj.dto;

public class ReviewLike {
	private int    rlNo;	// 순차번호
	private int    rId;		// 후기 글번호
	private String mId;		// 멤버 아이디
	private int    rlCheck; // 좋아요 체크
	private int	   actId;	// 액티비티 번호
	private int	   startRow;
	private int	   endRow;
	
	public int getRlNo() {
		return rlNo;
	}
	public void setRlNo(int rlNo) {
		this.rlNo = rlNo;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getRlCheck() {
		return rlCheck;
	}
	public void setRlCheck(int rlCheck) {
		this.rlCheck = rlCheck;
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
	
	@Override
	public String toString() {
		return "ReviewLike [rlNo=" + rlNo + ", rId=" + rId + ", mId=" + mId + ", rlCheck=" + rlCheck + ", actId="
				+ actId + "]";
	}
	
}
