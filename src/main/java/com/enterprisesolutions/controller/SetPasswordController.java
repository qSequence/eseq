package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.enterprisesequence.core.App;

public class SetPasswordController  implements Controller{

	@Autowired
	App app;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws Exception {
		return app.setPasswordDisplay(httpServletRequest, httpServletResponse);
	}

}
