package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Service
public class ReviewFileUpServiceImpl implements ReviewFileUpService {

	@Override
	public boolean FileUp(MultipartHttpServletRequest mRequest, Model model, HttpSession session) {
		boolean isUpload = false;
		String uploadPath = mRequest.getRealPath("reviewImg/");
		String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/reviewImg/";
		MultipartFile mFile = mRequest.getFile("rImgstr");
		String rImg = mFile.getOriginalFilename(); // 업로드 했을 때 원래 이름
		if(rImg != null && !rImg.equals("")) { // 첨부함
			rImg = System.currentTimeMillis() + rImg;
			session.setAttribute("rImg", rImg);
			try {
				mFile.transferTo(new File(uploadPath+rImg)); // 서버에 파일을 저장하는 로직
				System.out.println("서버에 저장된 파일 : " + rImg);
				System.out.println("백업위해 복사할 파일 : " + rImg);
				isUpload = filecopy(uploadPath+rImg, backupPath+rImg);   
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		} // if
		return isUpload;
	}
	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int)file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) {
					break;
				}
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os != null) {
					os.close();
				}
				if(is != null) {
					is.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
}
