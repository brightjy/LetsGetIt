package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dao.AdminDao;
import com.tj.pj.dao.AdminQnaDao;
import com.tj.pj.dto.Admin;
import com.tj.pj.dto.AdminQna;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private AdminQnaDao adminQnaDao;
	String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/upload/";
	
	@Override
	public List<AdminQna> adminQnaList(AdminQna adminQna) {
		return adminQnaDao.adminQnaList(adminQna);
	}

	@Override
	public int adminQnaCnt(AdminQna adminQna) {
		return adminQnaDao.adminQnaCnt(adminQna);
	}

	@Override
	public int adminQnaHitup(AdminQna adminQna) {
		return adminQnaDao.adminQnaHitup(adminQna);
	}

	@Override
	public AdminQna adminQnaDetail(int qId) {
		return adminQnaDao.adminQnaDetail(qId);
	}

	@Override
	public int adminQnaWrite(MultipartHttpServletRequest mRequest, AdminQna adminQna) {
		String uploadPath = mRequest.getRealPath("upload/");
		Iterator<String> params = mRequest.getFileNames();
		String qFile = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qFile = mFile.getOriginalFilename();
			if(qFile!=null && qFile!="") {
				if(new File(uploadPath+qFile).exists()){
					qFile = System.currentTimeMillis()+"_"+qFile;
				}
				try {
					mFile.transferTo(new File(uploadPath+qFile));
					System.out.println("서버파일 : "+uploadPath+qFile);
					System.out.println("백업파일 : "+backupPath+qFile);
					int result = fileCopy(uploadPath+qFile, backupPath+qFile);
					System.out.println(result==1?"복사 성공":"복사 실패");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}
		adminQna.setqWriter(mRequest.getParameter("qWriter"));
		adminQna.setqTitle(mRequest.getParameter("qTitle"));
		adminQna.setqContent(mRequest.getParameter("qContent"));
		adminQna.setqFile(qFile);
		adminQna.setqPw(mRequest.getParameter("qPw"));
		adminQna.setqIp(mRequest.getRemoteAddr());
		return adminQnaDao.adminQnaWrite(adminQna);
	}

	@Override
	public int adminQnaModify(MultipartHttpServletRequest mRequest, AdminQna adminQna) {
		String uploadPath = mRequest.getRealPath("upload/");
		Iterator<String> params = mRequest.getFileNames();
		String qFile = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qFile = mFile.getOriginalFilename();
			if(qFile!=null && qFile!="") {
				if(new File(uploadPath+qFile).exists()){
					qFile = System.currentTimeMillis()+"_"+qFile;
				}
				try {
					mFile.transferTo(new File(uploadPath+qFile));
					System.out.println("서버파일 : "+uploadPath+qFile);
					System.out.println("백업파일 : "+backupPath+qFile);
					int result = fileCopy(uploadPath+qFile, backupPath+qFile);
					System.out.println(result==1?"복사 성공":"복사 실패");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}
		adminQna.setqWriter(mRequest.getParameter("qWriter"));
		adminQna.setqTitle(mRequest.getParameter("qTitle"));
		adminQna.setqContent(mRequest.getParameter("qContent"));
		adminQna.setqFile(qFile);
		adminQna.setqPw(mRequest.getParameter("qPw"));
		adminQna.setqIp(mRequest.getRemoteAddr());
		return adminQnaDao.adminQnaModify(adminQna);
	}

	@Override
	public int adminQnaDelete(AdminQna adminQna) {
		return adminQnaDao.adminQnaDelete(adminQna);
	}

	@Override
	public int adminQnaReplyStepA(int qGroup) {
		return adminQnaDao.adminQnaReplyStepA(qGroup);
	}

	@Override
	public int adminQnaReply(AdminQna adminQna, HttpServletRequest request) {
		adminQna.setqIp(request.getRemoteAddr());
		return adminQnaDao.adminQnaReply(adminQna);
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
		} catch (Exception e) {
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
	public int adminJoin(Admin admin) {
		int result = adminDao.adminJoin(admin);
		return result;
	}

	@Override
	public Admin getAdmin(String aId) {
		return adminDao.getAdmin(aId);
	}

	@Override
	public String adminLoginChk(String aId, String aPw, HttpSession httpSession) {
		String result="관리자 로그인 성공";
		Admin admin = adminDao.getAdmin(aId);
		if(admin==null) {
			result="일치하는 아이디가 없습니다.";
		}else if(!admin.getaPw().equals(aPw)) {
			result="비밀번호가 일치하지 않습니다.";
		}else {
			httpSession.setAttribute("admin", admin);
			httpSession.setAttribute("aId", aId);
		}
		return result;
	}
	@Override
	public Admin adminGet(String aId) {
		
		return adminDao.adminGet(aId);
	}

}
