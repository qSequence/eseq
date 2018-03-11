package com.enterprisesolutions.controller;

	import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.enterprisesequence.core.App;
import com.enterprisesequence.core.AppConstants;
import com.enterprisesequence.display.RequestResponseSystemSearch;
import com.enterprisesequence.display.UcDisplayObject;
import com.enterprisesequence.hibernate.model.UcSeqDiagram;
import com.enterprisesequence.hibernate.model.UcSeqMst;
import com.enterprisesolutions.display.util.DisplayUtil;

	@Service("getSeqUpdateController")
	public class GetSeqUpdateController implements Controller {

		
		@Autowired
		App app;
		@Autowired
		DisplayUtil displayUtil;
		@SuppressWarnings("rawtypes")
		public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
				HttpServletResponse httpServletResponse) throws Exception {
			Map<String, Object> modelUc = new HashMap<String, Object>();
			String modelView="/jsp/GetSeqUpdate.jsp";
			try{
				Map<String, Object> retMap= app.getSeqUpdateDisplay(httpServletRequest, httpServletResponse);
				String userRequestAction = (String)retMap.get("userRequestAction");
				UcSeqMst ucSeqMst = (UcSeqMst)retMap.get("ucSeqMst");
				String error = (String)retMap.get("error");
				String sessionValidation = (String)retMap.get("sessionValidation");
				String contextPath = (String)retMap.get("contextPath");
				String row_no_param = (String)retMap.get("row_no_param");
				String col_no_param = (String)retMap.get("col_no_param");
				String access = (String)retMap.get("access");//AppConstants.FULL_ACCESS_VIEW
				String userId = (String)retMap.get("userId");
				String sequenceVersion = (String)retMap.get("sequenceVersion");
				String CONTEXT_PATH = (String)retMap.get("CONTEXT_PATH");
				String isEdited = (String)retMap.get("isEdited");//Compute before sending back
				String role = (String)retMap.get("role");//Compute before sending back
				Map<String, RequestResponseSystemSearch> requestResponseSystemSearchMap = (Map<String, RequestResponseSystemSearch>)retMap.get("requestResponseSystemSearchMap");//Compute before sending back
				String toolTip = (String)retMap.get("toolTip");
				BigInteger sysSeqId= (BigInteger)retMap.get("sysSeqId");
				String forRequestId = (String)retMap.get("forRequestId");
				String seqdetDiv = (String)retMap.get("seqdetDiv");
				String  seqName= (String)retMap.get("seqName");
				String  seqDescription= (String)retMap.get("seqDescription");
				BigDecimal  seqMstId= (BigDecimal)retMap.get("seqMstId");
				
				List<UcSeqDiagram> rowMap = (List<UcSeqDiagram>)retMap.get("rowMap");
				modelUc.put("seqName",retMap.get("seqName"));
				modelUc.put("seqDescription",retMap.get("seqDescription"));
				modelUc.put("seqMstId",retMap.get("seqMstId"));
				
				modelUc.put("objectType",retMap.get("objectType"));
				modelUc.put("ucId",retMap.get("ucId"));
				modelUc.put("seqMstId",retMap.get("seqMstId"));
				modelUc.put("seqItemId",retMap.get("seqItemId"));
				modelUc.put("systemId",retMap.get("systemId"));
				modelUc.put("requestId",retMap.get("requestId"));
				modelUc.put("responseId",retMap.get("responseId"));
				modelUc.put("rowNo",retMap.get("rowNo"));
				modelUc.put("columnNo",retMap.get("columnNo"));
				modelUc.put("systemName",retMap.get("systemName"));
				modelUc.put("systemType",retMap.get("systemType"));
				modelUc.put("requestName",retMap.get("requestName"));
				modelUc.put("responseName",retMap.get("responseName"));
				modelUc.put("systemPropertiesFound",retMap.get("systemPropertiesFound"));
				modelUc.put("requestPropertiesFound",retMap.get("requestPropertiesFound"));
				modelUc.put("responsePropertiesFound",retMap.get("responsePropertiesFound"));
				modelUc.put("asynchSourceDestination",retMap.get("asynchSourceDestination"));
				modelUc.put("id",retMap.get("id"));
				
				
				List<List<UcDisplayObject>> ucDisplayDataRowList = null;
				if(userRequestAction.equals(AppConstants.SAVE_SYSTEM_NAME_ACTION)
						||userRequestAction.equals(AppConstants.UPDATE_UC_SEQ_DIAGRAM_ACTION)
						||userRequestAction.equals(AppConstants.COPY_AND_DIAPLAY_ACTION)){
					try{
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData((ucSeqMst == null) ? null : ucSeqMst.getSeqMstId(), rowMap, userRequestAction, contextPath, row_no_param, col_no_param, access, userId, sequenceVersion, isEdited, (ucSeqMst == null ||ucSeqMst.getOneWay()==null) ? AppConstants.N:ucSeqMst.getOneWay(), (ucSeqMst == null) ? null:ucSeqMst.getUcId(), CONTEXT_PATH);
					}catch (Exception e){
						e.printStackTrace();
						error="You do not have access to view/edit this sequence..";
					}
				}else if( sessionValidation.equals(AppConstants.SUCCESSFUL)){
					try{
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData( (ucSeqMst == null) ? null : ucSeqMst.getSeqMstId(), rowMap, userRequestAction, contextPath, row_no_param, col_no_param, access, userId, sequenceVersion, isEdited, (ucSeqMst == null || ucSeqMst.getOneWay()==null) ? AppConstants.N:ucSeqMst.getOneWay(), (ucSeqMst == null) ? null:ucSeqMst.getUcId(), CONTEXT_PATH);
					}catch (Exception e){
						e.printStackTrace();
						error="You do not have access to view/edit this sequence..";
					}
				}
						
				
				// TODO Auto-generated method stub
				if(toolTip!=null){
					modelUc.put("toolTip",toolTip);
				}
				
				if( sessionValidation.equals(AppConstants.FAILED)){
					//modelView= "/jsp/Login.jsp";
					
					modelUc.put("otherLoginError","Invalid session please login again.");
				}
				modelUc.put("userRequestAction", userRequestAction);
				modelUc.put("error", error);
				if(rowMap!=null){
					modelUc.put("numberOfRows", rowMap.size());
				}
				
				//modelUc.put("propertiesList", (List<UcDisplayObject>)appUtil.getPropertiesForAllSequences(rowMap));
				if((ucSeqMst!=null && ucSeqMst.getIsEdited() !=null && ucSeqMst.getIsEdited().equals(AppConstants.Y) && ucSeqMst.getEditedBy()!=null)|| (isEdited!=null && isEdited.equalsIgnoreCase(AppConstants.Y))){
					modelUc.put("editclass", "editable");
				}else{
					modelUc.put("editclass", "noteditable");
				}
				
				modelUc.put("sequenceVersion", sequenceVersion);
				modelUc.put("sysSeqId", sysSeqId);
				modelUc.put("forRequestId", forRequestId);
				modelUc.put("ucSeqMst", ucSeqMst);
				////TODO-ADD
				
				modelUc.put("loginSuccessful",sessionValidation);
				modelUc.put("role",role);
				modelUc.put("ucDisplayDataRowList", ucDisplayDataRowList);
				//this is used so that if the div is not found then the page will not get updated
				modelUc.put("seqdetDiv", seqdetDiv);
				
				modelUc.put("CONTEXT_PATH", httpServletRequest.getContextPath());
				System.out.println("----------$$$$$$$$$$$$$$$$$$----EndTime=" + new Date());
				return new ModelAndView(modelView, "modelUc", modelUc);
			}catch (Exception e){
				e.printStackTrace();
				String error=(e.getMessage()==null) ? "You do not have access to view/edit this sequence..":e.getMessage();
				UcSeqDiagram eu = new UcSeqDiagram();
				
	//			dbUtil.createUcSeqDiagramAudit( "GetSeqUpdate seqMstId : "+seqMstId+" - Exception : "+error, eu);
				
				modelUc.put("error", error);
				return new ModelAndView(modelView, "modelUc", modelUc);
			}
			
		}
		
}
