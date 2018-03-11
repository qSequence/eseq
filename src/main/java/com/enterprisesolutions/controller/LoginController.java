package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.enterprisesequence.core.App;

public class LoginController extends AbstractController {

	
	@Autowired
	App app;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws Exception {
		
		return app.loginDisplay(httpServletRequest, httpServletResponse, getServletContext().getRealPath("/"));
		
	}
}
