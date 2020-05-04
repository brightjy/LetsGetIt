package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dao.NoticeDao;
import com.tj.pj.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/noticeUpload/";

	@Override
	public int noticeWrite(Notice notice, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("noticeUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String nImg = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			nImg = mFile.getOriginalFilename();
			if (nImg != null && nImg != "") {
				// ���� ÷�θ� �ߴ�.
				if (new File(uploadPath + nImg).exists()) { // ������ ���� �̸��� ������ �ִٸ�?
					nImg = System.currentTimeMillis() + "_" + nImg;
				}
				try {
					mFile.transferTo(new File(uploadPath + nImg));
					System.out.println("�������� : " + uploadPath + nImg);
					System.out.println("������� : " + backupPath + nImg);
					int result = fileCopy(uploadPath + nImg, backupPath + nImg);
					System.out.println(result == 1 ? "���� ����" : "���� ����");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {

			}
		} // while
		notice.setnImg(nImg);
		return noticeDao.noticeWrite(notice);
	}

	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1)
					break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (Exception e) {
			}
		}
		return isCopy;
	}

	@Override
	public int noticeModify(Notice notice, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("noticeUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String nImg = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			nImg = mFile.getOriginalFilename();
			if (nImg != null && nImg != "") {
				// ���� ÷�θ� �ߴ�.
				if (new File(uploadPath + nImg).exists()) { // ������ ���� �̸��� ������ �ִٸ�?
					nImg = System.currentTimeMillis() + "_" + nImg;
				}
				try {
					mFile.transferTo(new File(uploadPath + nImg));
					System.out.println("�������� : " + uploadPath + nImg);
					System.out.println("������� : " + backupPath + nImg);
					int result = fileCopy(uploadPath + nImg, backupPath + nImg);
					System.out.println(result == 1 ? "���� ����" : "���� ����");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {

			}
		} // while
		notice.setnTitle(mRequest.getParameter("nTitle"));
		notice.setnContent(mRequest.getParameter("nContent"));
		notice.setnImg(nImg);
		return noticeDao.noticeModify(notice);
	}


	@Override
	public List<Notice> noticeList(Notice notice) {
		
		return noticeDao.noticeList(notice);
	}

	@Override
	public int noticeDelete(Notice notice) {
		
		return noticeDao.noticeDelete(notice);
	}

	@Override
	public int cntNotice(Notice notice) {
		
		return noticeDao.cntNotice(notice);
	}

	@Override
	public Notice detailNotice(int nNo) {
		
		return noticeDao.detailNotice(nNo);
	}

}
