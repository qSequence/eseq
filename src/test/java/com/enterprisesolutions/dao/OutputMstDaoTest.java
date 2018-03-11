//package com.enterprisesolutions.dao;
//
//import java.math.BigDecimal;
//import java.math.BigInteger;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.enterprisesolutions.hibernate.model.OutputMst;
//import com.enterprisesolutions.hibernate.model.UcDet;
//import com.enterprisesolutions.hibernate.model.UcMst;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:enterprise-solution-servlet.xml")
//public class OutputMstDaoTest {
//	
//	@Autowired
//	OutputMstDao outputMstDao;
//
//	
//	@Test
//	public void saveOutputMst() {
//		
//		
//		OutputMst outputMst  = new OutputMst();
//		outputMst.setOutputName("output nane");
//		outputMst.setOutputType("outputType");
//		outputMst.setUcId(new BigInteger("1"));
//		BigDecimal outputId=(BigDecimal) outputMstDao.createEntity(outputMst);
//		System.out.println("output ="+outputId);
//	}
//
//	
//}
