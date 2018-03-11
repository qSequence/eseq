//package com.enterprisesolutions.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.Controller;
//
//import com.enterprisesolutions.hibernate.model.SessionRecords;
//import com.enterprisesolutions.utils.AppConstants;
//import com.enterprisesolutions.utils.SessionUtil;
//public class FaqController  implements Controller {
//
//	@Autowired
//	SessionUtil sessionUtil;
//	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
//			HttpServletResponse arg1) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Object> modelUc = new HashMap<String, Object>();
//		String modelView="/jsp/faq.jsp";
//		//User session
//		HttpSession userSession = httpServletRequest.getSession();
//		String jSessionId = userSession.getId();
//		String userId = (String)userSession.getAttribute("session");
//		if(!sessionUtil.checkTipExistsInSession( jSessionId, "CONTRIBUTED_SEQ_TIP")){
//			sessionUtil.addTipToSession(jSessionId, "CONTRIBUTED_SEQ_TIP");
//			modelUc.put("toolTip", "CONTRIBUTED_SEQ_TIP");
//		}
//		//Validate session
//		String sessionValidation = AppConstants.FAILED;
//		
//		if(userId!=null){
//			SessionRecords sessionRecords=sessionUtil.getSessionRecordsFromMap(userId);
//			 if(sessionRecords!=null && sessionRecords.getJsessionId()!=null && sessionRecords.getJsessionId().equals(jSessionId)){
//				 sessionValidation = AppConstants.SUCCESSFUL;
//			 }
//		}
//		modelUc.put("loginSuccessful", sessionValidation);
//		return new ModelAndView(modelView, "modelUc", modelUc);
//	}
//
//}