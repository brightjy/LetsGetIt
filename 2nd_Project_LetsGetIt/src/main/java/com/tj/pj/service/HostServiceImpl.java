package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dao.HostDao;
import com.tj.pj.dao.LikeHostDao;
import com.tj.pj.dto.Host;
import com.tj.pj.dto.LikeHost;
@Service
public class HostServiceImpl implements HostService {

	@Autowired
	private LikeHostDao likeHostDao;
	
	@Autowired
	private HostDao hostDao;
	String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/upload/";
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public int idConfirm(String hId) {
		return hostDao.idConfirm(hId);
	}
	
	@Override
	public int emailConfirm(String hEmail) {
		return hostDao.emailConfirm(hEmail);
	}

	@Override
	public int hostJoin(final Host host, HttpSession httpSession) {
		int result = hostDao.hostJoin(host);
		
		if(result==1) { // 회원가입이 제대로 진행되면,
			httpSession.setAttribute("hId", host.gethId()); // 세션에 호스트 id 정보 저장
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content =
						"	<br>"+
						"	<img src='https://postfiles.pstatic.net/MjAyMDA0MTBfNTUg/MDAxNTg2NDg5NzIxOTMy.E8J6aCKSBzbkM1X8bmQrJPRynAwMM5GHQ9yUmwFwVP0g.FyyM2XVWCK0v-EYrDbfll33AqSRop8FK9PGlI3FUnmsg.JPEG.barkji0/hostMail1.jpg?type=w966'>"+
						"	<br>"+
						"	<img src='https://postfiles.pstatic.net/MjAyMDA0MTBfMjg3/MDAxNTg2NDg5NzIxOTM2.HUFSt9RBIi1sMy7LQ6BQE0RJalTcQEubUYoDUrigXnEg.5s4o7bnFBNAMhAOsKxTe2KglsQ31w7Zcnmd3UOJXqeMg.JPEG.barkji0/hostMail2.jpg?type=w966'>";
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(host.gethEmail()));
					mimeMessage.setFrom(new InternetAddress("brightjyp@gmail.com"));
					mimeMessage.setSubject(host.gethName()+"님 반갑습니다. &#128587; &#127808;");
					mimeMessage.setText(content,"utf-8","html");
				}
			};
			mailSender.send(message);
		}
		return result;
	}

	@Override
	public int hostSearchPw(final Host host) {
		// 새로운 비밀번호를 만들고
		String tempPw = "";
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j',
				'K','L','M','N','O','P','Q','R','S','T',
				'U','V','W','X','Y','Z'};
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<25; i++) {
			index = (int)(charSet.length*Math.random());
			sb.append(charSet[index]);
			tempPw = sb.toString();
		}
		// hPw 값을 새로 셋팅해서
		host.sethPw(tempPw);
		// hostDao.hostSearchPw 소환
		int result = hostDao.hostSearchPw(host);
		// 결과가 1이면(=회원 정보 수정이 제대로 되면), 메일을 보낸다.
		if(result==1) { 
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content =
						"	<h1>"+
						"	임시 비밀번호 : "+
						host.gethPw();				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(host.gethEmail()));
					mimeMessage.setFrom(new InternetAddress("brightjyp@gmail.com"));
					mimeMessage.setSubject(host.gethName()+"님 임시 비밀번호입니다. &#128587; &#127808;");
					mimeMessage.setText(content,"utf-8","html");
				}
			};
			mailSender.send(message);
		}
		return result;
	}
	
	@Override
	public int hostModify(MultipartHttpServletRequest mRequest, Host host) {
		String uploadPath = mRequest.getRealPath("upload/");
		Iterator<String> params = mRequest.getFileNames();
		String hPhoto = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			hPhoto = mFile.getOriginalFilename();
			if(hPhoto!=null && hPhoto!="") {
				// 파일 첨부를 했다.
				if(new File(uploadPath+hPhoto).exists()) { // 서버에 같은 이름의 파일이 있다면?
					hPhoto = System.currentTimeMillis()+"_"+hPhoto;
				}
				try {
					mFile.transferTo(new File(uploadPath+hPhoto));
					System.out.println("서버파일 : "+uploadPath+hPhoto);
					System.out.println("백업파일 : "+backupPath+hPhoto);
					int result = fileCopy(uploadPath+hPhoto, backupPath+hPhoto);
					System.out.println(result==1?"복사 성공":"복사 실패");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}//while
		host.sethPw(mRequest.getParameter("hPw"));
		host.sethName(mRequest.getParameter("hName"));
		host.sethPhone(mRequest.getParameter("hPhone"));
		host.sethEmail(mRequest.getParameter("hEmail"));
		host.sethPost(mRequest.getParameter("hPost"));
		host.sethAddress(mRequest.getParameter("hAddress"));
		host.sethPhoto(hPhoto);
		return hostDao.hostModify(host);
	}
	
	@Override
	public Host getHost(String hId) {
		return hostDao.getHost(hId);
	}

	@Override
	public List<Host> hostList(Host host) {
		return hostDao.hostList(host);
	}

	@Override
	public List<Host> hostBestList(Host host) {
		return hostDao.hostBestList(host);
	}

	@Override
	public String hostLoginChk(String hId, String hPw, HttpSession httpSession) {
		String result="로그인 성공";
		Host host = hostDao.getHost(hId);
		if(host==null) {
			result="일치하는 아이디가 없습니다.";
		}else if(!host.gethPw().equals(hPw)) {
			result="비밀번호가 일치하지 않습니다.";
		}else {
			httpSession.setAttribute("host", host);
			httpSession.setAttribute("hId", hId);
		}
		return result;
	}

	

	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead==-1) break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return isCopy;
	}

	@Override
	public int memberLikeHost(LikeHost likeHost) {
		return likeHostDao.memberLikeHost(likeHost);
	}

	@Override
	public int hostLikeMemberCnt(LikeHost likeHost) {
		return likeHostDao.hostLikeMemberCnt(likeHost);
	}

	@Override
	public List<LikeHost> memberLikeHostList(LikeHost likeHost) {
		return likeHostDao.memberLikeHostList(likeHost);
	}

	@Override
	public int memberLikeHostCheck(LikeHost likeHost) {
		return likeHostDao.memberLikeHostCheck(likeHost);
	}

	@Override
	public int memberLikeHostDelete(LikeHost likeHost) {
		return likeHostDao.memberLikeHostDelete(likeHost);
	}

	@Override
	public List<LikeHost> hostLikedMemberList(LikeHost likeHost) {
		return likeHostDao.hostLikedMemberList(likeHost);
	}

	@Override
	public int memberLikeHostCnt(String mId) {
		return likeHostDao.memberLikeHostCnt(mId);
	}

	@Override
	public int whenMemberHostLike(String hId) {
		return hostDao.whenMemberHostLike(hId);
	}

	@Override
	public int whenMemberHostDislike(String hId) {
		return hostDao.whenMemberHostDislike(hId);
	}

	





}
