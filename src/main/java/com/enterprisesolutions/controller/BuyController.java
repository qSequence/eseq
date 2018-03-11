//package com.enterprisesolutions.controller;
//
//import java.math.BigDecimal;
//import java.math.BigInteger;
//import java.util.HashMap;
//import java.util.List;
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
//import com.enterprisesolutions.hibernate.model.BuyDetails;
//import com.enterprisesolutions.hibernate.model.Credential;
//import com.enterprisesolutions.hibernate.model.SessionRecords;
//import com.enterprisesolutions.utils.AppConstants;
//import com.enterprisesolutions.utils.ConverterUtil;
//import com.enterprisesolutions.utils.DbUtil;
//import com.enterprisesolutions.utils.PasswordUtil;
//import com.enterprisesolutions.utils.RequestLogUtil;
//import com.enterprisesolutions.utils.SendMailTLS;
//import com.enterprisesolutions.utils.SessionUtil;
//public class BuyController  implements Controller {
//
//	@Autowired
//	PasswordUtil passwordUtil;
//	@Autowired
//	RequestLogUtil requestLogUtil;
//	@Autowired
//	ConverterUtil converterUtil;
//	@Autowired
//	SessionUtil sessionUtil;
//	@Autowired
//	DbUtil dbUtil;
//
//	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
//			HttpServletResponse arg1) throws Exception {
//		// TODO Auto-generated method stub
//	
//		Map<String, Object> modelUc = new HashMap<String, Object>();
//		String modelView="/jsp/Buy.jsp";
//		try{
//			String captcha_enabled_param = httpServletRequest.getParameter("captcha_enabled_param");
//			String firstName = httpServletRequest.getParameter("firstName");
//			String lastName = httpServletRequest.getParameter("lastName");
//			String userNameEmail = httpServletRequest.getParameter("userNameEmail");
//			String company = httpServletRequest.getParameter("company");
//			String phone = httpServletRequest.getParameter("phone");
//			String mobile = httpServletRequest.getParameter("mobile");
//			String message = httpServletRequest.getParameter("descriptionTA");
//			String user_request_action_param = httpServletRequest.getParameter("user_request_action_param");
//			String validationStatus=AppConstants.SUCCESSFUL;
//			BuyDetails buyDetails;
//	
//			
//			
//	
//			//User session
//			HttpSession userSession = httpServletRequest.getSession();
//			String jSessionId = userSession.getId();
//			String userId = (String)userSession.getAttribute("session");
//			List<Credential> credentailList =null;
//			Credential credential=null;
//			//url = url.replaceAll(";jsessionid=.*?(?=\\?|$)", "");
//			String sessionValidation = AppConstants.FAILED;
//			if(userId!=null){
//				SessionRecords sessionRecords=sessionUtil.getSessionRecordsFromMap(userId);
//				
//				 if(sessionRecords!=null && sessionRecords.getJsessionId()!=null && sessionRecords.getJsessionId().equals(jSessionId)){
//					 sessionValidation = AppConstants.SUCCESSFUL;
//					 credentailList = dbUtil.queryCredentialByUserId(userId);
//					 credential=credentailList.get(0);
//				 }
//				 
//			}
//	
//			//initialize buyDetails		
//			buyDetails = new BuyDetails();
//			if(credential!=null){
//				buyDetails.setFirstName((firstName==null)?credential.getFirstName():firstName);
//				buyDetails.setLastName((lastName==null)?credential.getLastName():lastName);
//				buyDetails.setUserNameEmail((userNameEmail==null)?credential.getUserNameEmail():userNameEmail);
//				
//				buyDetails.setCompany((company==null)?credential.getCompany():company);
//				buyDetails.setPhone((phone==null)?credential.getPhone():phone);
//				buyDetails.setMobile((mobile==null)?credential.getMobile():mobile);
//				buyDetails.setMessage(message);
//				buyDetails.setUserId(userId);
//			}else{
//				buyDetails.setFirstName(firstName);
//				buyDetails.setLastName(lastName);
//				buyDetails.setUserNameEmail(userNameEmail);
//				
//				buyDetails.setCompany(company);
//				buyDetails.setPhone(phone);
//				buyDetails.setMobile(mobile);
//				buyDetails.setMessage(message);
//				buyDetails.setUserId(userId);
//			}
//			
//			//Validate input
//			if((userNameEmail==null || userNameEmail.isEmpty())&& captcha_enabled_param==null
//					&&user_request_action_param!=null && user_request_action_param.equals("buy_user_action")){
//				validationStatus=AppConstants.FAILED;
//				modelUc.put("buyErrorUserNameEmail", "Please enter email address.");
//			}
//			if((firstName==null || firstName.isEmpty())&& captcha_enabled_param==null
//					&&user_request_action_param!=null && user_request_action_param.equals("buy_user_action")){
//				validationStatus=AppConstants.FAILED;
//				modelUc.put("buyErrorFirstName", "Please enter first name.");
//			}
//	
//			if((lastName==null || lastName.isEmpty()) && captcha_enabled_param==null
//					&&user_request_action_param!=null && user_request_action_param.equals("buy_user_action")){
//				validationStatus=AppConstants.FAILED;
//				modelUc.put("buyErrorLastName", "Please enter last name.");
//			}
//			
//	
//			modelUc = requestLogUtil.addOrUpdateRequestLogMap(httpServletRequest, modelUc);
//			captcha_enabled_param=(String)modelUc.get("captcha_enabled_param");
//			//First validate captcha
//			if(captcha_enabled_param!=null && captcha_enabled_param.equals("true")){
//				modelUc = passwordUtil.validateReCapthaResponse(httpServletRequest,modelUc);
//				modelUc.put("captcha_enabled_param", "true");
//			}
//	
//			
//			String reCaptchaValidation=(String) modelUc.get("reCaptchaValidation");
//			//Authenticate only if recaptcha validation has been successful
//			if(captcha_enabled_param!=null && captcha_enabled_param.equals("true") && 
//					reCaptchaValidation!=null && reCaptchaValidation.equals(AppConstants.SUCCESSFUL)
//					&&validationStatus.equals(AppConstants.SUCCESSFUL)
//					&& user_request_action_param!=null && user_request_action_param.equals("buy_user_action")){
//				//TODO: insertBuyDetail
//				dbUtil.updateBuyDetails(buyDetails);
//				SendMailTLS.sendMeEmail(buyDetails.getFirstName(), buyDetails.getLastName(), buyDetails.getUserNameEmail(), buyDetails.getCompany(), buyDetails.getMobile(),buyDetails.getPhone(),buyDetails.getMessage() );
////				if(sessionValidation.equals(AppConstants.SUCCESSFUL)){
////					modelView="/jsp/Buy.jsp.jsp";	
////				}else{
////					modelView="/jsp/Confirm.jsp";
////				}
//				modelUc.put("status", "SAVED");
//			}else if(captcha_enabled_param==null &&validationStatus.equals(AppConstants.SUCCESSFUL)
//					&&user_request_action_param!=null && user_request_action_param.equals("buy_user_action")){
//				//TODO: insertBuyDetail
//				dbUtil.updateBuyDetails(buyDetails);
//				SendMailTLS.sendMeEmail(buyDetails.getFirstName(), buyDetails.getLastName(), buyDetails.getUserNameEmail(), buyDetails.getCompany(), buyDetails.getMobile(),buyDetails.getPhone(),buyDetails.getMessage() );
////				if(sessionValidation.equals(AppConstants.SUCCESSFUL)){
////					modelView="/jsp/ConfirmUser.jsp";	
////				}else{
////					modelView="/jsp/Confirm.jsp";
////				}
//				modelUc.put("status", "SAVED");
//			}
//			if(userId!=null){
//				modelUc.put("loggedIn", "true");
//			}
//			modelUc.put("buyDetails", buyDetails);
//			modelUc.put("loginSuccessful", sessionValidation);
//			return new ModelAndView(modelView, "modelUc", modelUc);
//		}catch (Exception e){
//			e.printStackTrace();
//			String error="Unknown error..";
//			modelUc.put("error", error);
//			return new ModelAndView(modelView, "modelUc", modelUc);
//		}			
//
//	}
//
//}