package com.tj.pj.dto;

import org.springframework.web.multipart.MultipartFile;

public class ActivityVO {
	private String attachPath; // 이미지 저장 경로
	private String Filename; // 파일이름
	private MultipartFile upload;
	
	public String getAttachPath() {
		return attachPath;
	}
	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}
	public String getFilename() {
		return Filename;
	}
	public void setFilename(String filename) {
		Filename = filename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
}
