package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dao.LikeCategoryDao;
import com.tj.pj.dao.MemberDao;
import com.tj.pj.dto.LikeCategory;
import com.tj.pj.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private LikeCategoryDao likeCategoryDao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/memberUpload/";
		
		@Override
		public int memberJoin(final Member member, HttpSession httpSession) {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = 
						"  <h1>"+member.getmName()+"님의 회원가입을 축하드립니다</h1>"+
								"  <div>" + 
								"    <div>" + 
								"      아무개 싸이트에서만 쓰실 수 있는 쿠폰을 드립니다\n\n" + 
								"      <hr color=\"red\"/>" + 
								"    </div>" + 
								"    <did>" + 
								"      <p style=\"color:blue;\" >파란색 감사</p>" + 
								"      <p style=\"color:red;\">빨간색 감사</p>" + 
								"    </did>" + 
								"  </div>" + 
								"    <div>" + 
								"      <img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png\" />\n" + 
								"    </div>" + 
								"    <div style=\"font-weight: blod; font-size: 1.2em;\">아무개 사이트 일동</div>\n" + 
								"    <div style=\"color:red;\">서울시 종로구 수표로 육의전BD 803호</div>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, 
							new InternetAddress(member.getmEmail()));
					mimeMessage.setFrom(new InternetAddress("brightjyp@gmail.com"));
					mimeMessage.setSubject(member.getmName()+"님 회원가입감사합니다(HTML)");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
			httpSession.setAttribute("mId", member.getmId());
			return memberDao.memberJoin(member);
		}
		
		
	@Override
	public Member memberGet(String mId) {
		
		return memberDao.memberGet(mId);
	}

	@Override
	public int member_idconfirm(String mId) {
		
		return memberDao.member_idconfirm(mId);
	}

	@Override
	public Member idCk(Member member) {
		
		return memberDao.idCk(member);
	}

	@Override
	public int pwCk(final Member member) {
		// 새로운 비밀번호를 만들고
				String tempmPw = "";
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
					tempmPw = sb.toString();
				}
				// hPw 값을 새로 셋팅해서
				member.setmPw(tempmPw);
				// hostDao.hostSearchPw 소환
				int result = memberDao.pwCk(member);
				// 결과가 1이면(=회원 정보 수정이 제대로 되면), 메일을 보낸다.
				if(result==1) { 
					MimeMessagePreparator message = new MimeMessagePreparator() {
						String content =
								"	<h1>"+
								"	임시 비밀번호 : "+
								member.getmPw();				
						@Override
						public void prepare(MimeMessage mimeMessage) throws Exception {
							mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getmEmail()));
							mimeMessage.setFrom(new InternetAddress("brightjyp@gmail.com"));
							mimeMessage.setSubject(member.getmName()+"님 임시 비밀번호입니다. &#128587; &#127808;");
							mimeMessage.setText(content,"utf-8","html");
						}
					};
					mailSender.send(message);
				}
				return result;
			}
	@Override
	public int pwChange(Member member) {
		// TODO Auto-generated method stub
		return memberDao.pwChange(member);
	}
	@Override
	public int member_emailconfirm(String mEmail) {
		// TODO Auto-generated method stub
		return memberDao.member_emailconfirm(mEmail);
	}


	@Override
	public String memberLoginChk(String mId, String mPw, HttpSession httpSession) {
		String result="로그인 성공";
		Member member = memberDao.memberGet(mId);
		if(member==null) {
			result="일치하는 아이디가 없습니다.";
		}else if(!member.getmPw().equals(mPw)) {
			result="비밀번호가 일치하지 않습니다.";
		}else {
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mId", mId);
		}
		return result;
	}

	//memberModify*************************************************************************
	@Override
	public int memberModify(Member member, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("memberUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String mImg = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			mImg = mFile.getOriginalFilename();
			if(mImg!=null && mImg!="") {
				// 파일 첨부를 했다.
				if(new File(uploadPath+mImg).exists()) { // 서버에 같은 이름의 파일이 있다면?
					mImg = System.currentTimeMillis()+"_"+mImg;
				}
				try {
					mFile.transferTo(new File(uploadPath+mImg));
					System.out.println("서버파일 : "+uploadPath+mImg);
					System.out.println("백업파일 : "+backupPath+mImg);
					int result = fileCopy(uploadPath+mImg, backupPath+mImg);
					System.out.println(result==1?"복사 성공":"복사 실패");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}//while
		member.setmPw(mRequest.getParameter("hPw"));
		member.setmName(mRequest.getParameter("hName"));
		member.setmPhone(mRequest.getParameter("hPhone"));
		member.setmEmail(mRequest.getParameter("hEmail"));
		member.setmPost(mRequest.getParameter("hPost"));
		member.setmAddress(mRequest.getParameter("hAddress"));
		member.setmImg(mImg);
		return memberDao.memberModify(member);
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
				if(nRead== -1) break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) { }
		}
		return isCopy;
	}
	//****************************************************************
	
	@Override
	public int memberLikeCateCheck(LikeCategory likeCategory) {
		return likeCategoryDao.memberLikeCateCheck(likeCategory);
	}
	@Override
	public int memberLikeActCate(LikeCategory likeCategory) {
		return likeCategoryDao.memberLikeActCate(likeCategory);
	}
	
	@Override
	public int memberDeleteLikeActCate(LikeCategory likeCategory) {
		return likeCategoryDao.memberDeleteLikeActCate(likeCategory);
	}
	
	@Override
	public List<LikeCategory> memberLikeActCateList(LikeCategory likeCategory) {
		return likeCategoryDao.memberLikeActCateList(likeCategory);
	}


	@Override
	public String memberLikeCateWithCommaList(LikeCategory likeCategory, HttpSession httpsession, Model model) {
		Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
		String myList = "";
		if(member!=null) {
			String mId = member.getmId();
			List<LikeCategory> myLikeCateList = likeCategoryDao.memberLikeCateWithCommaList(mId); // {16, , 32, , 6, , 8,}
			for(LikeCategory c : myLikeCateList) {
				myList += c.getTempActCno();
			}
		}
		return myList;
	}




}
