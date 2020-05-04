package com.tj.pj.dto;

import java.sql.Date;

public class Member {
	private String mId;
	private String mPw;
	private String mName;
	private String mPhone;
	private String mEmail;
	private String mPost;
	private String mAddress;
	private Date mBirth;
	private Date mRdate;
	private String mImg;
	
	public Member() {}
	public Member(String mId, String mPw, String mName, String mPhone, String mEmail, String mPost, String mAddress,
			Date mBirth, Date mRdate, String mImg) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mPost = mPost;
		this.mAddress = mAddress;
		this.mBirth = mBirth;
		this.mRdate = mRdate;
		this.mImg = mImg;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
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
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPost() {
		return mPost;
	}
	public void setmPost(String mPost) {
		this.mPost = mPost;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public Date getmBirth() {
		return mBirth;
	}
	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}
	public Date getmRdate() {
		return mRdate;
	}
	public void setmRdate(Date mRdate) {
		this.mRdate = mRdate;
	}
	public String getmImg() {
		return mImg;
	}
	public void setmImg(String mImg) {
		this.mImg = mImg;
	}
	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhone=" + mPhone + ", mEmail=" + mEmail
				+ ", mPost=" + mPost + ", mAddress=" + mAddress + ", mBirth=" + mBirth + ", mRdate=" + mRdate
				+ ", mImg=" + mImg + "]";
	}
}
