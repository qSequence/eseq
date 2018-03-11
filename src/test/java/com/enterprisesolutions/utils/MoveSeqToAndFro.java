package com.enterprisesolutions.utils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enterprisesolutions.dao.UcSystemMstDao;
import com.enterprisesolutions.hibernate.model.UcRequestMst;
import com.enterprisesolutions.hibernate.model.UcResponseMst;
import com.enterprisesolutions.hibernate.model.UcSeqDiagram;
import com.enterprisesolutions.hibernate.model.UcSeqDiagramProperty;
import com.enterprisesolutions.hibernate.model.UcSeqMst;
import com.enterprisesolutions.hibernate.model.UcSystemMst;
import com.enterprisesolutions.utils.AppUtil;
import com.enterprisesolutions.utils.ConverterUtil;
import com.enterprisesolutions.utils.DbUtil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:test-enterprise-solution-servlet.xml")
public class MoveSeqToAndFro {
    @Autowired
    DbUtil dbUtil;
    @Autowired
    AppUtil appUtil;    
    @Autowired
    ConverterUtil converterUtil;
    @Autowired
    SessionFactory prodSessionFactory;
    @Autowired
    UcSystemMstDao ucSystemMstDao;

    
    @Test
    public void testSeq() {
        String userId = "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";;
        String hqlQuery = "select fM from UcSeqDiagram fM  WHERE  userId = :userId";
		Object[] values = new Object[] { userId};
		String[] paramNames = new String[] { "userId" };
		List<UcSeqDiagram> tempPropertyRequestList = (List<UcSeqDiagram>) ucSystemMstDao.findByCreateQuery(hqlQuery, paramNames, values);
        for(UcSeqDiagram ucSeqDiagram:tempPropertyRequestList){
        	String hqlQuery2 = "update UcResponseMst set relatedRequestId = :requestId where responseId= :responseId"; 
        	Object[] values1 = new Object[] { ucSeqDiagram.getRequestId(), converterUtil.convertBigIntegerToBigDecimal(ucSeqDiagram.getResponseId())};
    		String[] paramNames1 = new String[] { "requestId", "responseId" };
    		ucSystemMstDao.deleteByHqlQuery(hqlQuery2, paramNames1, values1);
        }
        
    }
    //@Test
    public void deleteSeq() {
        BigInteger seqMstId = new BigInteger("64");
        String userId = "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";;
        //DELETE from TEST
        //dbUtil.deleteSequence(seqMstId, userId);
        //DELETE from PROD
        Session session = prodSessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
//        UcSeqDiagramProperty ent = (UcSeqDiagramProperty) session.get(UcSeqDiagramProperty.class, new BigDecimal("242"));
//        session.delete(ent);  sess.delete("from Employee e where e.id = '1234'");
        Query query = session.createQuery("from UcSeqDiagramProperty u where u.seqMstId = :seqMstId");
        query.setBigInteger("seqMstId", seqMstId);
        List<UcSeqDiagramProperty> ucSeqDiagramPropertyList = (List<UcSeqDiagramProperty>)query.list();
        for(UcSeqDiagramProperty ucSeqDiagramProperty:ucSeqDiagramPropertyList){
            session.delete(ucSeqDiagramProperty); 
        }
        transaction.commit();
        session.close();
        
    }
    //@Test
    public void updateOrCopySeq() {
        String fromUser = "5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";
        String toUser = "TEST_User_5eb9fe01-5209-43e6-ab5d-1146c186606f140519211713";
        BigDecimal seqMstId = new BigDecimal("48");
        
        String action="COPY"; //UPDATE or COPY , if copy se will be copied to another user
        UcSeqMst ucSeqMstNew = new UcSeqMst();
        ucSeqMstNew.setSeqMstId(seqMstId);
        //Item 1 .....
        List<UcSystemMst> ucSystemMstList = dbUtil.getSystemMstList(converterUtil.convertBigDecimalToBigInteger(seqMstId), fromUser);

        //Item 2 .....
        List<UcRequestMst> requestMstList = dbUtil.getRequestMstList(converterUtil.convertBigDecimalToBigInteger(seqMstId), fromUser);
        //Item 3 .....
        List<UcResponseMst> responseMstList = dbUtil.getResponseMstList(converterUtil.convertBigDecimalToBigInteger(seqMstId), fromUser);
        //Item 4 .....
        UcSeqMst ucSeqMst= dbUtil.queryUcSeqMstBySeqMstId(ucSeqMstNew, fromUser);
        
            /****
             *  Add the system from the SeqMst to SystemList 
             */
       // ucSystemMstList.addAll(getSystemMstList(converterUtil.convertBigIntegerToBigDecimal(ucSeqMst.getSystemId()), fromUser));
        
        //Item 5 .....
        List<UcSeqDiagram> ucSeqDiagramList = dbUtil.queryUcSeqDiagramById(converterUtil.convertBigDecimalToBigInteger(seqMstId), fromUser);
        //Item 6 .....
        List<UcSeqDiagramProperty> ucSeqDiagramPropertyList = null; //TODO: fix this dbUtil.queryUcSeqDiagramPropertyBySeqMstId(converterUtil.convertBigDecimalToBigInteger(seqMstId), fromUser);
        
        //Changed ID's MAPs...key =OLD_Value , value=NEW_Value
        Map<BigInteger, BigInteger> systemIdMap = new HashMap<BigInteger, BigInteger>();
        
        Map<BigInteger, BigInteger> requestIdMap = new HashMap<BigInteger, BigInteger>();
        Map<BigInteger, BigInteger> responseIdMap = new HashMap<BigInteger, BigInteger>();
        Map<BigInteger, BigInteger> seqMstIdMap = new HashMap<BigInteger, BigInteger>();
        Map<BigInteger, BigInteger> seqItemIdMap = new HashMap<BigInteger, BigInteger>();
        
        Session session = prodSessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        //Saving Item....1

        for(UcSystemMst ucSystemMst:ucSystemMstList){
            //Create CLONE
            //AppUtil
            
            ucSystemMst.setUserId(toUser);
            BigInteger oldId=converterUtil.convertBigDecimalToBigInteger(ucSystemMst.getSystemId());
            if(action.equals("COPY")){
                ucSystemMst.setSystemId(null);
            }else if(action.equals("UPDATE")){
                //do nothing
            }
            session.save(ucSystemMst);
            systemIdMap.put(oldId, converterUtil.convertBigDecimalToBigInteger(ucSystemMst.getSystemId()));
        }


        //Saving Item....2
        
        for(UcRequestMst ucRequestMst:requestMstList){
            ucRequestMst.setUserId(toUser);
            BigInteger oldId=converterUtil.convertBigDecimalToBigInteger(ucRequestMst.getRequestId());
            if(action.equals("COPY")){
                ucRequestMst.setRequestId(null);
            }else if(action.equals("UPDATE")){
                //do nothing
            }
            ucRequestMst.setSystemId(systemIdMap.get(ucRequestMst.getSystemId()));
            session.save(ucRequestMst);
            requestIdMap.put(oldId, converterUtil.convertBigDecimalToBigInteger(ucRequestMst.getRequestId()));
            
        }

        //Saving Item....3
        for(UcResponseMst ucResponseMst:responseMstList){
            ucResponseMst.setUserId(toUser);
            BigInteger oldId=converterUtil.convertBigDecimalToBigInteger(ucResponseMst.getResponseId());
            if(action.equals("COPY")){
                ucResponseMst.setResponseId(null);
            }else if(action.equals("UPDATE")){
                //do nothing
            }
            ucResponseMst.setSystemId(systemIdMap.get(ucResponseMst.getSystemId()));
            session.save(ucResponseMst);
            responseIdMap.put(oldId, converterUtil.convertBigDecimalToBigInteger(ucResponseMst.getResponseId()));
            
        }

        //Saving Item....4
        ucSeqMst.setUserId(toUser);
        BigInteger oldId=converterUtil.convertBigDecimalToBigInteger(ucSeqMst.getSeqMstId());
        if(action.equals("COPY")){
            ucSeqMst.setSeqMstId(null);
        }else if(action.equals("UPDATE")){
            //do nothing
        }
        //This is NULLL..................................................................................................................
       // ucSeqMst.setSystemId(systemIdMap.get(ucSeqMst.getSystemId()));
        session.save(ucSeqMst);
        seqMstIdMap.put(oldId, converterUtil.convertBigDecimalToBigInteger(ucSeqMst.getSeqMstId()));

        //Saving Item....5
        for(UcSeqDiagram ucSeqDiagram:ucSeqDiagramList){
            ucSeqDiagram.setUserId(toUser);
            BigInteger oldId1=converterUtil.convertBigDecimalToBigInteger(ucSeqDiagram.getSeqItemId());
            if(action.equals("COPY")){
                ucSeqDiagram.setSeqItemId(null);
            }else if(action.equals("UPDATE")){
                //do nothing
            }
            ucSeqDiagram.setSystemId(systemIdMap.get(ucSeqDiagram.getSystemId()));
            ucSeqDiagram.setRequestId(requestIdMap.get(ucSeqDiagram.getRequestId()));
            ucSeqDiagram.setResponseId(responseIdMap.get(ucSeqDiagram.getResponseId()));
            //This is NULLL..................................................................................................................
            ucSeqDiagram.setSeqMstId(seqMstIdMap.get(ucSeqDiagram.getSeqMstId()));
            
            session.save(ucSeqDiagram);
            seqItemIdMap.put(oldId1, converterUtil.convertBigDecimalToBigInteger(ucSeqDiagram.getSeqItemId()));
            
        }

        //Saving Item....6
        
        for(UcSeqDiagramProperty ucSeqDiagramProperty:ucSeqDiagramPropertyList){
            ucSeqDiagramProperty.setUserId(toUser);
            BigInteger oldId1=converterUtil.convertBigDecimalToBigInteger(ucSeqDiagramProperty.getPropertyId());
            if(action.equals("COPY")){
                ucSeqDiagramProperty.setPropertyId(null);
            }else if(action.equals("UPDATE")){
                //do nothing
            }
            //ALL are null is NULLL..................................................................................................................
            ucSeqDiagramProperty.setSystemId(systemIdMap.get(ucSeqDiagramProperty.getSystemId()));
            ucSeqDiagramProperty.setRequestId(requestIdMap.get(ucSeqDiagramProperty.getRequestId()));
            ucSeqDiagramProperty.setResponseId(responseIdMap.get(ucSeqDiagramProperty.getResponseId()));
         //   ucSeqDiagramProperty.setSeqMstId(seqMstIdMap.get(ucSeqDiagramProperty.getSeqMstId()));
           // ucSeqDiagramProperty.setSeqItemId(seqItemIdMap.get(ucSeqDiagramProperty.getSeqItemId()));
            
            session.save(ucSeqDiagramProperty);
            responseIdMap.put(oldId1, converterUtil.convertBigDecimalToBigInteger(ucSeqDiagramProperty.getPropertyId()));
            
        }


        transaction.commit();
        session.close();
    }
    
    public UcSystemMst getClone(UcSystemMst ucSystemMst) {
        // TODO Auto-generated method stub
        UcSystemMst ucSystemMstToBeUpdated =null;
        try {
            ucSystemMstToBeUpdated = (UcSystemMst) BeanUtils.cloneBean(ucSystemMst);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucSystemMstToBeUpdated ;
    }

    public UcRequestMst getClone(UcRequestMst ucRequestMst) {
        // TODO Auto-generated method stub
        UcRequestMst ucRequestMstToBeUpdated =null;
        try {
            ucRequestMstToBeUpdated = (UcRequestMst) BeanUtils.cloneBean(ucRequestMst);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucRequestMstToBeUpdated ;
    }
    
    public UcResponseMst getClone(UcResponseMst ucResponseMst) {
        // TODO Auto-generated method stub
        UcResponseMst ucResponseMstToBeUpdated =null;
        try {
            ucResponseMstToBeUpdated = (UcResponseMst) BeanUtils.cloneBean(ucResponseMst);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucResponseMstToBeUpdated ;
    }
    
    public UcSeqMst getClone(UcSeqMst ucSeqMst) {
        // TODO Auto-generated method stub
        UcSeqMst ucSeqMstToBeUpdated =null;
        try {
            ucSeqMstToBeUpdated = (UcSeqMst) BeanUtils.cloneBean(ucSeqMst);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucSeqMstToBeUpdated ;
    }
    
    public UcSeqDiagram getClone(UcSeqDiagram ucSeqDiagram) {
        // TODO Auto-generated method stub
        UcSeqDiagram ucSeqDiagramToBeUpdated =null;
        try {
            ucSeqDiagramToBeUpdated = (UcSeqDiagram) BeanUtils.cloneBean(ucSeqDiagram);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucSeqDiagramToBeUpdated ;
    }

    public UcSeqDiagramProperty getClone(UcSeqDiagramProperty ucSeqDiagramProperty) {
        // TODO Auto-generated method stub
        UcSeqDiagramProperty ucSeqDiagramPropertyToBeUpdated =null;
        try {
            ucSeqDiagramPropertyToBeUpdated = (UcSeqDiagramProperty) BeanUtils.cloneBean(ucSeqDiagramProperty);
    
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ucSeqDiagramPropertyToBeUpdated ;
    }
    
    public List<UcSystemMst> getSystemMstList(BigDecimal systemId, String userId) {
        List<UcSystemMst> ucSystemMstList = new ArrayList<UcSystemMst>();
        
        String hqlQuery = "";
        hqlQuery = "SELECT sM FROM UcSystemMst sM WHERE sM.systemId = :systemId and userId = :userId)";

        Object[] values = new Object[] { systemId, userId };
        String[] paramNames = new String[] { "systemId", "userId" };

        ucSystemMstList = (List<UcSystemMst>) ucSystemMstDao.findByCreateQuery(hqlQuery, paramNames, values);
//        System.out.println(" Map Size===============");
//        for (final Object obj : ucSystemMstList) {
//            UcSystemMst ucSystemMst = (UcSystemMst) ((Object[]) obj)[0];
//        }// end for

        return ucSystemMstList;

    }
}
