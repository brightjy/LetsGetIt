package com.tj.pj.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReviewFileUpService {
	public boolean FileUp(MultipartHttpServletRequest mRequest, Model model, HttpSession session);
}
