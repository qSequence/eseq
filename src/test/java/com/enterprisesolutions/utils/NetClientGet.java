//package com.enterprisesolutions.utils;
//import org.apache.commons.codec.binary.Base64;
//
//
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.URL;
//
//
//
//
//import java.io.InputStreamReader;
//import java.util.ArrayList;
//import java.util.List;
// 
//import org.apache.http.HttpResponse;
//import org.apache.http.NameValuePair;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.ByteArrayEntity;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.DefaultHttpClient;
//import org.apache.http.message.BasicNameValuePair;
//
//
//public class NetClientGet {
// 
//	// http://localhost:8080/RESTfulExample/json/product/get
//	public static void main(String[] args) {
//		String clientID = "AbUDyBAUdXtTLwyT9NvByjY48mnuHSAAl1Bn8FZC9ktzlgIdRtvOwoGUtmW-";
//		String secret = "EFVUvxAi7VgzPkBi3viq-LHrnDmpSXEAyNUkicgNHRxPpkaRMuA_zkQ7VnYC";
//
//	  try {
//		  String base64EncodedCredentials = "Basic " + Base64.encodeBase64String((clientID + ":" + secret).getBytes());
//	//	  Base64.encodeBase64String(binaryData)
//    //		  String base64EncodedCredentials = "Basic " + clientID + ":" + secret;
////		URL url = new URL("https://api.sandbox.paypal.com/v1/oauth2/token");
////		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
////		conn.setRequestMethod("POST");
////		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
////		conn.setRequestProperty("Accept-Language", "en_US");
////		conn.setRequestProperty("Authorization", base64EncodedCredentials);
////
////		conn.setRequestProperty("grant_type", "client_credentials");
//// 
////		if (conn.getResponseCode() != 200) {
////			throw new RuntimeException("Failed : HTTP error code : "
////					+ conn.getResponseCode());
////		}
//// 
////		BufferedReader br = new BufferedReader(new InputStreamReader(
////			(conn.getInputStream())));
//// 
////		String output;
////		System.out.println("Output from Server .... \n");
////		while ((output = br.readLine()) != null) {
////			System.out.println(output);
////		}
//// 
////		conn.disconnect();
// 
//
//// 
//		////////////////STEP 1 get token
//
////		HttpClient client = new DefaultHttpClient();
////		String url = "https://api.sandbox.paypal.com/v1/oauth2/token";
//////		 
////		HttpPost post = new HttpPost(url);
//// 
////		// add header
////		
////		post.setHeader("Content-Type", "application/x-www-form-urlencoded");
////		post.setHeader("Accept-Language", "en_US");
////		post.setHeader("Authorization", base64EncodedCredentials);
//// 
////		List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
////		urlParameters.add(new BasicNameValuePair("grant_type", "client_credentials"));
//// 
////		post.setEntity(new UrlEncodedFormEntity(urlParameters));
////
////		HttpResponse response = client.execute(post);
////		System.out.println("\nSending 'POST' request to URL : " + url);
////		System.out.println("Post parameters : " + post.getEntity());
////		System.out.println("Response Code : " + 
////                                    response.getStatusLine().getStatusCode());
//// 
////		BufferedReader rd = new BufferedReader(
////                        new InputStreamReader(response.getEntity().getContent()));
//// 
////		StringBuffer result = new StringBuffer();
////		String line = "";
////		while ((line = rd.readLine()) != null) {
////			result.append(line);
////		}
//// 
////		System.out.println(result.toString());
//		
//		
//		
//		/////GOT TOKEN/////////////////////////////////////////////
//////////////////STEP 2 process payment using token
//		String payurl = "https://api.sandbox.paypal.com/v1/payments/payment";			
////		String data="{"+
////			  "\"intent\":\"sale\","+
////			  "\"redirect_urls\":{"+
////				"\"return_url\":\"http://spericorn.com/newpaypal/PayPalReturn.cfm\","+
////				"\"cancel_url\":\"http://spericorn.com/newpaypal/PayPalcancel.cfm\""+
////			  "},"+
////			  "\"payer\":{"+
////				"\"payment_method\":\"paypal\""+
////			  "},"+
////			  "\"transactions\":["+
////				"{"+
////				  "\"amount\":{"+
////					"\"total\":\"10\","+
////					"\"currency\":\"USD\""+
////				  "},"+
////				  "\"description\":\"This is the payment transaction description.\""+
////				"}"+
////			  "]"+
////			"}";
////		String dataPayPal="{\"intent\":\"sale\",\"redirect_urls\":{\"return_url\":\"http://spericorn.com/newpaypal/PayPalReturn.cfm\",\"cancel_url\":\"http://spericorn.com/newpaypal/PayPalcancel.cfm\"},\"payer\":{\"payment_method\":\"paypal\"},\"transactions\":[{\"amount\":{\"total\":10,\"currency\":\"USD\"},\"description\":\"This is the payment transaction description.\"}]}";
//		String dataCreditCard="{ \"intent\": \"sale\", \"payer\": { \"payment_method\": \"credit_card\", \"funding_instruments\": [ { \"credit_card\": { \"number\": \"5500005555555559\", \"type\": \"mastercard\", \"expire_month\": 12, \"expire_year\": 2018, \"cvv2\": 111, \"first_name\": \"Betsy\", \"last_name\": \"Buyer\" } } ] }, \"transactions\": [ { \"amount\": { \"total\": \"7.47\", \"currency\": \"USD\" }, \"description\": \"This is the payment transaction description.\" } ] }";
//		String data=dataCreditCard;
////		String data="{ \"intent\": \"sale\", \"payer\": { \"payment_method\": \"credit_card\", \"funding_instruments\": [ { \"credit_card\": { \"number\": \"5500005555555559\", \"type\": \"mastercard\", \"expire_month\": 12, \"expire_year\": 2018, \"cvv2\": 111, \"first_name\": \"Betsy\", \"last_name\": \"Buyer\" } } ] }, \"transactions\": [ { \"amount\": { \"total\": \"7.47\", \"currency\": \"USD\" }, \"description\": \"This is the payment transaction description.\" } ] }";
//		//		curl -v https://api.sandbox.paypal.com/v1/payments/payment -H 'Content-Type: application/json' -H 'Authorization: Bearer o6R5CF-xSAEGJk50EYcrnmv0GsGx-u.vo3AHYsisf9k' -d '{"intent":"sale","redirect_urls":{"return_url":"http://spericorn.com/newpaypal/PayPalReturn.cfm","cancel_url":"http://spericorn.com/newpaypal/PayPalcancel.cfm"},"payer":{"payment_method":"paypal"},"transactions":[{"amount":{"total":10,"currency":"USD"},"description":"This is the payment transaction description."}]}'
//		System.out.println("data="+data);
//		HttpClient payclient = new DefaultHttpClient();
//		HttpPost paypost = new HttpPost(payurl);
// 
//		// add header
//		
//		paypost.setHeader("Content-Type", "application/json");
//		paypost.setHeader("Accept-Language", "en_US");
//		paypost.setHeader("Authorization", "Bearer A015PGl7.4wCmphpmXT6bpit9bJA3UTXMHENmB1CDeq4hT4");
//		//StringEntity se = new StringEntity( "JSON: " + data); 
//		paypost.setEntity(new ByteArrayEntity(
//			    data.toString().getBytes("UTF8")));
//		HttpResponse payresponse = payclient.execute(paypost);
//		System.out.println("\nSending 'POST' request to URL : " + payurl);
//		System.out.println("Post parameters : " + paypost.getEntity());
//		System.out.println("Response Code : " + 
//				payresponse.getStatusLine().getStatusCode());
// 
//		BufferedReader payrd = new BufferedReader(
//                        new InputStreamReader(payresponse.getEntity().getContent()));
// 
//		StringBuffer payresult = new StringBuffer();
//		String payline = "";
//		while ((payline = payrd.readLine()) != null) {
//			payresult.append(payline);
//		}
// 
//		System.out.println(payresult.toString());
//		
//
//////////////////STEP 3 process refund using payer_id
////		String refundurl = "https://api.sandbox.paypal.com/v1/payments/sale/6K296613TN416935W/refund";
//		
////		String refunddata="{  }";
////		//		curl -v https://api.sandbox.paypal.com/v1/payments/payment -H 'Content-Type: application/json' -H 'Authorization: Bearer o6R5CF-xSAEGJk50EYcrnmv0GsGx-u.vo3AHYsisf9k' -d '{"intent":"sale","redirect_urls":{"return_url":"http://spericorn.com/newpaypal/PayPalReturn.cfm","cancel_url":"http://spericorn.com/newpaypal/PayPalcancel.cfm"},"payer":{"payment_method":"paypal"},"transactions":[{"amount":{"total":10,"currency":"USD"},"description":"This is the payment transaction description."}]}'
////		System.out.println("data="+refunddata);
////		HttpClient refundclient = new DefaultHttpClient();
////		HttpPost refundpost = new HttpPost(refundurl);
// 
//		// add header
//		
////		refundpost.setHeader("Content-Type", "application/json");
////		refundpost.setHeader("Accept-Language", "en_US");
////		refundpost.setHeader("Authorization", "Bearer nfl1th3Irk.U7om770sh8zz59h42DRb33P0qPYmdw0E");
////		//StringEntity se = new StringEntity( "JSON: " + data); 
////		refundpost.setEntity(new ByteArrayEntity(
////				refunddata.toString().getBytes("UTF8")));
////		HttpResponse refundresponse = refundclient.execute(refundpost);
////		System.out.println("\nSending 'POST' request to URL : " + refundurl);
////		System.out.println("Post parameters : " + refundpost.getEntity());
////		System.out.println("Response Code : " + 
////				refundresponse.getStatusLine().getStatusCode());
// 
////		BufferedReader refundrd = new BufferedReader(
////                        new InputStreamReader(refundresponse.getEntity().getContent()));
//// 
////		StringBuffer refundresult = new StringBuffer();
////		String refundline = "";
////		while ((refundline = refundrd.readLine()) != null) {
////			refundresult.append(refundline);
////		}
//// 
////		System.out.println(refundresult.toString());
//
//	  } catch (MalformedURLException e) {
//		  
//			e.printStackTrace();
//	 
//		  } catch (IOException e) {
//	 
//			e.printStackTrace();
//	 
//		  } 
//	}//end main method
//
//
//		  
//		  
//}
