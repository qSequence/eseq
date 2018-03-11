//package com.enterprisesolutions.dao;
//
//import java.math.BigDecimal;
//import java.math.BigInteger;
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.enterprisesolutions.dao.UcMstDao;
//import com.enterprisesolutions.dao.hibernate.AbstractAppDaoImpl;
//import com.enterprisesolutions.dao.hibernate.UcMstDaoImpl;
//import com.enterprisesolutions.hibernate.model.UcDet;
//import com.enterprisesolutions.hibernate.model.UcMst;
//import com.enterprisesolutions.navigation.NavItem;
//import com.enterprisesolutions.utils.ConverterUtil;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:enterprise-solution-servlet.xml")
//public class UcMstDaoTest {
//	@Autowired
//	UcMstDao ucMstDao;
//
//	@Autowired
//	UcLinkedObjDetDao ucLinkedObjDetDao; 
//	@Autowired
//	ConverterUtil converterUtil;
//	
//	@Autowired
//	AbstractAppDaoImpl<NavItem> abstractAppDaoImpl;
//	
//	
//	@Test
//	public void saveUcMst() {
//		
//		
//		UcMst ucMst  = new UcMst();
//		ucMst.setUcName("ucName-yyyyyyyyyyyyyyyyyyyyyyy");
//		
//		BigDecimal ucId=(BigDecimal) ucMstDao.createEntity(ucMst);
//
//		UcDet ucLinkedObjDet = new UcDet();
//		
////		ucLinkedObjDet.setObjName("objName-yyyyyyyyyyyyyyyyyyyyyy");
////		ucLinkedObjDet.setObjType("CUSTOMER");
////		ucLinkedObjDet.setUcId(converterUtil.convertBigDecimalToBigInteger(ucId));
//		ucLinkedObjDetDao.saveOrUpdateEntity(ucLinkedObjDet);
////		List<UcMst> a = jjj.
////		for (UcMst ucMst : a) {
////			System.out.println("------Uc Name:" + ucMst.getUcName());
////		}
//
//	}
//	
//	public void queryMultiTableByParentId() {
//		BigInteger parentId = new BigInteger("1"); 
//		
//
//		
//		
//	}
//}
