package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.enterprisesequence.core.App;

public class FileUploadController extends AbstractController {
	 
	@Autowired
	App app;

	@Override

    protected ModelAndView handleRequestInternal(HttpServletRequest req,
            HttpServletResponse res) throws Exception {
		
		return app.fileUploadDisplay(req, res,getServletContext());
	}
}