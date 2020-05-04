package com.tj.pj.dao;

import java.util.List;

import com.tj.pj.dto.Host;

public interface HostDao {
	public int idConfirm(String hId);
	public int emailConfirm(String hEmail);
	public int hostJoin(Host host);
	public Host getHost(String hId); // 이걸로 로그인도 하고, 수정할 때도 써먹을 예정임
	public int hostModify(Host host);
	public List<Host> hostList(Host host); // startRow, endRow 다 여기 이뜸~
	public List<Host> hostBestList(Host host);
	public int memberLikeHost(Host host); // 멤버가 좋아해줄때 이걸 소환해서 hcntLike+1 해준당
	public int hostSearchPw(Host host);
	public int whenMemberHostLike(String hId);
	public int whenMemberHostDislike(String hId);
}
