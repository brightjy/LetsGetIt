package com.tj.pj.dao;

import com.tj.pj.dto.Member;

public interface MemberDao {
	public int memberJoin(Member member);
	public Member memberGet(String mId);
	public int memberModify(Member member);
	public int member_idconfirm(String mId);
	public int member_emailconfirm(String mEmail);
	public Member idCk(Member member);
	public int pwCk(Member member);
	public int pwChange(Member member);
}
