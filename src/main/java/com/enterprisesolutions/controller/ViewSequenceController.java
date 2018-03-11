package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.enterprisesequence.core.App;

@Service("viewSequenceController")
public class ViewSequenceController extends AbstractController{

	@Autowired
    App app;
	@SuppressWarnings("rawtypes")
	public ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws Exception {
		return app.viewSequenceDisplay(httpServletRequest, httpServletResponse, getServletContext());
	}



}
