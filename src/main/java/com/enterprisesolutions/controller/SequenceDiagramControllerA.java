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
import com.enterprisesolutions.display.util.UcObjectEnum;

	@Service("sequenceDiagramControllerA")
	public class SequenceDiagramControllerA implements Controller {

		
		@Autowired
		App app;
		@Autowired
		DisplayUtil displayUtil;
		@SuppressWarnings("rawtypes")
		public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
				HttpServletResponse httpServletResponse) throws Exception {
			Map<String, Object> modelUc = new HashMap<String, Object>();
			String modelView="/jsp/SeqDetA.jsp";
			try{
			Map<String, Object> retMap= app.sequenceDiagramDisplay(httpServletRequest, httpServletResponse);
			
			String objectType=(String)retMap.get("objectType");
			modelUc.put("objectType", objectType);
			BigInteger ucId=(BigInteger)retMap.get("ucId");
			BigDecimal seqMstId=(BigDecimal)retMap.get("seqMstId");
			String seqItemId=(String)retMap.get("seqItemId");
			modelUc.put("seqItemId", seqItemId);
			String systemId=(String)retMap.get("systemId");
			modelUc.put("systemId", systemId);
			String requestId=(String)retMap.get("requestId");
			modelUc.put("requestId", requestId);
			String responseId=(String)retMap.get("responseId");
			modelUc.put("responseId", responseId);
			String rowNo=(String)retMap.get("rowNo");
			modelUc.put("rowNo", rowNo);
			String columnNo=(String)retMap.get("columnNo");
			modelUc.put("columnNo", columnNo);
			String systemName=(String)retMap.get("systemName");
			modelUc.put("systemName", systemName);
			String systemType=(String)retMap.get("systemType");
			modelUc.put("systemType", systemType);
			String requestName=(String)retMap.get("requestName");
			modelUc.put("requestName", requestName);
			String responseName=(String)retMap.get("responseName");
			modelUc.put("responseName", responseName);
			String systemPropertiesFound=(String)retMap.get("systemPropertiesFound");
			modelUc.put("systemPropertiesFound", systemPropertiesFound);
			String requestPropertiesFound=(String)retMap.get("requestPropertiesFound");
			modelUc.put("requestPropertiesFound", requestPropertiesFound);
			String responsePropertiesFound=(String)retMap.get("responsePropertiesFound");
			modelUc.put("responsePropertiesFound", responsePropertiesFound);
			String asynchSourceDestination=(String)retMap.get("asynchSourceDestination");
			modelUc.put("asynchSourceDestination", asynchSourceDestination);
			String id=(String)retMap.get("id");
			modelUc.put("id", id);
			boolean showSaveSequence=(Boolean)retMap.get("showSaveSequence");
			modelUc.put("showSaveSequence", showSaveSequence);
			String otherLoginError=(String)retMap.get("otherLoginError");
			modelUc.put("otherLoginError", otherLoginError);
			int numberOfRows=(Integer)retMap.get("numberOfRows");
			modelUc.put("numberOfRows", numberOfRows);
			String editclass=(String)retMap.get("editclass");
			modelUc.put("editclass", editclass);
			String editclassSeqName=(String)retMap.get("editclassSeqName");
			modelUc.put("editclassSeqName", editclassSeqName);
			String redirectUri=(String)retMap.get("redirectUri");
			String sessionValidation=(String)retMap.get("sessionValidation");
			String sequeneVersionTitle=(String)retMap.get("sequeneVersionTitle");
			String seqName=(String)retMap.get("seqName");
			String seqDescription=(String)retMap.get("seqDescription");
			String userRequestAction=(String)retMap.get("userRequestAction");
			UcSeqMst ucSeqMst=(UcSeqMst)retMap.get("ucSeqMst");
			String error=(String)retMap.get("error");
			String sequenceVersion=(String)retMap.get("sequenceVersion");
			String CONTEXT_PATH=(String)retMap.get("CONTEXT_PATH");
			String contextPath=(String)retMap.get("contextPath");
			String role=(String)retMap.get("role");
			String access=(String)retMap.get("access");
			modelUc.put("access", access);
			String isEdited=(String)retMap.get("isEdited");
			boolean readWriteAccess=(Boolean)retMap.get("readWriteAccess");
			String row_no_param = (String)retMap.get("row_no_param");
			String  col_no_param= (String)retMap.get("col_no_param");
			String  userId= (String)retMap.get("userId");
			String  oneWay= (String)retMap.get("oneWay");
			List<UcDisplayObject> menuList = (List<UcDisplayObject>)retMap.get("menuList");
			Map<String, RequestResponseSystemSearch> requestResponseSystemSearchMap=(Map<String, RequestResponseSystemSearch>)retMap.get("requestResponseSystemSearchMap");
			String toolTip=(String)retMap.get("toolTip");
			BigInteger sysSeqId=(BigInteger)retMap.get("sysSeqId");
			List<UcSeqDiagram> rowMap=(List<UcSeqDiagram>)retMap.get("rowMap");
			
			
			
			List<List<UcDisplayObject>> ucDisplayDataRowList = null;
			if(userRequestAction.equals(AppConstants.SAVE_SYSTEM_NAME_ACTION)
					||userRequestAction.equals(AppConstants.UPDATE_UC_SEQ_DIAGRAM_ACTION)){
				try{
					if(readWriteAccess==true){
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData( seqMstId, rowMap, userRequestAction, contextPath, row_no_param, col_no_param, AppConstants.FULL_ACCESS_VIEW, userId, sequenceVersion, isEdited, oneWay, ucId, CONTEXT_PATH);
					}else{
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData( seqMstId, rowMap, userRequestAction, contextPath, row_no_param, col_no_param, AppConstants.EXTERNAL_SOCIAL_VIEW, userId, sequenceVersion, isEdited, oneWay, ucId, CONTEXT_PATH);
					}
				}catch (Exception e){
					error="You do not have access to view/edit this sequence..";
				}
				BigInteger rowBig=new BigInteger((String)modelUc.get("rowNo"));
				BigInteger colBig=new BigInteger((String)modelUc.get("columnNo"));
				Map<String,UcDisplayObject> ucDisplayDataRowMap = displayUtil.findDisplayObject(ucDisplayDataRowList, rowBig, colBig);
				UcDisplayObject connectorObj = (UcDisplayObject)ucDisplayDataRowMap.get("connectorObj");
				UcDisplayObject sysObj = (UcDisplayObject)ucDisplayDataRowMap.get("sysObj");
				modelUc.put("TD_REPLACE_ID", "td_SYSTEM"+rowBig);
				if(connectorObj!=null && connectorObj.getUcObjectEnum()!=null 
						&& connectorObj.getUcObjectEnum().equals(UcObjectEnum.systemSystemTwoWayConnector)){
					modelUc.put("TABLE_REPLACE_ID", "table_SYSTEM_CONNECTOR"+rowBig);
				}else if(connectorObj!=null && connectorObj.getUcObjectEnum()!=null 
						&& connectorObj.getUcObjectEnum().equals(UcObjectEnum.systemSystemLastConnector)){
					modelUc.put("TABLE_REPLACE_ID", "table_SYSTEM_LAST_CONNECTOR"+rowBig);
				}
				
				modelUc.put("connectorObj", connectorObj);
				modelUc.put("sysObj", sysObj);
				
			}else if( sessionValidation.equals(AppConstants.SUCCESSFUL)){
				try{
					if(readWriteAccess==true){
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData( seqMstId, rowMap, userRequestAction, contextPath, row_no_param, col_no_param, AppConstants.FULL_ACCESS_VIEW, userId, sequenceVersion, isEdited, oneWay, ucId, CONTEXT_PATH);
					}else{
						ucDisplayDataRowList = displayUtil.generateSequenceDisplayData( seqMstId, rowMap, userRequestAction, contextPath, row_no_param, col_no_param, AppConstants.EXTERNAL_SOCIAL_VIEW, userId, sequenceVersion, isEdited, oneWay, ucId, CONTEXT_PATH);
					}
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
			modelUc.put("menuList", menuList);
			//modelUc.put("propertiesList", (List<UcDisplayObject>)appUtil.getPropertiesForAllSequences(rowMap));
			if((ucSeqMst!=null && ucSeqMst.getIsEdited() !=null && ucSeqMst.getIsEdited().equals(AppConstants.Y))&& readWriteAccess==true 
					|| (isEdited!=null && isEdited.equalsIgnoreCase(AppConstants.Y)) && readWriteAccess==true){
				modelUc.put("editclass", "editable");
				if(sequenceVersion !=null && sequenceVersion.equals(AppConstants.SYS_SEQ_DRAFT)){
					modelUc.put("editclassSeqName", "noteditable");
				}else{
					modelUc.put("editclassSeqName", "editable");
				}
			}else{
				modelUc.put("editclass", "noteditable");
				modelUc.put("editclassSeqName", "noteditable");
			}
			
			//Construct redirectUri
			
			modelUc.put("redirectUri", redirectUri); 
			modelUc.put("loginSuccessful", sessionValidation);
			modelUc.put("sequenceVersion", sequenceVersion);
			modelUc.put("sequeneVersionTitle", sequeneVersionTitle);
			modelUc.put("sysSeqId", sysSeqId);
			modelUc.put("ucSeqMst", ucSeqMst);
			
			modelUc.put("seqDescription", seqDescription);
			modelUc.put("isEdited", isEdited);
			modelUc.put("ucId", null);
			modelUc.put("seqMstId", seqMstId);
			modelUc.put("seqName", seqName);
			
			modelUc.put("ucDisplayDataRowList", ucDisplayDataRowList);
			modelUc.put("loginSuccessful",sessionValidation);
			modelUc.put("role",role);
			modelUc.put("CONTEXT_PATH", httpServletRequest.getContextPath());
			System.out.println("----------ERROR=" +modelUc.get("error"));
			System.out.println("----------$$$$$$$$$$$$$$$$$$SequenceDiagramControllerA----EndTime=" + new Date());
			return new ModelAndView(modelView, "modelUc", modelUc);
			
		}catch (Exception e){
			e.printStackTrace();
			String error=(e.getMessage()==null) ? "You do not have access to view/edit this sequence..":e.getMessage();

//			dbUtil.createUcSeqDiagramAudit( "SequenceDiagramControllerA seqMstId : "+seqMstId+" - Exception : "+error, eu);
			modelUc.put("error", error);
			return new ModelAndView(modelView, "modelUc", modelUc);
		}
			

	}
		

}
