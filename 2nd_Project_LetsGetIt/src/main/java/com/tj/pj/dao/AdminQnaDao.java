package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.AdminQna;

public interface AdminQnaDao {
	public List<AdminQna> adminQnaList(AdminQna adminQna);
	public int adminQnaCnt(AdminQna adminQna);
	public int adminQnaHitup(AdminQna adminQna);
	public AdminQna adminQnaDetail(int qId);
	public int adminQnaWrite(AdminQna adminQna);
	public int adminQnaModify(AdminQna adminQna);
	public int adminQnaDelete(AdminQna adminQna);
	public int adminQnaReplyStepA(int qGroup);
	public int adminQnaReply(AdminQna adminQna);
}
