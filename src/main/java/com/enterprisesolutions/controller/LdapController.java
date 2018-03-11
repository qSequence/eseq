package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.enterprisesequence.core.App;

public class LdapController extends AbstractController {

	
	@Autowired
	App app;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws Exception {
		
		return app.ldapDisplay(httpServletRequest, httpServletResponse);
		
	}
}
