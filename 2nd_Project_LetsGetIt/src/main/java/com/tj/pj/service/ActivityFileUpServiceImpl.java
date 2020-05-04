package com.tj.pj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.ActivityVO;

@Service
public class ActivityFileUpServiceImpl implements ActivityFileUpService {
	@Override
	public boolean FileUp(MultipartHttpServletRequest mRequest, Model model) {
		boolean isUpload = false;
		int	actCno = Integer.parseInt(mRequest.getParameter("actCno"));
		String actImgstr = mRequest.getParameter("actImgstr");
		String actName = mRequest.getParameter("actName");
		String uploadPath = mRequest.getRealPath("/actImg");
		String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/actImg/";
		MultipartFile mFile = mRequest.getFile("actImg");
		if(actImgstr != null) {
			mFile = mRequest.getFile(actImgstr);
		}
		String actImg = mFile.getOriginalFilename(); // 업로드 했을 때 원래 이름
		if(actImg != null && !actImg.equals("")) { // 첨부함
			actImg = System.currentTimeMillis() + actImg;
			try {
				mFile.transferTo(new File(uploadPath+actImg)); // 서버에 파일을 저장하는 로직
				System.out.println("서버에 저장된 파일 : " + actImg);
				System.out.println("백업위해 복사할 파일 : " + actImg);
				isUpload = filecopy(uploadPath+actImg, backupPath+actImg);   
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		} // if
		model.addAttribute("actCno", actCno);
		model.addAttribute("actName", actName);
		if(!actImg.equals("")) {
			model.addAttribute("actImg", actImg);
		}
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
	@Override
	public ActivityVO activityVO(ActivityVO activityVO, HttpServletRequest request, HttpServletResponse response) {
		String rootPath = request.getRealPath("/");
		String attachPath = "activityInfoImg/";
		String backupPath = "D:/java/source/pj/2nd_Project_LetsGetIt/src/main/webapp/activityInfoImg/";
		MultipartFile upload = activityVO.getUpload();
		String filename = "";
		if(upload != null) {
			filename = System.currentTimeMillis()+upload.getOriginalFilename();
			activityVO.setFilename(filename);
			try {
				File file = new File(rootPath+attachPath+filename);
				upload.transferTo(file);
			} catch(IOException e) {
				e.printStackTrace();
			}
			activityVO.setAttachPath(attachPath);
			activityVO.setFilename(filename);
		}
		boolean result = filecopy(rootPath+attachPath+filename, backupPath+filename);
		if(result) {
			System.out.println(filename+"파일 백업 성공");
		}
		String callback = request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			String fileUrl = request.getContextPath()+"/activityInfoImg/"+filename;
			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+
								callback+",'"+fileUrl+"','이미지가 업로드되었습니다')</script>");
			printWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			printWriter.close();
		}
		return activityVO;
	}
}
