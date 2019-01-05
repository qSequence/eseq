package com.enterprisesolutions.display.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enterprisesequence.core.Access;
import com.enterprisesequence.core.AppConstants;
import com.enterprisesequence.core.Util;
import com.enterprisesequence.display.UcDisplayObject;
import com.enterprisesolutions.display.util.UcObjectEnum;
import com.enterprisesequence.hibernate.model.UcSeqDiagram;
import com.enterprisesequence.hibernate.model.UcSeqDiagramDraft;
import com.enterprisesequence.hibernate.model.UcSystemMst;
import com.enterprisesequence.print.UcPrintComponentObject;

@Service("com.enterprisesolutions.display.util.DisplayUtil")
public class DisplayUtil {
	@Autowired
	Access access;
	@Autowired
	Util util;
    public UcDisplayObject getDisplayObjectForLastEditLink() {
        
        
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        StringBuilder sb = new StringBuilder ();
        sb.append("<!-- getDisplayObjectForLastEditLink -->");            
        sb.append("<td align=center valign=\"top\" height=\"");
        sb.append(AppConstants.CELL_HEIGHT);
        sb.append("\"");
        sb.append(" width=\"");
        sb.append(AppConstants.CELL_WIDTH);
        sb.append("\"");
        sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td colspan=\"2\">&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;");
        sb.append("&nbsp;");
        sb.append("</td></tr></table></td>");
        ucDisplayObject.setHtmlStr(sb.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.emptyColumn.toString());
        return ucDisplayObject;    
    }
    private UcDisplayObject getDisplayObjectForVerticalLineConnector(String colour, String boundary, String ifConditionBoundaryCOLOUR, boolean selected, int i, int j) {
        if (colour==null){
            colour="cyan";
        }// if colour == BLUE the it is the CROSS_OVER_LINE
        
        String selectTag="";
        if(selected){
            selectTag="<A NAME=\"selectedSeqItem\"></A>";
        }

        StringBuilder colouredBoundries = new StringBuilder();
        
        if(boundary!=null){
            String[] boundaryArray = boundary.split("----");

            colouredBoundries.append("style=\"");
            for(String boundryPart :boundaryArray){
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+ifConditionBoundaryCOLOUR+";");
            }
            colouredBoundries.append("\"");
        }
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder sb = new StringBuilder ();
        sb.append("<!-- getDisplayObjectForVerticalLineConnector colour:"+colour+" boundary:"+boundary+" ifConditionBoundaryCOLOUR:"+ifConditionBoundaryCOLOUR+" selected:"+selected+"-->");
//CHANGE THIS TD for SPACES        
        sb.append("<td align=center valign=\"top\" height=\"");
        sb.append(AppConstants.CELL_HEIGHT);
        sb.append("\"");
        sb.append(" width=\"");
        sb.append(AppConstants.CELL_WIDTH);
        sb.append("\"");
        sb.append(" ");
        sb.append(colouredBoundries);
        sb.append(">"+selectTag);
        sb.append("<table    id=\"");
        if(colour.equals("blue")){
            sb.append("table_CROSS_OVER_LINE");
        }else{
            sb.append("table_CONNECTOR");
        }
        sb.append(i);
        sb.append("\"    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\">         <tr>");
        
        //sb.append("<table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\">         <tr>");
        sb.append("<td>&nbsp;</td>");
        sb.append("<td style=\"border-left: ");
        // if colour == BLUE the it is the CROSS_OVER_LINE
        if(colour.equals("blue")){
            sb.append(AppConstants.CROSS_OVER_LINE_THICKNESS);
        }else{
            sb.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        }
        sb.append("px solid ");
        sb.append(colour);
        sb.append(";\">&nbsp;</td>");
        sb.append("<td>&nbsp;</td>");
        sb.append("<td>&nbsp;</td>");
        sb.append("</tr></table></td>");
        ucDisplayObject.setHtmlStr(sb.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.vertivalLineConnector.toString());
        return ucDisplayObject;        
    }
    
    private UcDisplayObject getDisplayObjectForSystemToSystemTwoWayConnector(BigDecimal seqMstId,String userId,BigInteger ucId, String isEdited, String oneWay, UcSeqDiagram ucSeqDiagram,String colour, String boundary, String ifConditionBoundaryCOLOUR, boolean selected, String displayView, String sequenceVersion, String CONTEXT_PATH) {
        if (colour==null){
            colour="cyan";
        }
        
        Map<BigInteger, String> requestAccess =access.getUserRequestAccess(userId);
		Map<BigInteger, String> systemAccess = access.getUserSystemAccess(userId);
		
        //set editable class only when editing
        String htmlClass="";
        if(isEdited!=null && isEdited.equals(AppConstants.Y) && !UcObjectEnum.sys_seq.toString().equalsIgnoreCase(ucSeqDiagram.getSystemType())){
            htmlClass = "editable";
        }else{
            htmlClass = "noteditable";
        }
        
        
        String selectTag="";
        if(selected){
            selectTag="<A NAME=\"selectedSeqItem\"></A>";
        }
        if(ucSeqDiagram.getRequest()==null){
            ucSeqDiagram.setRequest("Request");
        }
        if(ucSeqDiagram.getResponse()==null){
            ucSeqDiagram.setResponse("Response");
        }        
        
        StringBuilder colouredBoundries = new StringBuilder();
        if(boundary!=null){
        String[] boundaryArray = boundary.split("----");
        
        for(String boundryPart :boundaryArray){
            colouredBoundries.append("border-"+boundryPart+": 1px solid "+ifConditionBoundaryCOLOUR+";");
        }
        }
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<!-- getDisplayObjectForSystemToSystemTwoWayConnector row:"+ucSeqDiagram.getRowNo()+" column:"+ucSeqDiagram.getColNo()+" colour:"+colour+" boundary:"+boundary+" ifConditionBoundaryCOLOUR:"+ifConditionBoundaryCOLOUR+" selected:"+selected+"-->");
        htmlStr.append("<td align=center valign=\"top\" height=\"");
        htmlStr.append(AppConstants.CELL_HEIGHT);
        htmlStr.append("\"");
        htmlStr.append(" width=\"");
        htmlStr.append(AppConstants.CELL_WIDTH);
        htmlStr.append("\"");
        htmlStr.append(" style=\"");

        htmlStr.append(colouredBoundries);
        htmlStr.append("\">"+selectTag);
        htmlStr.append("<table    id=\"");
        htmlStr.append("table_SYSTEM_CONNECTOR");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("\"    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");

        //htmlStr.append("<table    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");
        htmlStr.append("<td>");

    //REQUEST        
    String requestIdPart1="prop_menu_view_request_SEPERATOR_";
    StringBuilder idPart2 = new StringBuilder();
    if(ucId!=null){
        idPart2.append(ucId);
    }
    idPart2.append("_SEPERATOR_");
    if(seqMstId!=null){
        idPart2.append(seqMstId);
    }
    idPart2.append("_SEPERATOR_");
    if(ucSeqDiagram.getSeqItemId()!=null){
        idPart2.append(ucSeqDiagram.getSeqItemId());
    }
    idPart2.append("_SEPERATOR_");
    if(ucSeqDiagram.getSystemId()!=null && ucSeqDiagram.getSystemId().intValue()!=0){
        idPart2.append(ucSeqDiagram.getSystemId());
    }
    idPart2.append("_SEPERATOR_");
    if(ucSeqDiagram.getRequestId()!=null && ucSeqDiagram.getRequestId().intValue()!=0){
        idPart2.append(ucSeqDiagram.getRequestId());
    }
    idPart2.append("_SEPERATOR_");
    if(ucSeqDiagram.getResponseId()!=null && ucSeqDiagram.getResponseId().intValue()!=0){
        idPart2.append(ucSeqDiagram.getResponseId());
    }
    idPart2.append("_SEPERATOR_");
    idPart2.append(ucSeqDiagram.getRowNo());
    idPart2.append("_SEPERATOR_");
    idPart2.append(ucSeqDiagram.getColNo());        
    idPart2.append("_SEPERATOR_");

    String systemName = (StringUtils.isNotEmpty(ucSeqDiagram.getSystemName())) ? ucSeqDiagram.getSystemName():"";
    systemName = systemName.replaceAll("\\s+", "");
    idPart2.append(systemName);
    idPart2.append("_SEPERATOR_");

    String requestIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
    String idPart4= "_SEPERATOR_";
    idPart4+=ucSeqDiagram.getSystemType();
    idPart4+= "_SEPERATOR_";
    idPart4+=ucSeqDiagram.getSysSeqId();
    if(ucSeqDiagram.getAsynchSourceDestination()!=null && displayView.equals(AppConstants.FULL_ACCESS_VIEW)
            &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
            && isEdited!=null && isEdited.equals(AppConstants.Y)){
        if(util.getAsynchPastePendingByUserId(userId)==null){
            htmlStr.append("<img class=\"mousetoHand\" title=\"Make Synch\" alt=\"Make Synch\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/synch.png\"");
        
            htmlStr.append(" onclick=\"updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');seqUpdate('update_to_synch_display_action', '"+sequenceVersion+"', "+seqMstId+",'null', '");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/GetSeqUpdate.htm',"+ucSeqDiagram.getSysSeqId()+");\"");
        
            htmlStr.append(" height=\"20\" width=\"20\">");
        }
    }else if (displayView.equals(AppConstants.FULL_ACCESS_VIEW)
            &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
            && isEdited!=null && isEdited.equals(AppConstants.Y)){
//        if(sequenceObject.getAsynchPastePendingByUserId(userId)==null){
//            htmlStr.append("<img class=\"mousetoHand\" title=\"Make Asynch\" alt=\"Make Asynch\" src=\"");
//            htmlStr.append(AppConstants.APP_CONTEXT);
//            htmlStr.append("/images/asynch.png\" ");
//            
//            htmlStr.append(" onclick=\"updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');seqUpdate('update_to_asynch_display_action', '"+sequenceVersion+"', "+seqMstId+",'null', '");
//            htmlStr.append(AppConstants.APP_CONTEXT);
//            htmlStr.append("/GetSeqUpdate.htm',"+ucSeqDiagram.getSysSeqId()+");\" ");
//            
//            htmlStr.append(" height=\"20\" width=\"20\">");
//        }
    }
    if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray") && requestAccess.get(ucSeqDiagram.getRequestId())!=null
            &&ucSeqDiagram.getSystemType()!=null 
            && ((requestAccess.get(ucSeqDiagram.getRequestId()).equals("RO") &&ucSeqDiagram.getSystemType().contains(AppConstants.SYS_SEQ))
            		||requestAccess.get(ucSeqDiagram.getRequestId()).equals("RW")||requestAccess.get(ucSeqDiagram.getRequestId()).equals("OW")
            	)
            && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
        htmlStr.append("<a  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
        htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
        htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2.toString()+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
    }else if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray")
            &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
        htmlStr.append("<img  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
        htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
        htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\"   height=\"20\" width=\"20\">");            

    }else if(ucSeqDiagram.getRequestPropertiesFound()!=null && requestAccess.get(ucSeqDiagram.getRequestId())!=null
            &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
        htmlStr.append("<a class=\"mousetoHand at\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationSS\" src=\"");
        htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
        htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2.toString()+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
    }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
    		&& requestAccess.get(ucSeqDiagram.getRequestId())!=null){
        htmlStr.append("<img class=\"mousetoHand\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationC\" src=\"");
        htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
        htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+requestIdPart1+idPart2.toString()+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\">");
    }else{
    	htmlStr.append("<img id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"Informationcheck\" src=\"");
        htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
        htmlStr.append("height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>\"");
    }
            
    htmlStr.append("</td>");
        
        htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" id=\"");
        //setting ID
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getSystemName());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getIfCondition());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getRequest());
        htmlStr.append("\" style=\"border-left: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid ");
        htmlStr.append(colour);
        htmlStr.append("; word-wrap:break-word;font-family:times;color:black;font-size:12px;\" ");

        
        //Add the request combogrid here
        htmlStr.append("oninput=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append("onclick=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append(">");
        htmlStr.append(ucSeqDiagram.getRequest());
        htmlStr.append("</td>");
        htmlStr.append("</tr><tr>");
        
        if(oneWay!=null && oneWay.equals(AppConstants.Y)){

            
            htmlStr.append("<td>");
            //RESPONSE
            
            htmlStr.append("&nbsp;</td>");
            htmlStr.append("<td class=\"noteditable\" colspan=\"3\" style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getRequestNew()!=null && ucSeqDiagram.getRequestNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            
            htmlStr.append(";border-left: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px    solid "+colour+"; word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
            //setting ID
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            //Commented below lines as I think the below are not needed
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getSystemName());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getIfCondition());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("\">&nbsp;");
            
            htmlStr.append("</td>");
            htmlStr.append("</tr><tr>");
            htmlStr.append("<td>&nbsp;</td>");
            htmlStr.append("<td style=\"border-left: ");
            
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px    solid ");
            htmlStr.append(colour);
            htmlStr.append(";\">&nbsp;</td>");
            htmlStr.append("<td>&nbsp;</td>");

            htmlStr.append("<td>&nbsp;</td>");
            
        }else{
            
            htmlStr.append("<td>");
            //RESPONSE
            //String responseIdPart1="prop_menu_view_response_GGGGGSEPERATOR_";
            String responseIdPart1="prop_menu_view_response_SEPERATOR_";
            
            String responseIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
    //        System.out.println("RESPONSE="+responseIdPart1+idPart2+responseIdPart3);
            if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray") && requestAccess.get(ucSeqDiagram.getRequestId())!=null
                    &&ucSeqDiagram.getSystemType()!=null && 
                		((requestAccess.get(ucSeqDiagram.getRequestId()).equals("RO") &&ucSeqDiagram.getSystemType().contains(AppConstants.SYS_SEQ))
                        		||requestAccess.get(ucSeqDiagram.getRequestId()).equals("RW")||requestAccess.get(ucSeqDiagram.getRequestId()).equals("OW")
                        	)
                    && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2.toString()+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray")
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<img  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\"   height=\"20\" width=\"20\">");                        
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
                    && requestAccess.get(ucSeqDiagram.getRequestId())!=null){
                htmlStr.append("<a class=\"mousetoHand at\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationSS\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2.toString()+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
            }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
            		&& requestAccess.get(ucSeqDiagram.getRequestId())!=null){
                htmlStr.append("<img class=\"mousetoHand\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationC\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+responseIdPart1+idPart2.toString()+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\">");
            }else{
            	htmlStr.append("<img  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"Informationcheck\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>\"");
            }
            
            
            htmlStr.append("&nbsp;</td>");
            htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getRequestNew()!=null && ucSeqDiagram.getRequestNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";border-left: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px    solid "+colour+"; word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
            //setting ID
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            //Commented below lines as I think they ar enot needed 25 th Oct
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getSystemName());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getIfCondition());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("\" ");
            //Add the request combogrid here
            htmlStr.append("oninput=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append("onclick=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append(">");
            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("</td>");
            htmlStr.append("</tr><tr>");
            htmlStr.append("<td>&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";border-left: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px    solid ");
            htmlStr.append(colour);
            htmlStr.append(";\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";\">&nbsp;</td>");
        }
        htmlStr.append("</tr></table></td>");
        
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.systemSystemTwoWayConnector.toString());
        return ucDisplayObject;        
    }
    private UcDisplayObject getDisplayObjectForSystemToSystemLastConnector(BigDecimal seqMstId,String userId,BigInteger ucId, String isEdited, String oneWay, UcSeqDiagram ucSeqDiagram,String colour, String boundary, String ifConditionBoundaryCOLOUR, boolean selected, String displayView, String sequenceVersion, String CONTEXT_PATH) {
        
    	Map<BigInteger, String> requestAccess =access.getUserRequestAccess(userId);
 		Map<BigInteger, String> systemAccess = access.getUserSystemAccess(userId);
    	if (colour==null){
            colour="cyan";
        }
        
        String htmlClass="";
        if(isEdited!=null && isEdited.equals(AppConstants.Y) && !UcObjectEnum.sys_seq.toString().equalsIgnoreCase(ucSeqDiagram.getSystemType())){
            htmlClass = "editable";
        }else{
            htmlClass = "noteditable";
        }
        
        String selectTag="";
        if(selected){
            selectTag="<A NAME=\"selectedSeqItem\"></A>";
        }
        if(ucSeqDiagram.getRequest()==null){
            ucSeqDiagram.setRequest("Request");
        }
        if(ucSeqDiagram.getResponse()==null){
            ucSeqDiagram.setResponse("Response");
        }        
        StringBuilder colouredBoundries = new StringBuilder();
        String tableTDStyle="";
        if(boundary!=null){
        String[] boundaryArray = boundary.split("----");
        for(String boundryPart :boundaryArray){
            
            if(!boundryPart.equals("bottom")){
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+ifConditionBoundaryCOLOUR+";");
            }else if(boundryPart.equals("bottom")){
                tableTDStyle="border-"+boundryPart+": 1px solid "+ifConditionBoundaryCOLOUR+";";
            }
            
        }
        }
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<!-- getDisplayObjectForSystemToSystemLastConnector row:"+ucSeqDiagram.getRowNo()+" column:"+ucSeqDiagram.getColNo()+" colour:"+colour+" boundary:"+boundary+" ifConditionBoundaryCOLOUR:"+ifConditionBoundaryCOLOUR+" selected:"+selected+"-->");
        htmlStr.append("<td align=center valign=\"top\" height=\"");
        htmlStr.append(AppConstants.CELL_HEIGHT);
        htmlStr.append("\"");
        htmlStr.append(" width=\"");
        htmlStr.append(AppConstants.CELL_WIDTH);
        htmlStr.append("\"");
        htmlStr.append(" style=\"");
        htmlStr.append(colouredBoundries);
        htmlStr.append("\">"+selectTag);
        
        htmlStr.append("<table    id=\"");
        htmlStr.append("table_SYSTEM_LAST_CONNECTOR");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("\"    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");

        
        //htmlStr.append("<table    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");
        htmlStr.append("<td>");

            //REQUEST        
            String requestIdPart1="prop_menu_view_request_SEPERATOR_";
            StringBuilder idPart2 = new StringBuilder();
            if(ucId!=null){
                idPart2.append(ucId);
            }
            idPart2.append("_SEPERATOR_");
            if(seqMstId!=null){
                idPart2.append(seqMstId);
            }
            idPart2.append("_SEPERATOR_");
            if(ucSeqDiagram.getSeqItemId()!=null){
                idPart2.append(ucSeqDiagram.getSeqItemId());
            }
            idPart2.append("_SEPERATOR_");
            if(ucSeqDiagram.getSystemId()!=null && ucSeqDiagram.getSystemId().intValue()!=0){
                idPart2.append(ucSeqDiagram.getSystemId());
            }
            idPart2.append("_SEPERATOR_");
            if(ucSeqDiagram.getRequestId()!=null && ucSeqDiagram.getRequestId().intValue()!=0){
                idPart2.append(ucSeqDiagram.getRequestId());
            }
            idPart2.append("_SEPERATOR_");
            if(ucSeqDiagram.getResponseId()!=null && ucSeqDiagram.getResponseId().intValue()!=0){
                idPart2.append(ucSeqDiagram.getResponseId());
            }
            idPart2.append("_SEPERATOR_");
            idPart2.append(ucSeqDiagram.getRowNo());
            idPart2.append("_SEPERATOR_");
            idPart2.append(ucSeqDiagram.getColNo());                
            idPart2.append("_SEPERATOR_");
            
            String systemName = (StringUtils.isNotEmpty(ucSeqDiagram.getSystemName())) ?ucSeqDiagram.getSystemName():"";
            systemName = systemName.replaceAll("\\s+", "");
            idPart2.append(systemName);
            idPart2.append("_SEPERATOR_");
            
            String requestIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
            String idPart4= "_SEPERATOR_";
            idPart4+=ucSeqDiagram.getSystemType();
            idPart4+= "_SEPERATOR_";
            idPart4+=ucSeqDiagram.getSysSeqId();
            if(ucSeqDiagram.getAsynchSourceDestination()!=null && displayView.equals(AppConstants.FULL_ACCESS_VIEW)
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
                    && isEdited!=null && isEdited.equals(AppConstants.Y)){
                if(util.getAsynchPastePendingByUserId(userId)==null){
                    htmlStr.append("<img class=\"mousetoHand\" title=\"Make Synch\" alt=\"Make Synch\" src=\"");
                    htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                    htmlStr.append("/images/synch.png\"     onclick=\"updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');seqUpdate('update_to_synch_display_action', '"+sequenceVersion+"', "+seqMstId+",'null', '");
                    htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                    htmlStr.append("/GetSeqUpdate.htm',"+ucSeqDiagram.getSysSeqId()+");\" height=\"20\" width=\"20\">");
                }
            }else if(displayView.equals(AppConstants.FULL_ACCESS_VIEW)
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
                    && isEdited!=null && isEdited.equals(AppConstants.Y)){
//                if(sequenceObject.getAsynchPastePendingByUserId(userId)==null){
//                    htmlStr.append("<img class=\"mousetoHand\" title=\"Make Asynch\" alt=\"Make Asynch\" src=\"");
//                    htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
//                    htmlStr.append("/images/asynch.png\"     onclick=\"updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');seqUpdate('update_to_asynch_display_action', '"+sequenceVersion+"', "+seqMstId+",'null', '");
//                    htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
//                    htmlStr.append("/GetSeqUpdate.htm',"+ucSeqDiagram.getSysSeqId()+");\" height=\"20\" width=\"20\">");
//                }
            }
            if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray") && requestAccess.get(ucSeqDiagram.getRequestId())!=null
            		&&((requestAccess.get(ucSeqDiagram.getRequestId()).equals("RO") &&ucSeqDiagram.getSystemType().contains(AppConstants.SYS_SEQ))
                    		||requestAccess.get(ucSeqDiagram.getRequestId()).equals("RW")||requestAccess.get(ucSeqDiagram.getRequestId()).equals("OW")
                    	)
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
            }else if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray")
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<img  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\"   height=\"20\" width=\"20\">");            
            }else if(ucSeqDiagram.getRequestPropertiesFound()!=null&& requestAccess.get(ucSeqDiagram.getRequestId())!=null
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a class=\"mousetoHand at\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationSS\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
            }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
            		&& requestAccess.get(ucSeqDiagram.getRequestId())!=null){
                htmlStr.append("<img class=\"mousetoHand\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationC\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\">");
            }else{
            	htmlStr.append("<img id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"Informationcheck\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>\"");
            }
                    
            htmlStr.append("</td>");

        htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" id=\"");
        //setting ID
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getSystemName());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getIfCondition());
//        htmlStr.append("----");
//        htmlStr.append(ucSeqDiagram.getRequest());
        htmlStr.append("\" style=\"border-left: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid ");
        htmlStr.append(colour);
        htmlStr.append("; word-wrap:break-word;font-family:times;color:black;font-size:12px;\" ");
        //Add the request combogrid here
        htmlStr.append("oninput=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append("onclick=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append(ucId);
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append(">");
        
        
        htmlStr.append(ucSeqDiagram.getRequest());
        htmlStr.append("</td>");
        htmlStr.append("</tr><tr>");

        if(oneWay!=null && oneWay.equals(AppConstants.Y)){
            //RESPONSE
            //String responseIdPart1="prop_menu_view_response_EEEEESEPERATOR_";    
            htmlStr.append("<td>&nbsp;</td>");

            htmlStr.append("<td class=\"noteditable\" colspan=\"3\" style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getRequestNew()!=null && ucSeqDiagram.getRequestNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            
            htmlStr.append("; word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
            //setting ID
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            //Commented below lines as I think they are not needed 25th Oct
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getSystemName());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getIfCondition());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("\">&nbsp;");

            htmlStr.append("</td>");
            htmlStr.append("</tr><tr>");
            htmlStr.append("<td style=\"");
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
    
            
            htmlStr.append("<td style=\"");
            
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"");
            
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"");
            
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");

        }else{
            //RESPONSE
            //String responseIdPart1="prop_menu_view_response_EEEEESEPERATOR_";    
            htmlStr.append("<td>");
            String responseIdPart1="prop_menu_view_response_SEPERATOR_";        
            String responseIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
    //        System.out.println("RESPONSE="+responseIdPart1+idPart2+responseIdPart3);

            if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray")  && requestAccess.get(ucSeqDiagram.getRequestId())!=null
                    &&ucSeqDiagram.getSystemType()!=null &&
                		((requestAccess.get(ucSeqDiagram.getRequestId()).equals("RO") &&ucSeqDiagram.getSystemType().contains(AppConstants.SYS_SEQ))
                        		||requestAccess.get(ucSeqDiagram.getRequestId()).equals("RW")||requestAccess.get(ucSeqDiagram.getRequestId()).equals("OW")
                        	)
                    && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray")
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<img  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\"   height=\"20\" width=\"20\">");            
                
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null  && requestAccess.get(ucSeqDiagram.getRequestId())!=null
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a class=\"mousetoHand at\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationSS\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
            }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())
            		 && requestAccess.get(ucSeqDiagram.getRequestId())!=null){
                htmlStr.append("<img class=\"mousetoHand\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationC\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+systemName+"');\" height=\"20\" width=\"20\">");
            }
            
            htmlStr.append("&nbsp;</td>");
            htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getRequestNew()!=null && ucSeqDiagram.getRequestNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";border-left: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px    solid "+colour+"; word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
            //setting ID
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            //Commented below lines as I think they are not needed 25th Oct
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getSystemName());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getIfCondition());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("\" ");
            //Add the request combogrid here
            htmlStr.append("oninput=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append("onclick=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append(ucId);
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append(">");
            
            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("</td>");
            htmlStr.append("</tr><tr>");
            htmlStr.append("<td style=\"");
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
    
            
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append(tableTDStyle);
            htmlStr.append("\">&nbsp;</td>");

        }//end if
        htmlStr.append("</tr></table></td>");
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.systemSystemLastConnector.toString());
        return ucDisplayObject;        
    
    }    

    private UcDisplayObject getDisplayObjectForSysSeqConnector(String isEdited, UcSeqDiagram ucSeqDiagram, String displayView, String sequenceVersion,String CONTEXT_PATH) {
    	String colour="cyan";
//        if (colour==null){
//            colour="cyan";
//        }
        
        String htmlClass="";
//        if(isEdited!=null && isEdited.equalsIgnoreCase(AppConstants.Y)){
//            htmlClass = "editable";
//        }else{
            htmlClass = "noteditable";//SYS_SEQ request & response will not be editable from here
//        }
        
        if(ucSeqDiagram.getRequest()==null){
            ucSeqDiagram.setRequest("Request");
        }
        if(ucSeqDiagram.getResponse()==null){
            ucSeqDiagram.setResponse("Response");
        }        
        
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<!-- getDisplayObjectForSysSeqConnector row:"+ucSeqDiagram.getRowNo()+" column:"+ucSeqDiagram.getColNo()+"-->");
        htmlStr.append("<td align=center valign=\"top\" height=\"");
        htmlStr.append(AppConstants.CELL_HEIGHT);
        htmlStr.append("\"");
        htmlStr.append(" width=\"");
        htmlStr.append(AppConstants.CELL_WIDTH);
        htmlStr.append("\"");
        htmlStr.append("\">");
        
        htmlStr.append("<table    id=\"");
        htmlStr.append("table_SYS_SEQ_CONNECTOR");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("\"    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");

        
        //htmlStr.append("<table    border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr>");
        htmlStr.append("<td>");

            
                    
            htmlStr.append("&nbsp;</td>");

        htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" style=\" word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
        //setting ID
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append("null");
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("\"");

        //Add the request combogrid here
        htmlStr.append("oninput=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append("null");
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append("onclick=\"updateSelectedComboGridForRequest('");
        htmlStr.append(UcObjectEnum.request);
        htmlStr.append("----");
        htmlStr.append("null");
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqMstId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSeqItemId());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getRowNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getColNo());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("----");
        htmlStr.append(ucSeqDiagram.getSysSeqId());
        htmlStr.append("', '");
        htmlStr.append(ucSeqDiagram.getSystemType());
        htmlStr.append("');\" ");
        htmlStr.append(">");
        
        //------
      //REQUEST        
        String requestIdPart1="prop_menu_view_request_SEPERATOR_";
        StringBuilder idPart2 = new StringBuilder();

        idPart2.append("");
        idPart2.append("_SEPERATOR_");
        if(ucSeqDiagram.getSeqMstId()!=null){
            idPart2.append(ucSeqDiagram.getSeqMstId());
        }
        idPart2.append("_SEPERATOR_");
        if(ucSeqDiagram.getSeqItemId()!=null){
            idPart2.append(ucSeqDiagram.getSeqItemId());
        }
        idPart2.append("_SEPERATOR_");
        if(ucSeqDiagram.getSystemId()!=null && ucSeqDiagram.getSystemId().intValue()!=0){
            idPart2.append(ucSeqDiagram.getSystemId());
        }
        idPart2.append("_SEPERATOR_");
        if(ucSeqDiagram.getRequestId()!=null && ucSeqDiagram.getRequestId().intValue()!=0){
            idPart2.append(ucSeqDiagram.getRequestId());
        }
        idPart2.append("_SEPERATOR_");
        if(ucSeqDiagram.getResponseId()!=null && ucSeqDiagram.getResponseId().intValue()!=0){
            idPart2.append(ucSeqDiagram.getResponseId());
        }
        idPart2.append("_SEPERATOR_");
        idPart2.append(ucSeqDiagram.getRowNo());
        idPart2.append("_SEPERATOR_");
        idPart2.append(ucSeqDiagram.getColNo());                
        idPart2.append("_SEPERATOR_");
        
        String systemName = ucSeqDiagram.getSystemName();
        systemName = systemName.replaceAll("\\s+", "");
        idPart2.append(systemName);
        idPart2.append("_SEPERATOR_");
        
        String requestIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
        String idPart4= "_SEPERATOR_";
        idPart4+=ucSeqDiagram.getSystemType();
        idPart4+= "_SEPERATOR_";
        idPart4+=ucSeqDiagram.getSysSeqId();
        
        if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray") && displayView.equals(AppConstants.FULL_ACCESS_VIEW)
                &&ucSeqDiagram.getSystemType()!=null &&  !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            htmlStr.append("<a  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
        }else if(ucSeqDiagram.getRequestPropertiesFound()!=null && ucSeqDiagram.getRequestPropertiesFound().contains("gray")
                &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            htmlStr.append("<img  id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\"   height=\"20\" width=\"20\">");            
        }else if(ucSeqDiagram.getRequestPropertiesFound()!=null
                &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            htmlStr.append("<a class=\"mousetoHand at\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationSS\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/"+ucSeqDiagram.getRequestPropertiesFound()+".png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
        }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            htmlStr.append("<img class=\"mousetoHand\" id=\"REQ_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationC\" src=\"");
            htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
            htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+requestIdPart1+idPart2+requestIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\">");
        }
        //-----
        htmlStr.append(ucSeqDiagram.getRequest());
        htmlStr.append("</td>");
        htmlStr.append("</tr><tr>");

            //RESPONSE
            //String responseIdPart1="prop_menu_view_response_EEEEESEPERATOR_";    
            htmlStr.append("<td>");
           
            
            htmlStr.append("&nbsp;</td>");
            htmlStr.append("<td class=\""+htmlClass+"\" colspan=\"3\" style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getRequestNew()!=null && ucSeqDiagram.getRequestNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append("; word-wrap:break-word; font-family:times;color:black;font-size:12px;\"  id=\"");
            //setting ID
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append("null");
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            //Commented below lines as I think they are not needed 25th Oct
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getSystemName());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getIfCondition());
//            htmlStr.append("----");
//            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("\" ");
            //Add the request combogrid here
            htmlStr.append("oninput=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append("null");
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append("onclick=\"updateSelectedComboGridForResponse('");
            htmlStr.append(UcObjectEnum.response);
            htmlStr.append("----");
            htmlStr.append("null");
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqMstId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSeqItemId());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getRowNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getColNo());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("----");
            htmlStr.append(ucSeqDiagram.getSysSeqId());
            htmlStr.append("', '");
            htmlStr.append(ucSeqDiagram.getSystemType());
            htmlStr.append("');\" ");
            htmlStr.append(">");
            //---
            String responseIdPart1="prop_menu_view_response_SEPERATOR_";        
            String responseIdPart3= ucSeqDiagram.getRequest()+"_SEPERATOR_"+ucSeqDiagram.getResponse();
    //        System.out.println("RESPONSE="+responseIdPart1+idPart2+responseIdPart3);

            if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray") && displayView.equals(AppConstants.FULL_ACCESS_VIEW)
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  class=\"mousetoHand info\" title=\"Information\" alt=\"InformationLL\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-info-circle\"></i></a>");
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null && ucSeqDiagram.getResponsePropertiesFound().contains("gray")
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<img  id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\" title=\"Information\" alt=\"InformationMM\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\"   height=\"20\" width=\"20\">");            
                
            }else if(ucSeqDiagram.getResponsePropertiesFound()!=null
                    &&ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<a class=\"mousetoHand at\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationSS\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/"+ucSeqDiagram.getResponsePropertiesFound()+".png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\"><i class=\"fas fa-at\"></i></a>");
            }else if(ucSeqDiagram.getSystemType()!=null && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString()) && !ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
                htmlStr.append("<img class=\"mousetoHand\" id=\"RES_"+ucSeqDiagram.getRowNo()+"_"+ucSeqDiagram.getColNo()+"\"  title=\"Information\" alt=\"InformationC\" src=\"");
                htmlStr.append((CONTEXT_PATH.equals("/") ? "":CONTEXT_PATH));
                htmlStr.append("/images/information_injection_gray.png\" onclick=\"showProperties('"+responseIdPart1+idPart2+responseIdPart3+idPart4+"', event);updateRwoCol( "+ucSeqDiagram.getSeqItemId()+", "+ucSeqDiagram.getRowNo()+", "+ucSeqDiagram.getColNo()+", '"+ucSeqDiagram.getAsynchSourceDestination()+"', '"+ucSeqDiagram.getSystemName()+"');\" height=\"20\" width=\"20\">");
            }
            //----
            htmlStr.append(ucSeqDiagram.getResponse());
            htmlStr.append("</td>");
            htmlStr.append("</tr><tr>");
            htmlStr.append("<td>&nbsp;</td>");
    
            
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append("\">&nbsp;</td>");
            htmlStr.append("<td style=\"border-top: ");
            htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
            htmlStr.append("px solid ");
//            if(ucSeqDiagram.getResponseNew()!=null && ucSeqDiagram.getResponseNew().equals(AppConstants.Y)
//                    &&displayView.equals(AppConstants.FULL_ACCESS_VIEW)){
//                htmlStr.append(AppConstants.NEW_REQUEST_RESPONSE_COLOUR); //NEW RESPONSE Colour
//            }else{
                htmlStr.append(colour);
//            }
            htmlStr.append(";");
            htmlStr.append("\">&nbsp;</td>");


        htmlStr.append("</tr></table></td>");
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.systemSystemLastConnector.toString());
        return ucDisplayObject;        
    
    }    
    private UcDisplayObject getDisplayObjectForTopCornerConnector() {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<td align=center valign=\"top\" height=\"100\" width=\"100\"><table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td style=\"border-top: ");

        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;border-left: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;"+UcObjectEnum.topCornerConnector+"</td></tr></table></td>");
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.topCornerConnector.toString());
        return ucDisplayObject;        
    }

    private UcDisplayObject getDisplayObjectForOddConnector() {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<td align=center valign=\"top\" height=\"100\" width=\"100\"><table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td style=\"border-left: ");
        
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;</td></tr><tr><td style=\"border-top: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;</td><td style=\"border-top: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;border-left: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;"+UcObjectEnum.oddConnector+"</td></tr></table></td>");
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.oddConnector.toString());
        
        return ucDisplayObject;        
    }

    private UcDisplayObject getDisplayObjectForBottomCornerConnector() {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        StringBuilder htmlStr = new StringBuilder();
        htmlStr.append("<td align=center valign=\"top\" height=\"100\" width=\"100\"><table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td style=\"border-left: ");

        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;</td></tr><tr><td>&nbsp;</td><td style=\"border-top: ");
        htmlStr.append(AppConstants.REQUEST_RESPONSE_LINE_THICKNESS);
        htmlStr.append("px solid cyan;\">&nbsp;"+UcObjectEnum.bottomCornerConnector+"</td></tr></table></td>");
        ucDisplayObject.setHtmlStr(htmlStr.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.bottomCornerConnector.toString());
        return ucDisplayObject;    
    }
    
    private UcDisplayObject getDisplayObjectForComponentEmptyColumn(String height, String width) {
        
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        StringBuilder sb = new StringBuilder ();
        //sb.append("<!-- getDisplayObjectForComponentEmptyColumn height:"+height+" width:"+width+"  -->");
        sb.append("<td align=center valign=\"top\" height=\"");
        sb.append(height);
        sb.append("\"");
        sb.append(" width=\"");
        sb.append(width);
        sb.append("\"");
        sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;");
        sb.append("</td></tr></table></td>");
        ucDisplayObject.setHtmlStr(sb.toString());
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.emptyColumn.toString());
        return ucDisplayObject;    
    }
    

    private UcDisplayObject getDisplayObjectForEmptyColumn(boolean selected, boolean fixedLengthColumn, boolean lastColumn, boolean lastRow, boolean asynch, int row, int col, String asynchRequest) {
        /*
         * boolean lastColumn, boolean lastRow
         *
         * are added to make these row/column 100% as it does not display properly on IE
         *  
         */
        
        String selectTag="";
        if(selected){
            selectTag="<A NAME=\"selectedSeqItem\"></A>";
        }

        
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        StringBuilder sb = new StringBuilder ();
        sb.append("<!-- getDisplayObjectForEmptyColumn fixedLengthColumn:"+fixedLengthColumn+" lastColumn:"+lastColumn+"  lastRow:"+lastRow+"-->");
        if(fixedLengthColumn){
            if(asynch){
                sb.append("<td style=\"border-right: 4px dashed gray;border-left: 4px dashed gray;\"  align=center valign=\"top\" height=\"");
            }else{
                sb.append("<td align=center valign=\"top\" height=\"");
            }
            if(lastRow){
                sb.append("100%");
            }else{
                sb.append(AppConstants.CELL_HEIGHT);
            }
            sb.append("\"");
            sb.append(" width=\"");
            if(lastColumn){
                //This is needed so all the columns have even width except thelast column
                sb.append("100%");
            }else{
                sb.append(AppConstants.CELL_WIDTH);
            }
            sb.append("\"");
            if(asynch){//<tr><td>&nbsp;</td><td>&nbsp;
                sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td colspan=\"2\"><font color=\"#D8D8D8\"> Processing "+asynchRequest+"</font></td></tr>");
//                sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td colspan=\"2\"><font color=\"#D8D8D8\"> Processing "+asynchRequest+" ROW:"+row+" COL:"+col+"</font></td></tr>");
            }else{
                sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td>&nbsp;" +"</td></tr>");
//                sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td>&nbsp; ROW:"+row+" COL:"+col+"</td></tr>");
            }
            //sb.append(selectTag+"&nbsp;");
            sb.append("</table></td>");
            ucDisplayObject.setHtmlStr(sb.toString());
        }else{
            if(asynch){
                sb.append("<td style=\"border-right: 4px dashed gray;border-left: 4px dashed gray;\"  align=center valign=\"top\" height=\"");
            }else{
                sb.append("<td align=center valign=\"top\" height=\"");
            }

            if(lastRow){
                sb.append("100%");
            }else{
                sb.append(AppConstants.CELL_HEIGHT);
            }
            sb.append("\"");
            sb.append(" width=\"");
            if(lastColumn){
                //This is needed so all the columns have even width except thelast column
                sb.append("100%");
            }else{
                sb.append(AppConstants.CELL_WIDTH);
            }
            sb.append("\"");

            sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>");
//            sb.append("><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;row"+row+" -col="+col+"</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>");
            sb.append(selectTag+"&nbsp;");
            sb.append("</td></tr></table></td>");
            ucDisplayObject.setHtmlStr(sb.toString());
            
        }
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.emptyColumn.toString());
        return ucDisplayObject;    
    }

    private UcDisplayObject getDisplayObjectForEvenConnector() {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        ucDisplayObject.setHtmlStr("<td align=center valign=\"top\" height=\"100\" width=\"100\"><table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td><td style=\"border-left: 1px solid cyan;\">&nbsp;</td></tr><tr><td style=\"border-top: 1px solid cyan;\">&nbsp;</td><td  style=\"border-left: 1px solid cyan;\">&nbsp;"+UcObjectEnum.evenConnector+"</td></tr></table></td>");
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.evenConnector.toString());
        return ucDisplayObject;    
    }


    private UcDisplayObject getDisplayObjectForRightArrow() {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        //convention use the 2nd TD from 2nd TR for lines, then 1st TD from 2nd TR
        ucDisplayObject.setHtmlStr("<td align=center valign=\"top\" class=\"minfield\"><table  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td>&nbsp;</td></tr><tr><td style=\"border-top: 1px solid cyan;\">&nbsp;"+UcObjectEnum.rightArrow+"</td></tr></table></td>");
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.rightArrow.toString());
        return ucDisplayObject;    
        }
    private UcDisplayObject getUcDisplayObjectForSystem(UcSeqDiagram ucSeqDiagram, String contextPath, String view) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setDisplayName(ucSeqDiagram.getSystemName());

        if(ucSeqDiagram.getAsynchSourceDestination()!=null && ucSeqDiagram.getAsynchSourceDestination().equals(AppConstants.SOURCE) ){
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.asynchSource.toString());
        }else if(ucSeqDiagram.getAsynchSourceDestination()!=null && ucSeqDiagram.getAsynchSourceDestination().equals(AppConstants.DESTINATION) ){
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.asynchDestination.toString());
        }else{
            if(ucSeqDiagram.getRowNo().intValue()==AppConstants.FIRST_SEQUENCE_POSITION_ROW_NO.intValue()
                    && ucSeqDiagram.getColNo().intValue()==AppConstants.FIRST_SEQUENCE_POSITION_COL_NO.intValue()){
                ucDisplayObject.setUcObjectEnum(UcObjectEnum.system13.toString());
            }else{
                ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());
            }
        }
        

        StringBuilder colouredBoundries = new StringBuilder();
        
//        if(ucSeqDiagram.getSystemNew()!= null && ucSeqDiagram.getSystemNew().equals(AppConstants.Y)
//                &&view.equals(AppConstants.FULL_ACCESS_VIEW)){
//            colouredBoundries.append("border-right: 1px solid red;");
//            colouredBoundries.append("border-left: 1px solid red;");
//            colouredBoundries.append("border-top: 1px solid red;");
//            colouredBoundries.append("border-bottom: 1px solid red;");
//        }
        
//        if(ucSeqDiagram.getAsynchSourceDestination()!=null
//                &&ucSeqDiagram.getAsynchSourceDestination().equals(AppConstants.SOURCE)){
//            colouredBoundries.append("border-right: 4px dashed gray;");
//            colouredBoundries.append("border-left: 4px dashed gray;");
//            colouredBoundries.append("border-top: 4px dashed gray;");
//        }else if (ucSeqDiagram.getAsynchSourceDestination()!=null
//                &&ucSeqDiagram.getAsynchSourceDestination().equals(AppConstants.DESTINATION)){
//            colouredBoundries.append("border-right: 4px dashed gray;");
//            colouredBoundries.append("border-left: 4px dashed gray;");
//            colouredBoundries.append("border-bottom: 4px dashed gray;");
//        }
        
        
        colouredBoundries.append("background-image: url('");
        if(ucSeqDiagram.getSystemType()!=null && ucSeqDiagram.getSystemType().contains(UcObjectEnum.custom.toString()+"_")){
            colouredBoundries.append(ucSeqDiagram.getMenuImageUrl());
        }else if(ucSeqDiagram!=null && ucSeqDiagram.getSystemType()!=null){
            colouredBoundries.append(contextPath);
            colouredBoundries.append("/images/");
            if(StringUtils.containsIgnoreCase(ucSeqDiagram.getSystemType(), AppConstants.SYS_SEQ)){
            	colouredBoundries.append(AppConstants.SYS_SEQ+".png");
            }else{
            	colouredBoundries.append(ucSeqDiagram.getSystemType()+".png");
            }
        }else{
            colouredBoundries.append(contextPath);
            colouredBoundries.append("/images/");
            colouredBoundries.append(AppConstants.SYSTEM_DEFAULT_IMAGE);
        }
        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        
        ucDisplayObject.setUcSeqDiagram(ucSeqDiagram);
        return ucDisplayObject;
    }    

//    //Set the row and column to 1 as this is only called for 1st row column of any sequence
//    private UcDisplayObject getUcDisplayObjectForSystem(UcSeqMst ucSeqMst, String contextPath, String userId, String view) {
//        UcDisplayObject ucDisplayObject = new UcDisplayObject();/////11111111111111111111111
//
//        ucDisplayObject.setDisplayName(ucSeqMst.getSystemName());
//
//        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system11);
//
//        StringBuilder colouredBoundries = new StringBuilder();
//        if(AppConstants.COLOURED_BOUNDRIES_ENABLED_FOR_SYSTEM){
//            colouredBoundries.append("border-right: 1px solid black;");
//            colouredBoundries.append("border-left: 1px solid black;");
//            colouredBoundries.append("border-top: 1px solid black;");
//            colouredBoundries.append("border-bottom: 1px solid black;");
//        }
//        colouredBoundries.append("background-image: url('");
//        if(ucSeqMst.getSystemType()!=null && ucSeqMst.getSystemType().contains(UcObjectEnum.custom.toString()+"_")){
//            colouredBoundries.append(ucSeqMst.getMenuImageUrl());
//        }else if(ucSeqMst!=null && ucSeqMst.getSystemType()!=null){
//            colouredBoundries.append(contextPath);
//            colouredBoundries.append("/images/");
//        
//            colouredBoundries.append(ucSeqMst.getSystemType()+".png");
//        }else{
//            colouredBoundries.append(contextPath);
//            colouredBoundries.append("/images/");
//            colouredBoundries.append(AppConstants.SYSTEM_DEFAULT_IMAGE);
//        }
//        colouredBoundries.append("');");
//        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;");
//        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
//        
//        
//        UcSeqDiagram ucSeqDiagram = new UcSeqDiagram();
//        ucSeqDiagram.setSystemType(ucSeqMst.getSystemType());
//        ucSeqDiagram.setSystemName(ucSeqMst.getSystemName());
//        ucSeqDiagram.setSystemId(ucSeqMst.getSystemId());
//        //PROPERTIES -- see if there are properties for the first element
//        List<UcSeqDiagramProperty> ucSeqDiagramPropertyList = dbUtil.getPropertyList(ucSeqMst.getSystemId().toString(), userId, UcObjectEnum.system.toString(), view);
//        //Adding PROPERTIES from Map, these are the newly added, with seqItemId=0
//        if(propertiesObject.getProperties(userId,converterUtil.convertBigDecimalToBigInteger(ucSeqMst.getSeqMstId()), AppConstants.CUSTOMER_SEQUENCE_POSITION_ROW_NO, AppConstants.CUSTOMER_SEQUENCE_POSITION_COL_NO, UcObjectEnum.system.toString().toUpperCase())!=null){
//            ucSeqDiagramPropertyList.addAll(propertiesObject.getProperties(userId,converterUtil.convertBigDecimalToBigInteger(ucSeqMst.getSeqMstId()), AppConstants.CUSTOMER_SEQUENCE_POSITION_ROW_NO, AppConstants.CUSTOMER_SEQUENCE_POSITION_COL_NO, UcObjectEnum.system.toString().toUpperCase()));
//        }
//        if((ucSeqDiagramPropertyList==null ||ucSeqDiagramPropertyList.isEmpty())){//&&ucSeqMst.getSeqDescription()==null){//TODO2705: This condition should be system description check
//            ucSeqDiagram.setSystemPropertiesFound(AppConstants.INFORMATION_INJECTION_GRAY);
//        }else{
//            ucSeqDiagram.setSystemPropertiesFound(AppConstants.INFORMATION_INJECTION);
//        }
//
//        ucSeqDiagram.setSeqMstId(converterUtil.convertBigDecimalToBigInteger(ucSeqMst.getSeqMstId()));
//        //Set the row and column to 1 as this is only called for 1st row column of any sequence
//        ucSeqDiagram.setColNo(AppConstants.CUSTOMER_SEQUENCE_POSITION_COL_NO);
//        ucSeqDiagram.setRowNo(AppConstants.CUSTOMER_SEQUENCE_POSITION_ROW_NO);
//        
//        ucDisplayObject.setUcSeqDiagram(ucSeqDiagram );
//
//        return ucDisplayObject;
//    }
    
    private UcDisplayObject getDisplayObjectForIfConditionBoundary(String boundary, String colour, boolean selected, int i) {
        String selectTag="";
        if(selected){
            selectTag="<A NAME=\"selectedSeqItem\"></A>";
        }

        String[] boundaryArray = boundary.split("----");
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.ifConditionBoundary.toString());
        StringBuilder colouredBoundries = new StringBuilder();
        String tableTDStyle="";
        for(String boundryPart :boundaryArray){
            //do not want to put the bottom if boundry on the TD as the UI adds a space , so the if condition, will add this inside the table TD
            if(!boundryPart.equals("bottom")){
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+colour+";");
            }else if(boundryPart.equals("bottom")){
                tableTDStyle="border-"+boundryPart+": 1px solid "+colour+";";
            }
        }
        

        ucDisplayObject.setHtmlStr("<!-- CHANGED_getDisplayObjectForIfConditionBoundary --> <td style=\""+colouredBoundries+"\" width=\""+ AppConstants.CELL_WIDTH+"\" height=\""+ AppConstants.CELL_HEIGHT+"\" align=center valign=\"top\" class=\"minfield\"><table id=\"table_IF_BORDER"+i+"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  height=\"100%\" width=\"100%\"><tr><td style=\""+tableTDStyle+"\">"+selectTag+"&nbsp;</td></tr></table></td>");

        return ucDisplayObject;
    }
    
    //This system is within the IF condition
    private UcDisplayObject getUcDisplayObjectForSystemIfItem(UcSeqDiagram ucSeqDiagram,String boundary, String colour,String contextPath, String view) {
        
        String[] boundaryArray = boundary.split("----");
        boolean foundBoundaryTop=false;
        boolean foundBoundaryBottom=false;
        boolean foundBoundaryLeft=false;
        boolean foundBoundaryRight=false;
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setDisplayName(ucSeqDiagram.getSystemName());


        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());
        StringBuilder colouredBoundries = new StringBuilder();
        for(String boundryPart :boundaryArray){
            if(boundryPart.equals("right")){
                foundBoundaryRight=true;
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+colour+";");
            }
            if(boundryPart.equals("left")){
                foundBoundaryLeft=true;
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+colour+";");                
            }
            if(boundryPart.equals("top")){
                foundBoundaryTop=true;
                colouredBoundries.append("border-"+boundryPart+": 1px solid "+colour+";");                
            }
            //NOT appending colouredBoundries for BOTTOM as this is to fix UI will move this boundry into TD inside the table
            if(boundryPart.equals("bottom")){
                foundBoundaryBottom=true;
                ucDisplayObject.setBottomBorberHtmlStyle("border-"+boundryPart+": 1px solid "+colour+";");
            }

        }
//        if(foundBoundaryRight==false && ucSeqDiagram.getSystemNew()!= null && ucSeqDiagram.getSystemNew().equals(AppConstants.Y)
//                &&view.equals(AppConstants.FULL_ACCESS_VIEW)){
//            colouredBoundries.append("border-right: 1px solid red;");
//        }
//        if(foundBoundaryLeft==false  && ucSeqDiagram.getSystemNew()!= null && ucSeqDiagram.getSystemNew().equals(AppConstants.Y)
//                &&view.equals(AppConstants.FULL_ACCESS_VIEW)){
//            colouredBoundries.append("border-left: 1px solid red;");
//        }
//        if(foundBoundaryTop==false  && ucSeqDiagram.getSystemNew()!= null && ucSeqDiagram.getSystemNew().equals(AppConstants.Y)
//                &&view.equals(AppConstants.FULL_ACCESS_VIEW)){
//            colouredBoundries.append("border-top: 1px solid red;");
//        }
//        if(foundBoundaryBottom==false  && ucSeqDiagram.getSystemNew()!= null && ucSeqDiagram.getSystemNew().equals(AppConstants.Y)
//                &&view.equals(AppConstants.FULL_ACCESS_VIEW)){
//            colouredBoundries.append("border-bottom: 1px solid red;");
//        }
        colouredBoundries.append("background-image: url('");
        
        if(ucSeqDiagram.getSystemType()!=null && ucSeqDiagram.getSystemType().contains(UcObjectEnum.custom.toString()+"_")){
            colouredBoundries.append(ucSeqDiagram.getMenuImageUrl());
        }else if(ucSeqDiagram!=null && ucSeqDiagram.getSystemType()!=null){
            colouredBoundries.append(contextPath);
            colouredBoundries.append("/images/");
            if(StringUtils.containsIgnoreCase(ucSeqDiagram.getSystemType(), AppConstants.SYS_SEQ)){
            	colouredBoundries.append(AppConstants.SYS_SEQ+".png");
            }else{
            	colouredBoundries.append(ucSeqDiagram.getSystemType()+".png");
            }
        }else{
            colouredBoundries.append(contextPath);
            colouredBoundries.append("/images/");
            colouredBoundries.append(AppConstants.SYSTEM_DEFAULT_IMAGE);
        }
        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center; background-size: contain;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");

        
        ucDisplayObject.setUcSeqDiagram(ucSeqDiagram);
        return ucDisplayObject;
    }    
    
    //This IF_CONDITION has children    
    private UcDisplayObject getUcDisplayObjectForIfAndSectionWithChildren(String colspan, UcSeqDiagram ucSeqDiagram, String colour, boolean selected) {

        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        if(ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString())){
            ucDisplayObject.setDisplayName(ucSeqDiagram.getIfCondition());
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.ifCondition.toString());
        }else if(ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            ucDisplayObject.setDisplayName(ucSeqDiagram.getSectionName());
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.sequenceSection.toString());
        }
        if(selected){
            ucSeqDiagram.setSelected("true");
        }else{
            ucSeqDiagram.setSelected("false");
        }
        
                
        ucDisplayObject.setHtmlStr(colspan+" style=\" border-left: 1px solid  "+colour+"; border-right: 1px solid  "+colour+"; border-top: 1px solid  "+colour+";\"");
        ucDisplayObject.setUcSeqDiagram(ucSeqDiagram);
        return ucDisplayObject;
    }

    private UcDisplayObject getUcDisplayObjectForIfAndSectionWithOutChildren(UcSeqDiagram ucSeqDiagram, String colour) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        if(ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_IF.toString())){
            ucDisplayObject.setDisplayName(ucSeqDiagram.getIfCondition());
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.ifCondition.toString());
        }else if(ucSeqDiagram.getSystemType().contains(UcObjectEnum.SEQ_SECTION.toString())){
            ucDisplayObject.setDisplayName(ucSeqDiagram.getSectionName());
            ucDisplayObject.setUcObjectEnum(UcObjectEnum.sequenceSection.toString());
        }
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.ifCondition.toString());
        //NOT appending colouredBoundries for BOTTOM as this is to fix UI will move this boundry into TD inside the table
        //ucDisplayObject.setHtmlStr("style=\" border-left: 1px solid  "+colour+"; border-right: 1px solid  "+colour+"; border-bottom: 1px solid  "+colour+";\"");
        ucDisplayObject.setHtmlStr(" style=\" border-left: 1px solid  "+colour+"; border-right: 1px solid  "+colour+"; border-top: 1px solid  "+colour+";\"");
        ucDisplayObject.setBottomBorberHtmlStyle("border-bottom: 1px solid  "+colour+";\"");
        ucDisplayObject.setUcSeqDiagram(ucSeqDiagram);
        return ucDisplayObject;
    }
    
    public List<List<UcDisplayObject>> generateComponentDiagram(
            UcSystemMst ucSystemMst,
            Map<BigInteger, Map<BigInteger, UcPrintComponentObject>> printComponentObjectListMapBySystemId,
            Map<BigInteger, UcSystemMst> ucSystemMapBySystemId, String contextPath) throws Exception {
        if(ucSystemMst!=null && ucSystemMst.getSystemId()!=null
                &&(ucSystemMst.getSystemId().intValue()==26)){
//            System.out.println("kkjdfkj");
        }
        String height="50";
        String width="75";
        // validate
        if (ucSystemMst == null ||printComponentObjectListMapBySystemId==null) {
            throw new Exception("Please select appropriate sequence to Display...");
        }        
        
        /*         Initialise variables
         *
         */
        BigInteger bigIntegerSystemId = util.convertBigDecimalToBigInteger(ucSystemMst.getSystemId());
        int numberOfRows=0;           //This variable is used to define the initial row size of the sequence
        
        Map<String, Object> returnObject = util.findNoOfRowsInDiagramAndSourceTargetMap(printComponentObjectListMapBySystemId, ucSystemMst, ucSystemMapBySystemId);
        Map<String, List<String>> parentSystemMap = (Map<String, List<String>>)returnObject.get("parentSystemMap");
        Map<String, List<String>> childSystemMap = (Map<String, List<String>>)returnObject.get("childSystemMap");

        int noOfChildRowsInDiagram =  childSystemMap.size();
        int noOfParentRowsInDiagram =parentSystemMap.size();
        int noOfRowsInDiagram = 0;
        if(noOfChildRowsInDiagram> noOfParentRowsInDiagram){
            noOfRowsInDiagram= noOfChildRowsInDiagram;
        }else{
            noOfRowsInDiagram= noOfParentRowsInDiagram;
        }
        if(noOfRowsInDiagram+2>numberOfRows){
            numberOfRows=noOfRowsInDiagram+3;               //-----Initialise based on input parameters
        }
        int numberOfColumns=7;        //This variable is used to define the initial column size of the sequence
        
        //find row positions for diagram
        //Step 1: Find center row of the diagram
        int centerRow = 0;
        String centerRowPosition=AppConstants.ODD;
        if(numberOfRows % 2 == 0){
            centerRowPosition=AppConstants.EVEN;
            centerRow = numberOfRows/2;
        }else{
            centerRowPosition=AppConstants.ODD;
            centerRow = numberOfRows/2;
            centerRow+=1;
        }
        
        //Step2 find parent start row position
        int parentStartRow = 0;
        String parentCenterRowPosition=AppConstants.ODD;
        if(noOfParentRowsInDiagram % 2 ==0){
            parentCenterRowPosition=AppConstants.EVEN;
            parentStartRow= centerRow-noOfParentRowsInDiagram/2;
        }else{
            parentStartRow= centerRow-noOfParentRowsInDiagram/2;
            parentCenterRowPosition=AppConstants.ODD;
        }
        
        //Step3 find child start row position
        int childStartRow = 0;
        String childCenterRowPosition=AppConstants.ODD;
        if(noOfChildRowsInDiagram % 2 ==0){
            childCenterRowPosition=AppConstants.EVEN;
            childStartRow= centerRow-noOfChildRowsInDiagram/2;
        }else{
            childStartRow= centerRow-noOfChildRowsInDiagram/2;
            childCenterRowPosition=AppConstants.ODD;
        }
        
        
        
        Iterator<Entry<String, List<String>>> parentSystemItr = parentSystemMap.entrySet().iterator();
        Iterator<Entry<String, List<String>>> childSystemItr = childSystemMap.entrySet().iterator();
        
        
        
        List<List<UcDisplayObject>> ucDisplayDataRowList = new ArrayList<List<UcDisplayObject>>();
        
        List<UcDisplayObject> ucDisplayDataColumnEmptyList=new ArrayList<UcDisplayObject>(11);
        for(int i=1;i<=numberOfColumns;i++){
            ucDisplayDataColumnEmptyList.add(getDisplayObjectForComponentEmptyColumn(height,width));
        }
        ucDisplayDataRowList.add(ucDisplayDataColumnEmptyList);
        for(int row=2;row<=numberOfRows; row++){
            List<UcDisplayObject> ucDisplayDataColumnList=new ArrayList<UcDisplayObject>(11);
            //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 1 - empty
            String systemName ="";
            //Step 1 : process the parent
            if(row >= parentStartRow){
                if(row==centerRow && parentCenterRowPosition==AppConstants.EVEN){
                    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 2 - empty
                    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 3 - empty
                //    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 4 - empty
                    if(noOfParentRowsInDiagram>=2){
                        ucDisplayDataColumnList.add(getDisplayObjectForRightTConnector(contextPath));//Col 5 - rightT
                    }else{
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 5 - empty
                    }
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(ucSystemMst.getSystemName(), contextPath));//Col 6 - System
                    
                }else if(row==centerRow && parentCenterRowPosition==AppConstants.ODD){
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    if(parentSystemItr.hasNext()){
                        Entry<String, List<String>> entry = parentSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 2 - System
                    ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 3 - assembly connector
                    //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 4 - horizontal line
                    if(parentSystemMap.size()>=3){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForCrossConnector(contextPath));//Col 5 - cross connector
                    }else{
                        ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(null, contextPath));//Col 5 - horizontal line
                    }
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(ucSystemMst.getSystemName(), contextPath));//Col 6 - System
                }else if(row == parentStartRow){
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    if(parentSystemItr.hasNext()){
                        Entry<String, List<String>> entry = parentSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 2 - System
                    ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 3 - assembly connector
                    //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 4 - horizontal line
                    ucDisplayDataColumnList.add(getUcDisplayObjectForTopLeftConnector(contextPath));//Col 5 - top left connector
                    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 6 - empty
                    
                }else{
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    systemName="";
                    if(parentSystemItr.hasNext()){
                        Entry<String, List<String>> entry = parentSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    if(parentSystemItr.hasNext()==false && systemName!=""){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 2 - System
                        ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 3 - assembly connector
                        //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 4 - horizontal line
                        ucDisplayDataColumnList.add(getUcDisplayObjectForBottomLeftConnector(contextPath));//Col 5 - bottom left connector
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 6 - empty
                    }else if (systemName!=""){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 2 - System
                        ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 3 - assembly connector
                        //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 4 - horizontal line
                        ucDisplayDataColumnList.add(getUcDisplayObjectForLeftTConnector(contextPath));//Col 5 - left T connector
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 6 - empty
                    }else{
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 2 - empty
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 3 - empty
                        //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 4 - empty
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 5 - empty
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 6 - empty
                    }//end if
                }//end if
                    
            }else{
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 2 - empty
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 3 - empty
                //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 4 - empty
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 5 - empty
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 6 - empty
            }//end if
            
            //Step 2 : process the children
            if(row >= childStartRow){
                if(row==centerRow && childCenterRowPosition==AppConstants.EVEN){
                    if(childSystemMap.size()>=2){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForLeftTConnector(contextPath));//Col 7 - leftT
                    }else{
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 7 - empty
                    }
                    //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 8 - empty
                    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 9 - empty
                    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 10 - empty
                    //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty
                }else if(row==centerRow && childCenterRowPosition==AppConstants.ODD){
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    if(childSystemItr.hasNext()){
                        Entry<String, List<String>> entry = childSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    //TODO: Cross connector only if children are 3 or more
                    if(childSystemMap.size()>=3){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForCrossConnector(contextPath));//Col 7 - CrossConnector
                    }else{
                    //    ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(null, contextPath));//Col 8 - horizontal line
                    }
                //    ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 8 - horizontal line
                    ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 9 - assembly connector
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 10 - System
                    //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty
                }else if(row == childStartRow){
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    if(childSystemItr.hasNext()){
                        Entry<String, List<String>> entry = childSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    ucDisplayDataColumnList.add(getUcDisplayObjectForTopRightConnector(contextPath));//Col 7 - TopRightConnector
                    //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 8 - horizontal line
                    ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 9 - assembly connector
                    ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 10 - System
                    //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty                    
                }else if(childSystemItr!=null){
                    List<String> requestList = new ArrayList<String>();
                    String requests = "";
                    systemName ="";
                    if(childSystemItr.hasNext()){
                        Entry<String, List<String>> entry = childSystemItr.next();
                        systemName = entry.getKey();
                        
                        requestList = entry.getValue();
                    }
                    for(String request:requestList){
                        if(requests==""){
                                requests=request;
                        }else{
                            requests=requests +", " +request;
                        }
                    }
                    if(childSystemItr.hasNext()==false && systemName!=""){
                        ucDisplayDataColumnList.add(getUcDisplayObjectForBottomRightConnector(contextPath));//Col 7 - BottomRightConnector
                        //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 8 - horizontal line
                        ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 9 - assembly connector
                        ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 10 - System
                        //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty                    
                    }else if(systemName!=""){
                        ucDisplayDataColumnList.add(getDisplayObjectForRightTConnector(contextPath));//Col 7 - RightTConnector
                        //ucDisplayDataColumnList.add(getUcDisplayObjectForHorizontalLine(requests, contextPath));//Col 8 - horizontal line
                        ucDisplayDataColumnList.add(getUcDisplayObjectForAssemblyConnector(contextPath, requests));//Col 9 - assembly connector
                        ucDisplayDataColumnList.add(getUcDisplayObjectForComponent(systemName, contextPath));//Col 10 - System
                        //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty                    
                    }else{
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 7 - empty
                        //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 8 - empty
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 9 - empty
                        ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 10 - empty
                        //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty
                    }//end if
                }//end if
                    
            }else{
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 7 - empty
            //    ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 8 - empty
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 9 - empty
                ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 10 - empty
                //ucDisplayDataColumnList.add(getDisplayObjectForComponentEmptyColumn(height,width));//Col 11 - empty                
            }//end if
            ucDisplayDataRowList.add(ucDisplayDataColumnList);
        }//end for
        
        
        
        return ucDisplayDataRowList;
    }
    
    public List<List<UcDisplayObject>> generateSequenceDisplayData(BigDecimal seqMstId, List<UcSeqDiagram> rowList, String userRequestAction, String contextPath, String row_no_param, String col_no_param, String displayView, String userId, String sequenceVersion,String isEdited,String oneWay,BigInteger ucId, String CONTEXT_PATH)
            throws Exception{
        // validate
        if (rowList == null ) {
            throw new Exception("Please select appropriate sequence to Display...");
        }        
        
        /*         Initialise variables
         *
         */
        Map<BigInteger, List<PositionRange>> asynchMap = new HashMap<BigInteger, List<PositionRange>>();
        //TODO:This map has issues the request will appear the same for all ASYNCH on the same column
        Map<BigInteger, String> asynchRequestMap = new HashMap<BigInteger, String>();
        //This will contain the asynch DESTINATION key=row, value=col that need to be skipped when tree closed, GLOBAL so it is available outside loop
        Map<BigInteger, BigInteger> asynchRowSkipMapGlobal = new HashMap<BigInteger, BigInteger>();
        int numberOfRows=10;           //This variable is used to define the initial row size of the sequence
        UcSeqDiagram ucSeqDiagram=null;
        if(rowList!=null && rowList.size()>numberOfRows){
            numberOfRows=rowList.size()+1;               //-----Initialise based on input parameters
        }

        int numberOfColumns=10;        //This variable is used to define the initial column size of the sequence
        if(rowList!=null){
            int maxColWidth = util.getMaxNumberOfColumns(rowList);
            if(maxColWidth>numberOfColumns-AppConstants.COLUMN_SELECTION_ADJUSTMENT_FOR_NUMNER_OF_COLS)
                numberOfColumns=maxColWidth+AppConstants.COLUMN_SELECTION_ADJUSTMENT_FOR_NUMNER_OF_COLS;
        }

        //This variable is used by HTML to navigate to a section of page
        int selectedRowNo=util.convertStringToBigInteger(row_no_param).intValue()-AppConstants.ROW_SELECTION_ADJUSTMENT_FOR_SELECTED_ROW;

        //This variable is used by HTML to navigate to a section of page
        int selectedColumnNo=util.convertStringToBigInteger(col_no_param).intValue()+AppConstants.COLUMN_SELECTION_ADJUSTMENT_FOR_SELECTED_COL;
        if(userRequestAction.equals(AppConstants.DELETE_AND_DIAPLAY_ACTION)){
            //When DELETE action the selectedColumnNo goes beyond the numberOfColumns(max cols for display), and so no selecting occurs
            selectedColumnNo=selectedColumnNo-1;
        }
        
        //Colours initialization
        String verticalLineConnectorCOLOUR="blue";
        String ifConditionBoundaryCOLOUR="gray";

        // DISPLAY_CONTEXT: HTML table Row 1-------------------------------------------------------
        
        List<List<UcDisplayObject>> ucDisplayDataRowList = new ArrayList<List<UcDisplayObject>>();
        List<UcDisplayObject> ucDisplayDataColumnListEmpty = new ArrayList<UcDisplayObject>();
        ucDisplayDataColumnListEmpty.add(getDisplayObjectForEmptyColumn(false, false, false, false, false,0,0, null));
        ucDisplayDataColumnListEmpty.add(getDisplayObjectForEmptyColumn(false, true, false, false, false,0,0, null));
        //ucDisplayDataColumnListEmpty.add(getDisplayObjectForVerticalLineConnector(verticalLineConnectorCOLOUR, null, ifConditionBoundaryCOLOUR, false,0,2));
        
        
        ucDisplayDataColumnListEmpty.add(getDisplayObjectForEmptyColumn(false, true, false, false, false,0,0, null));
        for(int i=ucDisplayDataColumnListEmpty.size();i<=numberOfColumns;i++){
            boolean lastColumn=false;
            if(i==numberOfColumns){
                lastColumn=true;
                ucDisplayDataColumnListEmpty.add(getDisplayObjectForEmptyColumn(false, false, lastColumn, false, false,0,0, null));
            }else{
                ucDisplayDataColumnListEmpty.add(getDisplayObjectForEmptyColumn(false, true, lastColumn, false, false,0,0, null));
            }                
        }
        ucDisplayDataRowList.add(ucDisplayDataColumnListEmpty);
        // END DISPLAY_CONTEXT: HTML table Row 1-------------------------------------------------------
        /*
         * This Map will contain the row range for NEXT LEVEL children of a ITEM
         *  KEY             : is the COLUMN of the NEXT LEVEL child(ie; the next column of the item)
         *  VALUE           : [rownNoOfFirstNextLevelChildItem,   rownNoOfLastNextLevelChildItem]
         */
//?????? - need to consider the effect of close and open on this variable        
        Map<BigInteger, PositionRange> rowRangeMapbyColumnNo =new HashMap<BigInteger, PositionRange>();

        //convert list to Map        
        Map<BigInteger, Map<BigInteger, UcSeqDiagram>> rowMap = util.convertSequenceListToMap(rowList);
        
        // DISPLAY_CONTEXT: HTML table Row 2-------------------------------------------------------
        
//        List<UcDisplayObject> ucDisplayDataColumnList = new ArrayList<UcDisplayObject>();
//        ucDisplayDataColumnList.add(getDisplayObjectForEmptyColumn(false, false, false, false, false,0,0, null));
//        //TODO : Remove below
//        ucDisplayDataColumnList.add(getUcDisplayObjectForSystem(ucSeqMst, contextPath, userId, displayView));
//        
//        
//        
//        if(rowMap!=null && !rowMap.isEmpty() && rowMap.get(AppConstants.FIRST_SEQUENCE_POSITION_ROW_NO)!=null  
//                &&rowMap.get(AppConstants.FIRST_SEQUENCE_POSITION_ROW_NO).get(AppConstants.FIRST_SEQUENCE_POSITION_COL_NO)!=null){
//            ucSeqDiagram=rowMap.get(AppConstants.FIRST_SEQUENCE_POSITION_ROW_NO).get(AppConstants.FIRST_SEQUENCE_POSITION_COL_NO);
//            if(ucSeqDiagram.getRequest()==null){
//                ucSeqDiagram.setRequest("Request");
//            }
//            if(ucSeqDiagram.getResponse()==null){
//                ucSeqDiagram.setResponse("Response");
//            }
//        }
////TODO : Remove below
//        ucDisplayDataColumnList.add(getDisplayObjectForCustomerToSystemTwoWayConnector(ucSeqMst, ucSeqDiagram, null,null,ifConditionBoundaryCOLOUR, false, displayView));
//        
//        
//        if(ucSeqDiagram!=null && ucSeqDiagram.getRowNo()!=null && ucSeqDiagram.getColNo()!=null){
//            //TODO : Remove below
//            ucDisplayDataColumnList.add(getUcDisplayObjectForSystem(ucSeqDiagram, contextPath, displayView));
//            // Populate MAP for the current ROW and COLUMN in ucSeqDiagram    
//            Map<String, Object> rowColumnRangeMap=populateRowRangeMapbyColumnNo(ucSeqDiagram, rowMap);
//            
//            PositionRange rowRange = (PositionRange)rowColumnRangeMap.get("rowRange");
//
//            ucSeqDiagram.setLastChildRowNo(rowRange.getEndNo());
//            
//            rowRangeMapbyColumnNo.put(ucSeqDiagram.getColNo().add(new BigInteger("1")), (PositionRange)rowColumnRangeMap.get("rowRangeForlastRowForLastNextLevelChild"));
//        }
//        for(int i=ucDisplayDataColumnList.size();i<=numberOfColumns;i++){
//            boolean lastColumn=false;
//            if(i==numberOfColumns){
//                lastColumn=true;
//            }
//            ucDisplayDataColumnList.add(getDisplayObjectForEmptyColumn(false, false, lastColumn, false, false,i,0, null));
//            
//        }
//        ucDisplayDataRowList.add(ucDisplayDataColumnList);
        
        // END DISPLAY_CONTEXT: HTML table Row 2-------------------------------------------------------
        
        //This variable is used by the IF_CONDITION, to draw the OUTER boundaries
        List<Map<String,Object>> rowColumnRangeList= new ArrayList<Map<String,Object>>();
        /*-------111111------LOOP through all records and construct the rowColumnRangeList
         *                 this will be needed as there is no other way to figure out
         *                 IF condition boundries before we construct the page
         *
         *         OTHER option is to loop through when a if condition/section is encountered
         *             
         */
//        System.out.println("++++++++++++++++++++++++++++++++++++++++++ looking for row="+(selectedRowNo));
//        System.out.println("++++++++++++++++++++++++++++++++++++++++++ looking for column="+(selectedColumnNo));
//        System.out.println("++++++++++++++++++++++++++++++++++++++++++ looking for LastRow="+numberOfRows);
//        System.out.println("++++++++++++++++++++++++++++++++++++++++++ looking for LastColumn="+numberOfColumns);
        for(int i=ucDisplayDataRowList.size();i<=numberOfRows;i++){
            List<UcDisplayObject> ucDisplayDataColumnListLocal = new ArrayList<UcDisplayObject>();
            BigInteger bigIntegerI = util.convertIntToBigInteger(i);
            int updateNumberOfRows=numberOfRows;
            int updateI=i;
            
            for(int j =ucDisplayDataColumnListLocal.size(); j<=numberOfColumns;j++){
                BigInteger bigIntegerJ = util.convertIntToBigInteger(j);    
                if((bigIntegerI.intValue()==2
                        &&bigIntegerJ.intValue()==2)
                        ||
                        (bigIntegerI.intValue()==19
                        &&bigIntegerJ.intValue()==4)
                        ){
                    System.out.print("s");
                }
                
                
                boolean selected=false;
                //Setting selected value
                if(i==selectedRowNo && j==selectedColumnNo){
                    selected=true;

//                    System.out.println("++++++++++++++++++++++++++++++++++++++++++ selected i="+i+" j="+j);
                }

                if(rowMap!=null &&rowMap.get(bigIntegerI)!=null &&rowMap.get(bigIntegerI).get(bigIntegerJ)!=null){


                    ucSeqDiagram = rowMap.get(bigIntegerI).get(bigIntegerJ);
                    //ASYNCH action
        
                    if(ucSeqDiagram.getAsynchSourceDestination()!=null
                            && ucSeqDiagram.getAsynchSourceDestination().equals(AppConstants.SOURCE)){
                        //PositionRange
                        List<PositionRange> positionRangeList = asynchMap.get(ucSeqDiagram.getColNo());
                        if(positionRangeList==null){
                            positionRangeList = new ArrayList<PositionRange>();
                        }
                        PositionRange rowRange =  new PositionRange();
                        rowRange.setStartNo(ucSeqDiagram.getRowNo());
                        rowRange.setEndNo(ucSeqDiagram.getAsynchRowNo());
                        positionRangeList.add(rowRange);
                        //TODO:This map has issues the request will appear the same for all ASYNCH on the same column
                        asynchRequestMap.put(ucSeqDiagram.getColNo(), ucSeqDiagram.getRequest());
                        asynchMap.put(ucSeqDiagram.getColNo(), positionRangeList);
                    }
                    
                    //END ASYNCH action
                    Map<String, Object> rowColumnRangeMap = populateRowRangeMapbyColumnNo(ucSeqDiagram, rowMap);
                    //UsedFor_SKIPPING_ASYNCH_DESTINATION_IF_TREE_CLOSED
                    Map<BigInteger, BigInteger> asynchRowSkipMap = (Map<BigInteger, BigInteger>)rowColumnRangeMap.get("asynchRowSkipMap");
                    asynchRowSkipMapGlobal.putAll(asynchRowSkipMap);
                    
                    //UsedFor_EXPAND_CLOSE
                    PositionRange rowRange = (PositionRange)rowColumnRangeMap.get("rowRange");
                    //UsedFor_FRONT_END_JSP_Javascript
                    PositionRange columnRange = (PositionRange)rowColumnRangeMap.get("columnRange");
                    //UsedFor_IF_BOUNDARY
//                        PositionRange lastRowIfBoundryRange = rowColumnRangeMap.get("lastRowIfBoundryRange");
                    //UsedFor_IF_BOUNDARY
                    PositionRange lastColumnIfBoundryRange = (PositionRange)rowColumnRangeMap.get("lastColumnIfBoundryRange");
                    //UsedFor_LINKS
                    PositionRange rowRangeForlastRowForLastNextLevelChild = (PositionRange)rowColumnRangeMap.get("rowRangeForlastRowForLastNextLevelChild");
                    //UsedFor_LINKS
                    rowRangeMapbyColumnNo.put(bigIntegerJ.add(new BigInteger("1")), rowRangeForlastRowForLastNextLevelChild);

                    //update ucSeqDiagram lastRow
                    ucSeqDiagram.setLastChildRowNo(rowRange.getEndNo());
                    
                    //START - Logic for expand and close
                    
                    //VALIDATION
                    if(ucSeqDiagram.getExpanded()==null){
                        ucSeqDiagram.setExpanded("true");
                    }
                    
    
                    /*We need to update the selectedRowNo if we are skipping rows
                     * otherwise this row is skipped and does not get selected
                     */
                    if(selectedRowNo > i && selectedRowNo <= rowRange.getEndNo().intValue() && ucSeqDiagram.getExpanded().equals("false")){
                        selectedRowNo=i;
                        selected=true;
                        if(selectedColumnNo==j){
                            ucSeqDiagram.setSelected("true");
                        }
                    }else if(selected==true){
                        ucSeqDiagram.setSelected("true");
                    }else{
                        ucSeqDiagram.setSelected("false");
                    }
                    
                    //END - Logic for expand and close
                    
//-------------------------------------------------------------------------------------                    
                    /*
                     * Check if we need to get displayObject for IF_CONDITION or SYSTEM
                     */
                    if(ucSeqDiagram.getIfCondition()!=null || ucSeqDiagram.getSectionName()!=null){
                        /*Since IF_Condition & Section considers the current position not the child position we have to use another
                         *  another variable for row range, we will still be using the same END position though
                         */
                        //Only add to the rowColumnRangeList list if it is SECTION/IF condition
                        rowColumnRangeList.add(rowColumnRangeMap);                            
                        
                        
                        
                        if(lastColumnIfBoundryRange!=null
                                && ucSeqDiagram.getExpanded()=="true"){

                            //This is for the if condition COLSPAN
                            String colspan="";
                            if(lastColumnIfBoundryRange!=null && lastColumnIfBoundryRange.getEndNo() !=null && lastColumnIfBoundryRange.getStartNo()!=null
                                    && lastColumnIfBoundryRange.getEndNo().intValue()>lastColumnIfBoundryRange.getStartNo().intValue()){
                                int colspanInt=lastColumnIfBoundryRange.getEndNo().intValue()-lastColumnIfBoundryRange.getStartNo().intValue();
                                colspanInt++;
                                colspan="colspan=\""+colspanInt+"\" ";
                                // Since we are manipulating the COLUMNS(for colspan) we will have to skip those many columns by incrementing the count
                                int originalJ=j;
                                j=j+lastColumnIfBoundryRange.getEndNo().intValue()-lastColumnIfBoundryRange.getStartNo().intValue();

                                /*if the selectedColumnNo is between originalJ and j, then just make this as selected
                                 * otherwise this column is skipped and does not get selected
                                 */
                                
                                if(i==selectedRowNo && selectedColumnNo>=originalJ && selectedColumnNo <= j){
                                    selectedColumnNo=j+1;
//                                        System.out.println("++++++++++++++++++++++++++++++++++++++++++ selected i="+i+" j="+j);
                                } else if((selectedRowNo ==0 || selectedRowNo ==1)
                                        && (selectedColumnNo>=j && selectedColumnNo <= j+colspanInt)){
                                    selected=true;
//                                        System.out.println("++++++++++++++++++++++++++++++++++++++++++ selected i="+i+" j="+j);
                                    
                                }
                                
                            }
                            
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getUcDisplayObjectForIfAndSectionWithChildren");                
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                            ucDisplayDataColumnListLocal.add(getUcDisplayObjectForIfAndSectionWithChildren(colspan, ucSeqDiagram, ifConditionBoundaryCOLOUR, selected));
                        }else{
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getUcDisplayObjectForIfAndSectionWithOutChildren");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                            ucDisplayDataColumnListLocal.add(getUcDisplayObjectForIfAndSectionWithOutChildren(ucSeqDiagram, ifConditionBoundaryCOLOUR));
                            
                            
                        }
                        

                        
                    }else{
                        String boundary=getIfConditionBoundary(rowColumnRangeList, bigIntegerI, bigIntegerJ);
                        if(boundary!=null){
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getUcDisplayObjectForSystemIfItem");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                            ucDisplayDataColumnListLocal.add(getUcDisplayObjectForSystemIfItem(ucSeqDiagram, boundary, ifConditionBoundaryCOLOUR, contextPath, displayView));
//                            }else if(asynchMap.get(ucSeqDiagram.getColNo())!=null
//                                    && rowBetweenAsynchRange(asynchMap, ucSeqDiagram)){
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getUcDisplayObjectForSystemIfItem");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
//                                ucDisplayDataColumnListLocal.add(getUcDisplayObjectForAsynchConnectorItem(ucSeqDiagram,  contextPath));                                
                            
                        }else{
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getUcDisplayObjectForSystem");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                            ucDisplayDataColumnListLocal.add(getUcDisplayObjectForSystem(ucSeqDiagram, contextPath, displayView));
                        }
                    }

                    //START - Logic for expand and close

                    //ADJUSTMENT -  of the rows being displayed, will have to skip if we close the tree
                    if(rowRange!=null
                        &&ucSeqDiagram.getExpanded()=="false"
                        &&i<=rowRange.getEndNo().intValue()){
                        
                        //numberOfRows have to be calculated before the VALUE of i is updated
                        updateNumberOfRows=numberOfRows+rowRange.getEndNo().intValue()-i;
                        updateI=rowRange.getEndNo().intValue();
                    
                        //TODO : Check if updateI+1 is

                        int z=0;
                        while(asynchRowSkipMapGlobal.get(new BigInteger(Integer.toString(updateI+1))) !=null){
                            z++;
                            UcSeqDiagram asynchUcSeqDiagram = rowMap.get(new BigInteger(Integer.toString(updateI+1))).get(asynchRowSkipMapGlobal.get(new BigInteger(Integer.toString(updateI+1))));
                            if(asynchUcSeqDiagram!=null && asynchUcSeqDiagram.getAsynchSourceDestination().equals(AppConstants.DESTINATION)){
                                BigInteger firstChildRow;
                                BigInteger firstChildCol;
                                firstChildRow = asynchUcSeqDiagram.getRowNo().add(new BigInteger("1"));
                                firstChildCol = asynchUcSeqDiagram.getColNo().add(new BigInteger("1"));
                                if(rowMap.get(firstChildRow)!=null && rowMap.get(firstChildRow).get(firstChildCol)!=null){
                                    Map<String, Object> lastRowColMap = util.getLastChildRow(firstChildRow ,firstChildCol,asynchUcSeqDiagram, rowMap);
                                    if(lastRowColMap.get("lastRow")!=null){
                                        updateNumberOfRows=numberOfRows+((BigInteger)lastRowColMap.get("lastRow")).intValue()-1;
                                        updateI=((BigInteger)lastRowColMap.get("lastRow")).intValue();
                                    }
                                }else{
                                    //numberOfRows have to be calculated before the VALUE of i is updated
                                    updateNumberOfRows=numberOfRows+i+1-i;
                                    updateI=i+1;
                                }
                            }else{
                                break;
                            }
                            if(z>9){
                                break;
                            }
                        }//end while

                        
                    }else if(asynchRowSkipMapGlobal.get(new BigInteger(Integer.toString(i+1)))!=null){ // check if next row belongs to asynch DESTINATION
                        int z=0;
                        while(asynchRowSkipMapGlobal.get(new BigInteger(Integer.toString(i+1))) !=null){
                            z++;
                            UcSeqDiagram asynchUcSeqDiagram = rowMap.get(new BigInteger(Integer.toString(i+1))).get(asynchRowSkipMapGlobal.get(new BigInteger(Integer.toString(i+1))));
                            if(asynchUcSeqDiagram!=null && asynchUcSeqDiagram.getAsynchSourceDestination().equals(AppConstants.DESTINATION)){
                                BigInteger firstChildRow;
                                BigInteger firstChildCol;
                                firstChildRow = asynchUcSeqDiagram.getRowNo().add(new BigInteger("1"));
                                firstChildCol = asynchUcSeqDiagram.getColNo().add(new BigInteger("1"));
                                if(rowMap.get(firstChildRow)!=null && rowMap.get(firstChildRow).get(firstChildCol)!=null){
                                    Map<String, Object> lastRowColMap = util.getLastChildRow(firstChildRow ,firstChildCol,asynchUcSeqDiagram, rowMap);
                                    if(lastRowColMap.get("lastRow")!=null){
                                        updateNumberOfRows=numberOfRows+((BigInteger)lastRowColMap.get("lastRow")).intValue()-1;
                                        updateI=((BigInteger)lastRowColMap.get("lastRow")).intValue();
                                    }
                                }else{
                                    //numberOfRows have to be calculated before the VALUE of i is updated
                                    updateNumberOfRows=numberOfRows+i+1-i;
                                    updateI=i+1;
                                }
                            }else{
                                break;
                            }
                            if(z>9){
                                break;
                            }
                        }//end while

                    }//end if
                    //END - Logic for expand and close
                }else{
                        //add connecting lines for systems
                        /*Need to do 2 checks
                         *         1> check if current row is between the rowRange
                         *         2> does a seqDiagramItem exists in the next column
                         */
                        String boundary= getIfConditionBoundary(rowColumnRangeList, bigIntegerI, bigIntegerJ);
                        BigInteger nextCol = bigIntegerJ.add(new BigInteger("1"));
                        //BigInteger nextCol = bigIntegerJ;---------------------------------------------------000000000000000000000000000000
                        if(rowRangeMapbyColumnNo!=null &&rowRangeMapbyColumnNo.get(nextCol)!=null
                                &&rowRangeMapbyColumnNo.get(nextCol).startNo.intValue()<=bigIntegerI.intValue()
                                &&rowRangeMapbyColumnNo.get(nextCol).endNo.intValue()>=bigIntegerI.intValue()
                                &&rowMap!=null &&rowMap.get(bigIntegerI)!=null &&rowMap.get(bigIntegerI).get(nextCol)!=null){
                            if(rowRangeMapbyColumnNo.get(nextCol).endNo.intValue()==bigIntegerI.intValue()){
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getDisplayObjectForSystemToSystemLastConnector");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
    
                                if(rowMap.get(bigIntegerI).get(nextCol).getAsynchSourceDestination()!=null
                                        &&rowMap.get(bigIntegerI).get(nextCol).getAsynchSourceDestination().equals(AppConstants.DESTINATION)){
                                    //TODO : Add Empty//CHECK.......................................CHECK.....................
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForEmptyColumn(selected,true, false, true, false,i,j, null));
                                }else{
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForSystemToSystemLastConnector( seqMstId, userId,ucId, isEdited, oneWay, rowMap.get(bigIntegerI).get(nextCol),null, boundary, ifConditionBoundaryCOLOUR, selected, displayView,sequenceVersion, CONTEXT_PATH));
                                }

                            }else{
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getDisplayObjectForSystemToSystemTwoWayConnector");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);

                                if(rowMap.get(bigIntegerI).get(nextCol).getAsynchSourceDestination()!=null //-----111111 this is GOOD for connector, but not for ...
                                        &&rowMap.get(bigIntegerI).get(nextCol).getAsynchSourceDestination().equals(AppConstants.DESTINATION)){
                                    //TODO : Add Empty//CHECK.......................................CHECK.....................
                                    //13 Aug 2014: Changed this because the column previous DESTINATION was not showing vertical line
                                    // instead a empty column, so changing empty column to vertical line
                                    //ucDisplayDataColumnListLocal.add(getDisplayObjectForEmptyColumn(selected,true, false, true, false,i,j, null));
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForVerticalLineConnector(null, boundary, ifConditionBoundaryCOLOUR, selected,i , j));
                                }else{
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForSystemToSystemTwoWayConnector( seqMstId, userId,ucId, isEdited, oneWay, rowMap.get(bigIntegerI).get(nextCol), null, boundary, ifConditionBoundaryCOLOUR, selected, displayView, sequenceVersion, CONTEXT_PATH));
                                }

                            }
                        }else if(rowRangeMapbyColumnNo!=null &&rowRangeMapbyColumnNo.get(nextCol)!=null
                                &&rowRangeMapbyColumnNo.get(nextCol).startNo.intValue()<=bigIntegerI.intValue()
                                &&rowRangeMapbyColumnNo.get(nextCol).endNo.intValue()>=bigIntegerI.intValue()){
                            //CHECK.......................................CHECK.....................
//                            System.out.println("Row="+bigIntegerI.intValue()+"    Column="+bigIntegerJ.intValue());
//                            System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getDisplayObjectForVerticalLineConnector");                            
//                            System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                            ucDisplayDataColumnListLocal.add(getDisplayObjectForVerticalLineConnector(null, boundary, ifConditionBoundaryCOLOUR, selected,i , j));
                        
                        }else{

                            if(boundary!=null){
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getDisplayObjectForIfConditionBoundary");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                                ucDisplayDataColumnListLocal.add(getDisplayObjectForIfConditionBoundary(boundary, ifConditionBoundaryCOLOUR, selected,i));
                            }else{
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ selected getDisplayObjectForEmptyColumn");
//                                System.out.println("++++++++++++++++++++++++++++++++++++++++++ i="+i+" j="+j);
                                boolean lastColumn=false;
                                boolean lastRow=false;
                                if(numberOfRows==i){
                                    lastRow=true;
                                }
                                if(numberOfColumns==j){
                                    lastColumn=true;
                                }

                                if(asynchMap.get(util.convertStringToBigInteger(Integer.toString(j)))!=null
                                        && rowBetweenAsynchRange(asynchMap, i,j)){    
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForEmptyColumn(selected,true, lastColumn, lastRow, true,i,j, asynchRequestMap.get(new BigInteger(Integer.toString(j)))));
                                }else if(sequenceVersion!=null && (sequenceVersion.equals(AppConstants.SYS_SEQ) || sequenceVersion.equals(AppConstants.SYS_SEQ_DRAFT)|| sequenceVersion.equals(AppConstants.SYS_SEQ_PROD))
                                        && bigIntegerI.intValue() == AppConstants.SYS_SEQ_FIRST_ROW_NO.intValue()
                                        && bigIntegerJ.intValue() == AppConstants.SYS_SEQ_FIRST_COL_NO.intValue()
                                        &&rowMap.get(bigIntegerI)!=null
                                        ){//Scenario: SYS_SEQ  Here we will have to add Req+Res for firstSeqItem
                                	ucDisplayDataColumnListLocal.add(getDisplayObjectForSysSeqConnector( isEdited, rowMap.get(bigIntegerI).get(nextCol), displayView, sequenceVersion, CONTEXT_PATH));
                                }else{//CHECK.......................................CHECK.....................
                                    ucDisplayDataColumnListLocal.add(getDisplayObjectForEmptyColumn(selected,true, lastColumn, lastRow, false,i,j, null));
                                }

                            }
                        }
                        /*
                         * Process If condition DATA, Except for 1st and last item
                         */
                    }

                    
//                }
            }//for j ie;column
            
            //update these values based on Logic for expand and close
            numberOfRows=updateNumberOfRows;
            i=updateI;
            
            ucDisplayDataRowList.add(ucDisplayDataColumnListLocal);

        }
        if(sequenceVersion!=null && sequenceVersion.equalsIgnoreCase(AppConstants.DRAFT)){
            rowList = util.convertSequenceMapToList(rowMap);
            List<UcSeqDiagramDraft> rowListDraft = util.convertUcSeqDiaToUcSeqDiaDraft(rowList);
            util.loadSequenceDraftObject(rowListDraft, seqMstId);
        }
        return ucDisplayDataRowList;
    }
    private UcDisplayObject getUcDisplayObjectForComponent(String systemName,String CONTEXT_PATH) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setDisplayName(systemName);

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());
        String fileName = util.drawImage(systemName, AppConstants.COMPONENT_DEFAULT_IMAGE, 30, CONTEXT_PATH);
        StringBuilder colouredBoundries = new StringBuilder();
        
//        colouredBoundries.append("background-image: url('");
//        if(fileName.equals(AppConstants.COMPONENT_DEFAULT_IMAGE)){
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        }
//        colouredBoundries.append(fileName);
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(fileName);
        return ucDisplayObject;
    }
    
    private UcDisplayObject getDisplayObjectForRightTConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("rightT_connector.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"rightT_connector.png");
        return ucDisplayObject;
    }
    private UcDisplayObject getUcDisplayObjectForAssemblyConnector(
    		String CONTEXT_PATH, String requests) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("interface_connector.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        String fileName = util.drawImage(requests, "interface_connector.png", 10, CONTEXT_PATH);
        ucDisplayObject.setImageName(fileName);
        return ucDisplayObject;
    }
    private UcDisplayObject getUcDisplayObjectForCrossConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("cross_connector.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"cross_connector.png");
        return ucDisplayObject;
    }
    private UcDisplayObject getUcDisplayObjectForHorizontalLine(
            String requests, String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();
        ucDisplayObject.setDisplayName(requests);
        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("horizontal_line.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"horizontal_line.png");
        return ucDisplayObject;
    }
    private UcDisplayObject getUcDisplayObjectForTopLeftConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("top_left_corner.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"top_left_corner.png");
        return ucDisplayObject;
    }
    private UcDisplayObject getUcDisplayObjectForBottomRightConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("bottom_right_corner.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"bottom_right_corner.png");
        
        return ucDisplayObject;
    }

    private UcDisplayObject getUcDisplayObjectForTopRightConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("top_right_corner.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"top_right_corner.png");
        return ucDisplayObject;
    }

    private UcDisplayObject getUcDisplayObjectForLeftTConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("leftT_connector.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"leftT_connector.png");
        return ucDisplayObject;
    }

    private UcDisplayObject getUcDisplayObjectForBottomLeftConnector(
            String contextPath) {
        UcDisplayObject ucDisplayObject = new UcDisplayObject();

        ucDisplayObject.setUcObjectEnum(UcObjectEnum.system.toString());

        StringBuilder colouredBoundries = new StringBuilder();
//        colouredBoundries.append("background-image: url('");
//        colouredBoundries.append(contextPath);
//        colouredBoundries.append("/images/");
//        colouredBoundries.append("bottom_left_corner.png");
//        colouredBoundries.append("');");
        colouredBoundries.append(" background-repeat: no-repeat; background-position: center;background-size: 75px 50px;");
        ucDisplayObject.setHtmlStr("style=\""+colouredBoundries+"\"");
        ucDisplayObject.setImageName(contextPath+"/images/"+"bottom_left_corner.png");
        
        return ucDisplayObject;
    }
    private Map<String, Object> populateRowRangeMapbyColumnNo(
            UcSeqDiagram ucSeqDiagram, Map<BigInteger, Map<BigInteger, UcSeqDiagram>> rowMap) {
        BigInteger firstChildRow;
        BigInteger firstChildCol;
        firstChildRow = ucSeqDiagram.getRowNo().add(new BigInteger("1"));
        firstChildCol = ucSeqDiagram.getColNo().add(new BigInteger("1"));

        PositionRange rowRangeForlastRowForLastNextLevelChild = new PositionRange();
        /* NOTE: This will be used for getting the row and column ranges without considering if the nodes are expanded
         * also the start position for these would be the first child
         */
        
        PositionRange rowRange = new PositionRange();
        PositionRange columnRange = new PositionRange();
        /* NOTE: This will be used for getting the row and column ranges considering if the nodes are expanded
         *
         */
        PositionRange lastRowIfBoundryRange = new PositionRange();
        PositionRange lastColumnIfBoundryRange= new PositionRange();
        
        
        /*
         * This MAP lastRowColMap is used for returing 3 values
         *
         * 1 > lastRowForLastNextLevelChild
         * 2 > lastRow ( either can be lastNextLevel child or could be last ..N.. Level child)
         * 3 > lastColumn
         * 4> AsynchStartRow
         */
        Map<String, Object> lastRowColMap = util.getLastChildRow(firstChildRow ,firstChildCol,ucSeqDiagram, rowMap);

        Map<BigInteger, BigInteger>  asynchRowSkipMap = (Map<BigInteger, BigInteger>)lastRowColMap.get("asynchRowSkipMap");

        if(rowMap!=null &&rowMap.get(firstChildRow)!=null &&rowMap.get(firstChildRow).get(firstChildCol)!=null
                &&lastRowColMap!=null && lastRowColMap.get("lastRowForLastNextLevelChild")!=null){
            rowRangeForlastRowForLastNextLevelChild.setStartNo(firstChildRow);
            rowRangeForlastRowForLastNextLevelChild.setEndNo((BigInteger)lastRowColMap.get("lastRowForLastNextLevelChild"));
            //rowRange.setStartNo(ucSeqDiagram.getRowNo());
            rowRange.setStartNo(firstChildRow);
            
            if(lastRowColMap.get("lastRow")!=null)
                rowRange.setEndNo((BigInteger)lastRowColMap.get("lastRow"));
            else
                rowRange.setEndNo(new BigInteger("0"));
            columnRange.setStartNo(firstChildCol);
            if(lastRowColMap.get("lastColumn")!=null)
                columnRange.setEndNo((BigInteger)lastRowColMap.get("lastColumn"));
            else
                columnRange.setEndNo(new BigInteger("0"));
        }else{
            rowRangeForlastRowForLastNextLevelChild.setStartNo(new BigInteger("0"));
            rowRangeForlastRowForLastNextLevelChild.setEndNo(new BigInteger("0"));
            columnRange.setStartNo(new BigInteger("0"));
            columnRange.setEndNo(new BigInteger("0"));
            rowRange.setStartNo(new BigInteger("0"));
            rowRange.setEndNo(new BigInteger("0"));
        }
        
        //Setting lastColumnIfBoundry & lastRowIfBoundry
        lastColumnIfBoundryRange.setStartNo(ucSeqDiagram.getColNo());
        lastRowIfBoundryRange.setStartNo(ucSeqDiagram.getRowNo());
        
        if(lastRowColMap.get("lastColumnIfBoundry")!=null){
            lastColumnIfBoundryRange.setEndNo((BigInteger)lastRowColMap.get("lastColumnIfBoundry"));
        }else{
            lastColumnIfBoundryRange.setEndNo(new BigInteger("0"));
        }
        if(lastRowColMap.get("lastRowIfBoundry")!=null){
            lastRowIfBoundryRange.setEndNo((BigInteger)lastRowColMap.get("lastRowIfBoundry"));
        }else{
            lastRowIfBoundryRange.setEndNo(new BigInteger("0"));
        }
        //END : Setting lastColumnIfBoundry & lastRowIfBoundry
        
        Map<String, Object> rowColRangeMap = new HashMap <String, Object>(8);
        //UsedFor_LINKS
        rowColRangeMap.put("rowRangeForlastRowForLastNextLevelChild", rowRangeForlastRowForLastNextLevelChild);

        rowColRangeMap.put("asynchRowSkipMap", asynchRowSkipMap);

        rowColRangeMap.put("columnRange", columnRange);
        
        rowColRangeMap.put("rowRange", rowRange);
        /*IF_NOTEEEEEEEEEEEEEEE
         * columnRange.setStartNo(bigIntergerJ);
         * columnRange.setEndNo(lastColumn);
         * rowRange.setStartNo(bigIntergerI)
         * rowRange.setEndNo(lastRow)
         */        
        //UsedFor_IF
        rowColRangeMap.put("lastRowIfBoundryRange", lastRowIfBoundryRange);
        /*LINKS_NOTEEEEEEEEEEEEEEE
         * columnRange.setStartNo(firstChildCol);
         * rowRange.setStartNo(firstChildRow)
         * rowRange.setEndNo(rowRangeForlastRowForLastNextLevelChild)
         */
        //UsedFor_IF

        rowColRangeMap.put("lastColumnIfBoundryRange", lastColumnIfBoundryRange);
        
        
        return rowColRangeMap;
    }

   
    private String getIfConditionBoundary(
            List<Map<String, Object>> rowColumnRangeList,
            BigInteger bigIntegerI, BigInteger bigIntegerJ) {
        String  boundary=null;
        
//        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--------------------------ROW="+bigIntegerI.toString());
//        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--------------------------COLUMN="+bigIntegerJ.toString());        
        
        for(Map<String, Object> rowColumnRangeMap:rowColumnRangeList){
            //NOTE: we need to change here to use the new Map elements
            PositionRange rowRange=(PositionRange)rowColumnRangeMap.get("lastRowIfBoundryRange");
            PositionRange columnRange=(PositionRange)rowColumnRangeMap.get("lastColumnIfBoundryRange");
//            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-------startRow="+rowRange.getStartNo().toString());
//            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx------endRow="+rowRange.getEndNo().toString());        
//            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-------startColumn="+columnRange.getStartNo().toString());
//            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx------endColumn="+columnRange.getEndNo().toString());        

            if(bigIntegerI.intValue()==3&&bigIntegerJ.intValue()==5){
//                System.out.print("s");
            }
            if(bigIntegerI.intValue()>=rowRange.getStartNo().intValue()
                    && bigIntegerI.intValue()<=rowRange.getEndNo().intValue()
                    && bigIntegerJ.intValue()>=columnRange.getStartNo().intValue()
                    && bigIntegerJ.intValue()<=columnRange.getEndNo().intValue()){
                
                if(bigIntegerI.intValue()==rowRange.getStartNo().intValue()){
                    boundary="top";
                }
                if(bigIntegerI.intValue()==rowRange.getEndNo().intValue()){
                    if(boundary==null){
                        boundary="bottom";;
                    }else{
                        boundary+="----bottom";;
                    }
                }
                if(bigIntegerJ.intValue()==columnRange.getStartNo().intValue()){
                    if(boundary==null){
                        boundary="left";;
                    }else{
                        boundary+="----left";;
                    }                    
                }
                if(bigIntegerJ.intValue()==columnRange.getEndNo().intValue()){
                    if(boundary==null){
                        boundary="right";;
                    }else{
                        boundary+="----right";;
                    }
                }
            }//if  row column part of if condition
        }//end for
//        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx------boundry="+boundary);
        return boundary;
    }
    private boolean rowBetweenAsynchRange(
            Map<BigInteger, List<PositionRange>> asynchMap,
            int row, int col) {
        
        if(row==8 && col==9){
//            return true;
//            System.out.println("ucSeqDiagram.getRowNo="+row);
//            System.out.println("ucSeqDiagram.getColNo="+col);
        }
        
        List<PositionRange> rowRangeList = asynchMap.get(util.convertStringToBigInteger(Integer.toString(col)));
        
        for(PositionRange rowRange:rowRangeList){
//            System.out.println("rowRange.row.start="+rowRange.startNo);
//            System.out.println("rowRange.row.end="+rowRange.endNo);
//            System.out.println("ucSeqDiagram.getRowNo="+row);
//            System.out.println("ucSeqDiagram.getColNo="+col);
            
            if(rowRange.getStartNo().intValue() < row
                    &&rowRange.getEndNo().intValue() > row){
                return true;
            }
        }
        
        // TODO Auto-generated method stub
        return false;
    }


    public Map<String,UcDisplayObject> findDisplayObject(
            List<List<UcDisplayObject>> ucDisplayDataRowList, BigInteger rowBig, BigInteger colBig) {
        Map<String,UcDisplayObject> displayMap=new HashMap<String,UcDisplayObject>(2);
        UcDisplayObject ucDisplayObjectPrevious=null;
        for(List<UcDisplayObject> ucDisplayObjectList:ucDisplayDataRowList){
            for(UcDisplayObject ucDisplayObject:ucDisplayObjectList){
                if(ucDisplayObject!=null && ucDisplayObject.getUcSeqDiagram()!=null){
                    if(ucDisplayObject.getUcSeqDiagram().getRowNo().equals(rowBig) && ucDisplayObject.getUcSeqDiagram().getColNo().equals(colBig)){
                        displayMap.put("sysObj", ucDisplayObject);
                        displayMap.put("connectorObj", ucDisplayObjectPrevious);
                    }
                }
                ucDisplayObjectPrevious = ucDisplayObject;
            }//end col loop
            
        }
        
        // TODO Auto-generated method stub
        return displayMap;
    }
    

    class PositionRange{
        BigInteger startNo;
        BigInteger endNo;
        public BigInteger getStartNo() {
            return startNo;
        }
        public void setStartNo(BigInteger startNo) {
            this.startNo = startNo;
        }
        public BigInteger getEndNo() {
            return endNo;
        }
        public void setEndNo(BigInteger endNo) {
            this.endNo = endNo;
        }
    }


    
}
