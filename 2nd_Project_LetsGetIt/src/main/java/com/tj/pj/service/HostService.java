package com.tj.pj.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.Host;
import com.tj.pj.dto.LikeHost;

public interface HostService {
	public int idConfirm(String hId);
	public int emailConfirm(String hEmail);
	public int hostJoin(Host host, HttpSession httpSession); // 회원 가입 하고 나면, 세션에 정보 담을 예정
	public int hostSearchPw(Host host);
	public Host getHost(String hId); // 이걸로 로그인도 하고, 수정할 때도 써먹을 예정임
	public int hostModify(MultipartHttpServletRequest mRequest, Host host);
	public List<Host> hostList(Host host); // startRow, endRow 다 여기 이뜸~
	public List<Host> hostBestList(Host host);
	public String hostLoginChk(String hId, String hPw, HttpSession httpSession); // getHost 해온 값이랑 비교 예정, 로그인 후에 세션값 필요~
	public int memberLikeHost(LikeHost likeHost); // 멤버가 좋아해줄때 이걸 소환해서 hcntLike+1 해준당
	public int hostLikeMemberCnt(LikeHost likeHost); // 몇명의 멤버가 이 호스트를 좋아했나
	public List<LikeHost> memberLikeHostList(LikeHost likeHost); // 멤버 별 호스트 좋아요 리스트
	public int memberLikeHostCnt(String mId); // 멤버가 좋아한 호스트 명 수 
	public int memberLikeHostCheck(LikeHost likeHost); // 멤버가 이 호스트를 이미 좋아했는가
	public int memberLikeHostDelete(LikeHost likeHost); // 멤버가 호스트 좋아요를 취소하기
	public List<LikeHost> hostLikedMemberList(LikeHost likeHost); // 나를 좋아한 멤버 보기
	public int whenMemberHostLike(String hId);
	public int whenMemberHostDislike(String hId);
}
