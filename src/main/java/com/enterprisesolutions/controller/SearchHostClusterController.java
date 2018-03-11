package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.enterprisesequence.core.App;

public class SearchHostClusterController  implements Controller {

	@Autowired
	App app;
	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
			HttpServletResponse arg1) throws Exception {
		return app.searchHostClusterDisplay(httpServletRequest, arg1);
	}

}