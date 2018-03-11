//package com.enterprisesolutions.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.Controller;
//
//import com.enterprisesolutions.utils.AppConstants;
//public class LegalController  implements Controller {
//
//
//	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
//			HttpServletResponse arg1) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Object> modelUc = new HashMap<String, Object>();
//		String modelView="/jsp/LegalStatement.jsp";
//		//User session
//		HttpSession userSession = httpServletRequest.getSession();
//		String jSessionId = userSession.getId();
//		String userIdBigDecimal = (String)userSession.getAttribute("session");
//		if(userIdBigDecimal!=null){
//			modelUc.put("loggedIn", "true");
//			modelUc.put("loginSuccessful", AppConstants.SUCCESSFUL);
//		}else{
//			modelUc.put("loginSuccessful", AppConstants.FAILED);
//		}
//		return new ModelAndView(modelView, "modelUc", modelUc);
//	}
//
//}