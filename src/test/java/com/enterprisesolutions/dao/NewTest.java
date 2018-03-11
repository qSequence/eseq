package com.enterprisesolutions.dao;



import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;

import com.enterprisesolutions.hibernate.model.UcSeqDiagramProperty;

public class NewTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String jsonString="{\"Customer\" :{\"name\":\"shirish\",\"phone\":\"0412104650\"}";
		 System.out.println("name=" + jsonString);
//		JSONObject  customer = null;
//		System.out.println("length="+jsonString);
//		JSONObject json = null;
//		try {
//			json = (JSONObject)new JSONParser().parse("{\"Customer\" :{\"name\":\"shirish\",\"phone\":\"0412104650\"}}");
//			
//			customer = (JSONObject)json.get("Customer");
//			
//			
//			
//			///kjsdkjkjfds
//			JSONObject obj = new JSONObject();
//			JSONArray list = new JSONArray();
//			list.add("msg 1");
//			list.add("msg 2");
//			list.add("msg 3");
//		 
//			JSONArray msg=(JSONArray)obj.put("messages", list);
//			System.out.println("messages=" +obj.get("messages"));
//			Iterator<String> iterator = ((AbstractList) obj.get("messages")).iterator();
//			while (iterator.hasNext()) {
//				System.out.println(iterator.next());
//			}
//			List<UcSeqDiagramProperty> ucSeqDiagramPropertyList =null;
//			ucSeqDiagramPropertyList = new ArrayList<UcSeqDiagramProperty>();
//			UcSeqDiagramProperty ucSeqDiagramProperty= new UcSeqDiagramProperty();
//			ucSeqDiagramProperty.setPropertyFor("SYSTEM");
//			ucSeqDiagramProperty.setPropertyId(new BigDecimal("100"));
//			ucSeqDiagramProperty.setPropertyName("protocol");
//			ucSeqDiagramProperty.setPropertyValue("HTTP");
//			ucSeqDiagramProperty.setUserId("2");
//			ucSeqDiagramProperty.setSeqItemId(new BigInteger("1137"));
//			ucSeqDiagramPropertyList.add(ucSeqDiagramProperty);
//		
////			List<UcSeqDiagramProperty> ucSeqDiagramPropertyList1 =null;
////			ucSeqDiagramPropertyList1 = new ArrayList<UcSeqDiagramProperty>();
//			UcSeqDiagramProperty ucSeqDiagramProperty1= new UcSeqDiagramProperty();
//			ucSeqDiagramProperty1.setPropertyFor("SYSTEM");
//			ucSeqDiagramProperty1.setPropertyId(new BigDecimal("100"));
//			ucSeqDiagramProperty1.setPropertyName("protocol");
//			ucSeqDiagramProperty1.setPropertyValue("HTTP");
//			ucSeqDiagramProperty1.setUserId("2");
//			ucSeqDiagramProperty1.setSeqItemId(new BigInteger("1137"));
//			ucSeqDiagramPropertyList.add(ucSeqDiagramProperty1);
//			
//			
//			//convert to JSON
//			JSONObject obj1 = new JSONObject();
//			obj1.put("ucSeqDiagramPropertyList", ucSeqDiagramPropertyList);
//			
//			System.out.println(obj1.toJSONString());
//			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	    System.out.println("name=" + customer.get("name"));
//	    System.out.println("width=" + customer.get("phone"));
//

	}

}
