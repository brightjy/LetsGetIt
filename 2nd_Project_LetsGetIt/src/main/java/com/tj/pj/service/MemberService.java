package com.tj.pj.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.LikeCategory;
import com.tj.pj.dto.Member;

public interface MemberService {
	public int memberJoin(Member member, HttpSession httpSession);
	public Member memberGet(String mId);
	public int memberModify(Member member,MultipartHttpServletRequest mRequest);
	public int member_idconfirm(String mId);
	public int member_emailconfirm(String mEmail);
	public Member idCk(Member member);
	public int pwCk(Member member);
	public int pwChange(Member member);
	public String memberLoginChk(String mId, String mPw, HttpSession httpSession);
	public int memberLikeCateCheck(LikeCategory likeCategory); // 멤버가 이미 설정한 관심사인지 확인
	public int memberLikeActCate(LikeCategory likeCategory); // 멤버 관심사 설정
	public int memberDeleteLikeActCate(LikeCategory likeCategory); // 멤버 관심사 설정 취소
	public List<LikeCategory> memberLikeActCateList(LikeCategory likeCategory); // 멤버가 설정한 관심사들
	public String memberLikeCateWithCommaList(LikeCategory likeCategory, HttpSession httpsession, Model model);// 멤버가 설정한 관심사들 스트링처리 해주기
}
