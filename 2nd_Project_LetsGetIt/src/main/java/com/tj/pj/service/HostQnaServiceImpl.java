package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dao.HostQnaDao;
import com.tj.pj.dto.HostQna;

@Service
public class HostQnaServiceImpl implements HostQnaService {
	@Autowired
	private HostQnaDao hostQnaDao;
	String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/noticeUpload/";
	@Override
	public List<HostQna> hostQnaList(HostQna hostQna) {
		
		return hostQnaDao.hostQnaList(hostQna);
	}

	@Override
	public int hostQnaCnt(HostQna hostQna) {
		
		return hostQnaDao.hostQnaCnt(hostQna);
	}

	@Override
	public HostQna hostQnaDetail(int qId) {
		
		return hostQnaDao.hostQnaDetail(qId);
	}

	@Override
	public int hostQnaWrite(HostQna hostQna, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("noticeUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String qImg = "";
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			qImg = mFile.getOriginalFilename();
			if(qImg!=null && qImg!="") {
				if(new File(uploadPath+qImg).exists()){
					qImg = System.currentTimeMillis()+"_"+qImg;
				}
				try {
					mFile.transferTo(new File(uploadPath+qImg));
					System.out.println("서버파일 : "+uploadPath+qImg);
					System.out.println("백업파일 : "+backupPath+qImg);
					int result = fileCopy(uploadPath+qImg, backupPath+qImg);
					System.out.println(result==1?"복사 성공":"복사 실패");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}
		hostQna.setqWriter(mRequest.getParameter("qWriter"));
		hostQna.setqTitle(mRequest.getParameter("qTitle"));
		hostQna.setqContent(mRequest.getParameter("qContent"));
		hostQna.setqImg(qImg);
		hostQna.setqPw(mRequest.getParameter("qPw"));
		return hostQnaDao.hostQnaWrite(hostQna);
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
	public int hostQnaModify(HostQna hostQna, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("noticeUpload/");
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
					System.out.println("�������� : "+uploadPath+qFile);
					System.out.println("������� : "+backupPath+qFile);
					int result = fileCopy(uploadPath+qFile, backupPath+qFile);
					System.out.println(result==1?"���� ����":"���� ����");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				
			}
		}
		hostQna.setqWriter(mRequest.getParameter("qWriter"));
		hostQna.setqTitle(mRequest.getParameter("qTitle"));
		hostQna.setqContent(mRequest.getParameter("qContent"));
		hostQna.setqImg(qFile);
		hostQna.setqPw(mRequest.getParameter("qPw"));
		return hostQnaDao.hostQnaModify(hostQna);
	}

	@Override
	public int hostQnaDelete(HostQna hostQna) {

		return hostQnaDao.hostQnaDelete(hostQna);
	}

	@Override
	public int hostQnaReplyStepA(int qGroup) {
		
		return hostQnaDao.hostQnaReplyStepA(qGroup);
	}

	@Override
	public int hostQnaReply(HostQna hostQna, HttpServletRequest request) {
		hostQna.setqWriter(request.getParameter("qWriter"));
		hostQna.setqTitle(request.getParameter("qTitle"));
		hostQna.setqContent(request.getParameter("qContent"));
		hostQna.setqPw(request.getParameter("qPw"));
		return hostQnaDao.hostQnaReply(hostQna);
	}

}
