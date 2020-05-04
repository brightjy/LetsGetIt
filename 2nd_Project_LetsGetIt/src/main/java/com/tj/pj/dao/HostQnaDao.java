package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.HostQna;

public interface HostQnaDao {
	public List<HostQna> hostQnaList(HostQna hostQna);
	public int hostQnaCnt(HostQna hostQna);
	public HostQna hostQnaDetail(int qId);
	public int hostQnaWrite(HostQna hostQna);
	public int hostQnaModify(HostQna hostQna);
	public int hostQnaDelete(HostQna hostQna);
	public int hostQnaReplyStepA(int qGroup);
	public int hostQnaReply(HostQna hostQna);
}
