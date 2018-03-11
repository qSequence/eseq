package com.enterprisesolutions.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;























//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enterprisesolutions.hibernate.model.UcSeqDiagram;
import com.enterprisesolutions.hibernate.model.UcSeqDiagramDraft;
import com.enterprisesolutions.hibernate.model.UcSeqMst;
import com.enterprisesolutions.print.UcPrintComponentObject;
import com.enterprisesolutions.release.ReleaseManager;
import com.enterprisesolutions.sequence.SequenceObject;
import com.enterprisesolutions.sequence.SequenceObject.AddPositionEnum;
import com.enterprisesolutions.utils.AppConstants;
import com.enterprisesolutions.utils.AppUtil;
import com.enterprisesolutions.utils.ConverterUtil;
import com.enterprisesolutions.utils.DbUtil;
import com.enterprisesolutions.utils.SeqDiagramOperationEnum;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:enterprise-solution-servlet.xml")
public class HqlNavItemDaoTest {
	//@Autowired
	//HqlNavItemDao hqlNavItemDao;
	@Autowired
	DbUtil dbUtil;
	@Autowired
	SequenceObject sequenceObject;
	@Autowired
	ReleaseManager releaseManager;
	@Autowired
	ConverterUtil converterUtil;
	@Autowired
	AppUtil appUtil;
	
	@Test
	public void load(){
		String userId="5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";
		UcSeqMst ucSeqMst = new UcSeqMst();
		ucSeqMst.setSeqMstId(converterUtil.convertStringToBigDecimal("74"));
		Map<String, Object> seqObj = appUtil.loadSequenceIfDoesNotExist(ucSeqMst, null, userId, AppConstants.SEQ, null, null, null);
		ucSeqMst = (UcSeqMst)seqObj.get("ucSeqMst");
		List<UcSeqDiagram> rowList = (List<UcSeqDiagram>)seqObj.get("rowMap");
		try{
			int i=0;
			for(UcSeqDiagram ucSeqDiagram: rowList){
				if(i<10){
					i++;
					UcSeqDiagram ucSeqDiagramNew = new UcSeqDiagram();
					ucSeqDiagramNew.setSeqMstId(new BigInteger(i+""));
					rowList.add(ucSeqDiagramNew);
				}
				
				
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("test");
		
	}
	
	//@Test
	public void saveSignature() throws Exception {
		String userId="5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";
		UcSeqMst ucSeqMst = new UcSeqMst();
		ucSeqMst.setSeqMstId(new BigDecimal("74"));
		String userRequestAction = "add_and_display_action";
		String sequenceVersion = "SEQ";
		String sysSeqId="";
		String forRequestId="";
		Map<String, Object> modelUc = new HashMap<String, Object>();
		
		Map<String, Object> seqMstAndRowMap=appUtil.loadSequenceIfDoesNotExist(ucSeqMst, userRequestAction, userId, sequenceVersion, modelUc, converterUtil.convertStringToBigInteger(sysSeqId), converterUtil.convertStringToBigInteger(forRequestId));
		//Scenario VERSION : will need a special flag parameter as input for DRAFT loadSequenceIfDoesNotExist
		ucSeqMst = (UcSeqMst)seqMstAndRowMap.get("ucSeqMst");
		String isEdited = (String)seqMstAndRowMap.get("isEdited");
		List<UcSeqDiagram> rowList = (List<UcSeqDiagram>)seqMstAndRowMap.get("rowMap");
		Map<BigInteger, Map<BigInteger, UcSeqDiagram>> rowMap = appUtil.convertSequenceListToMap(rowList);
		dbUtil.generateSignatureAndSave(rowMap,  sequenceVersion );
	}
	//@Test
	public void queryHQL() throws Exception {
//		dbUtil.getSystemMstList(new BigInteger("2"), "2");
//		List<UcSeqDiagramDraft> ucSeqDiagramDraftList = dbUtil.queryUcSeqDiagramDraftById(new BigInteger("8"), "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713");
//		List<UcSeqDiagram> rowList = converterUtil.convertUcSeqDiaDraftToUcSeqDia(ucSeqDiagramDraftList);
		//Seq init
		String userId="5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";
		UcSeqMst ucSeqMst = new UcSeqMst();
		ucSeqMst.setSeqMstId(new BigDecimal("18"));
		String userRequestAction = "add_and_display_action";
		String sequenceVersion = "DRAFT";
		String sysSeqId="";
		String forRequestId="";
		Map<String, Object> modelUc = new HashMap<String, Object>();
		
		Map<String, Object> seqMstAndRowMap=appUtil.loadSequenceIfDoesNotExist(ucSeqMst, userRequestAction, userId, sequenceVersion, modelUc, converterUtil.convertStringToBigInteger(sysSeqId), converterUtil.convertStringToBigInteger(forRequestId));
		//Scenario VERSION : will need a special flag parameter as input for DRAFT loadSequenceIfDoesNotExist
		ucSeqMst = (UcSeqMst)seqMstAndRowMap.get("ucSeqMst");
		String isEdited = (String)seqMstAndRowMap.get("isEdited");
		List<UcSeqDiagram> rowList = (List<UcSeqDiagram>)seqMstAndRowMap.get("rowMap");
		BigInteger seqMstId = converterUtil.convertBigDecimalToBigInteger((BigDecimal)seqMstAndRowMap.get("seqMstId"));
		sequenceVersion=(String)seqMstAndRowMap.get("sequenceVersion");
		
		//Step 3 : Generate sequence interactions
		Map<String, Object> interactionListAndPrintComponentObjectMap= appUtil.getSeqInteractions(rowList);
		Map<BigInteger, Map<BigInteger, UcSeqDiagram>> rowMap = appUtil.convertSequenceListToMap(rowList);
		//DOCUMENT CONSTRUCTION : interactionList 
//		List<String> interactionList = (List<String>)interactionListAndPrintComponentObjectMap.get("interactionList");
		Map<BigInteger, Map<BigInteger, UcPrintComponentObject>> draftPrintComponentObjectListMapBySystemId = (Map<BigInteger, Map<BigInteger,UcPrintComponentObject>>)interactionListAndPrintComponentObjectMap.get("printComponentObjectListMapBySystemId");
		
//		Map<BigInteger, Map<BigInteger, UcPrintComponentObject>> draftPrintComponentObjectListMapBySystemId = (Map<BigInteger, Map<BigInteger,UcPrintComponentObject>>)draftInteractionListAndPrintComponentObjectMap.get("printComponentObjectListMapBySystemId");
		
		releaseManager.processChange( rowMap, ucSeqMst, draftPrintComponentObjectListMapBySystemId
				, userRequestAction,  seqMstId,  userId,  sequenceVersion,  null);
		
//		

		
		
		
//		for(UcSeqDiagramDraft ucSeqDiagramDraft:ucSeqDiagramDraftList){
//			System.out.println("============seqItemId="+ucSeqDiagramDraft.getSeqItemId()+" ====="+ucSeqDiagramDraft.getRowNo()+" ====="+ucSeqDiagramDraft.getColNo()+" ===");
//			System.out.println("               requestId  "+ucSeqDiagramDraft.getRequestId());
//			System.out.println("               requestName  "+ucSeqDiagramDraft.getRequest());
//			System.out.println("               ---- responseId  "+ucSeqDiagramDraft.getResponseId());
//			System.out.println("               ---- responseName  "+ucSeqDiagramDraft.getResponse());
//			System.out.println("               systemId  "+ucSeqDiagramDraft.getSystemId());
//			System.out.println("               systemName  "+ucSeqDiagramDraft.getSystemName());
//			System.out.println("               systemType  "+ucSeqDiagramDraft.getSystemType());
//		}
		
		//Add ucSeqDiagramFromMap
//				seqMstId=23
//
//				SeqName = OWSSdd
//
//				ucSeqDiagram    UcSeqDiagram  (id=201)    
//				asynchColNo    null    
//				asynchRowNo    null    
//				asynchSeqItemId    null    
//				asynchSourceDestination    null    
//				colNo    BigInteger  (id=204)    =======2
//				description    null    
//				draftRequestProtocol    null    
//				draftSampleFailureResponse    null    
//				draftSampleRequest    null    
//				draftSampleResponse    null    
//				expanded    null    
//				forRequestId    null    
//				ifCondition    null    
//				itemSignature    null    
//				lastChildRowNo    null    
//				menuImageUrl    null    
//				request    null    
//				requestChanged    false    
//				requestId    null    
//				requestNew    null    
//				requestPropertiesFound    null    
//				requestProtocol    null    
//				response    null    
//				responseChanged    false    
//				responseId    null    
//				responseNew    null    
//				responsePropertiesFound    null    
//				rowNo    BigInteger  (id=234)    =============2
//				sampleFailureResponse    null    
//				sampleRequest    null    
//				sampleSuccessResponse    null    
//				sectionName    null    
//				selected    null    
//				seqItemChanged    false    
//				seqItemId    BigDecimal  (id=235)    ===========0
//				seqMstId    BigInteger  (id=236)    ============23
//				serialNumber    null    
//				serialNumberDisplay    null    
//				sysSeqId    BigInteger  (id=237)    ======0
//				systemChanged    false    
//				systemId    null    
//				systemName    "application_server" (id=238)    
//				systemNew    null    
//				systemPropertiesFound    null    
//				systemType    "application_server" (id=238)    
//				userId    "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713" (id=211) 
		
//		=====ITEM to be created as sys_seq=======seqItemId=46 =====6 =====4 ===
//        requestId  310
//        requestName  SKPayment
//        ---- responseId  226
//        ---- responseName  SKPaymentTransaction
//        systemId  199
//        systemName  store_kit
//        systemType  store_kit
		UcSeqDiagram ucSeqDiagram = new UcSeqDiagram();
		ucSeqDiagram.setColNo(new BigInteger("4"));
		ucSeqDiagram.setRowNo(new BigInteger("5"));
		ucSeqDiagram.setRequestChanged(false);
		ucSeqDiagram.setResponseChanged(false);
		ucSeqDiagram.setSeqItemChanged(false);
		ucSeqDiagram.setSeqItemId(new BigDecimal("0"));
//		ucSeqDiagram.setSeqMstId(ucSeqDiagramDraftList.get(0).getSeqMstId());
		ucSeqDiagram.setSysSeqId(new BigInteger("0"));
		ucSeqDiagram.setSystemChanged(false);
		ucSeqDiagram.setSystemName("store_kit");
		ucSeqDiagram.setSystemType("store_kit");
		ucSeqDiagram.setUserId("5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713");

		
//		
		Map<String, Object> returnObjectMap = sequenceObject.updateSeqDiagramMap(converterUtil.convertBigIntegerToBigDecimal(ucSeqDiagram.getSeqMstId()),"SDFFF", ucSeqDiagram, SeqDiagramOperationEnum.ADD, AddPositionEnum.SAME_LEVEL, "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713", AppConstants.ZERO_BIG_INTEGER, AppConstants.ZERO_BIG_INTEGER, "DRAFT", "add_and_display_action");
//		
//		//This is update 
//		returnObjectMap= sequenceObject.updateSeqDiagramMap(converterUtil.convertBigIntegerToBigDecimal(ucSeqDiagram.getSeqMstId()),"SDFFF", ucSeqDiagram, SeqDiagramOperationEnum.MODIFY, null, "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713", AppConstants.ZERO_BIG_INTEGER, AppConstants.ZERO_BIG_INTEGER, "DRAFT", "update_uc_seq_diagram_action");
//		//this is the changed ucSeqDiagramFromMap
//		UcSeqDiagram ucSeqDiagramFromMap = new UcSeqDiagram();

//		 dbUtil.saveSequence(rowMap,0,  "", sequenceVersion, ucSeqMst);
		 
		 //ucSeqMst
//		 acrossVersionSeqId    null    
//		 acrossVersionSysSeqId    null    
//		 baseSeqMstId    BigInteger  (id=124)    ======0
//		 baseSysSeqId    null    
//		 changeNote    "Umbrella project is my favourate" (id=127)    
//		 changeSetId    null    
//		 changeTitle    "Opp seq built for Umbrella project" (id=128)    
//		 createdDate    Timestamp  (id=159)    
//		 currentDevSysSeqId    null    
//		 defaultMenu    "Y" (id=162)    
//		 editedBy    "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713" (id=163)    
//		 editedDate    Timestamp  (id=164)    
//		 isEdited    "N" (id=132)    
//		 isPublic    "N" (id=165)    
//		 isRepo    "N" (id=166)    
//		 lastMadeLinkSecureDate    null    
//		 lastMadeLinkShareDateFacebook    null    
//		 lastMadeLinkShareDateGplus    null    
//		 lastMadeLinkShareDateLinkin    null    
//		 lastMadeLinkShareDateTwitter    null    
//		 oneWay    null    
//		 seqDescription    "" (id=167)    
//		 seqMstId    BigDecimal  (id=147)    ======23
//		 seqName    "OppWOW" (id=168)    
//		 sysSeqId    null    
//		 ucId    null    
//		 userId    "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713" (id=169)    
		
		
	}
	
	//@Test
//	public void daoTest(){
//		List<UcSeqDiagramProperty> ucSeqDiagramPropertyList = new ArrayList<UcSeqDiagramProperty>();
//			DetachedCriteria criteriaUcSeqDiagramProperty = DetachedCriteria
//					.forClass(UcSeqDiagramProperty.class)
//					.add(Property.forName("seqItemId").eq(new BigInteger("1137")));
//			criteriaUcSeqDiagramProperty.add(Property.forName("userId").eq(	new BigInteger("2")));
//			criteriaUcSeqDiagramProperty.add(Property.forName("propertyFor").eq("SYSTEM"));
//			ucSeqDiagramPropertyList = ucSeqDiagramPropertyDao.findByCriteria(criteriaUcSeqDiagramProperty);
//
//			System.out.println("length="+ucSeqDiagramPropertyList.size());
//	}
//	@Test
//	public void jsonToJavaTest(){
//		String jsonString="{\"Customer\" :{\"name\":\"shirish\",\"phone\":\"0412104650\"}";
//
//		System.out.println("length="+jsonString);
//		JSONObject json = null;
//		try {
//			json = (JSONObject)new JSONParser().parse("{\"name\":\"MyNode\", \"width\":200, \"height\":100}");
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	    System.out.println("name=" + json.get("name"));
//	    System.out.println("width=" + json.get("width"));
//		
//	}
//	
//	class Customer{
//		String name;
//		String phone;
//		
//	}

}
