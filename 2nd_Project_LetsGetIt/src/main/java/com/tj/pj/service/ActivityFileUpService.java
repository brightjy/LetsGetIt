package com.tj.pj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.ActivityVO;

public interface ActivityFileUpService {
	public boolean FileUp(MultipartHttpServletRequest mRequest, Model model);
	public ActivityVO activityVO(ActivityVO activityVO, HttpServletRequest request, HttpServletResponse response);
}
