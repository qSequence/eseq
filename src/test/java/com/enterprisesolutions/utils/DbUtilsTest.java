package com.enterprisesolutions.utils;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

//import org.apache.lucene.analysis.standard.StandardAnalyzer;
//import org.apache.lucene.document.Document;
//import org.apache.lucene.document.Field;
//import org.apache.lucene.index.IndexWriter;
//import org.apache.lucene.index.IndexWriterConfig;
//import org.apache.lucene.index.IndexableField;
//import org.apache.lucene.store.Directory;
//import org.apache.lucene.store.NIOFSDirectory;
//import org.apache.lucene.store.SimpleFSDirectory;
//import org.apache.lucene.util.Version;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enterprisesolutions.hibernate.model.PayPalDetails;
import com.enterprisesolutions.hibernate.model.UcSeqDiagram;
import com.enterprisesolutions.hibernate.model.UcSeqDiagramProperty;
import com.enterprisesolutions.hibernate.model.UcSeqMst;
//import org.apache.lucene.util.packed.PackedInts.Writer;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:test-enterprise-solution-servlet.xml")

public class DbUtilsTest {

	@Autowired
	DbUtil dbUtil;
	
	@Test
	public void queryProductFeatureTest() {
		
		Map<BigInteger, Map<String, BigInteger>> a = dbUtil.queryProductFeature();
		
		System.out.println(" Map Size="+a.size());
		
		
	}
	
	//@Test
	public void queryPayPalDetails() {
		@SuppressWarnings("unused")
		List<PayPalDetails> payPalDetailsList=dbUtil.queryPayPalDetailsByStatus();
		System.out.println("-----------");
	}
	
//	@Test
//	public void indexDBRecodrs() {
		
		
		/*
		 * Add the following JARS to the path then try this again
		 * 
		 * 
		 * 	<classpathentry kind="lib" path="C:/aPPLICATIONS/Lucene_JARS/lucene-core-4.2.1.jar"/>
			<classpathentry kind="lib" path="C:/aPPLICATIONS/Lucene_JARS/lucene-queryparser-4.2.1.jar"/>
			<classpathentry kind="lib" path="C:/aPPLICATIONS/Lucene_JARS/lucene-analyzers-common-4.2.1.jar"/>
		 * 
		 */
		
		
		
//		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_42);
//		try {
//			File file =new File("C:/Software/LuceneIndex_DATA/");
//			Directory dir = new NIOFSDirectory(file ); //- this does not work on windows but it is more efficient check DOC
//			//Directory dir = new SimpleFSDirectory(file);
//			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_42, analyzer);
//			IndexWriter w = new IndexWriter(dir, config);
//			
//			
//		 Map<String, Object> ucSeqDiagramPropertyList = dbUtil.queryUcSeqDiagramProperties(new BigInteger("1136"),new BigInteger("1136"),new BigInteger("1136"), "2","system","name",null);
//		Document doc = new Document();		
//		for(UcSeqDiagramProperty ucSeqDiagramProperty:ucSeqDiagramPropertyList){
//System.out.println("dsfffffffffffff");
//
//			doc.add(new Field("id", ucSeqDiagramProperty.getPropertyId().toString(), Field.Store.YES, Field.Index.ANALYZED));
//			
//		}
//		

//			w.addDocument(doc);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}//addDocument(doc);	
//		System.out.println("-----------");
//	}
	@Ignore
	public void queryRecords() {

		List<UcSeqMst> a = dbUtil.queryUcSeqMstBySearchString( "Kkk", "6");
		
		
		
		List<UcSeqDiagram> b=dbUtil.queryUcSeqDiagramBySearchString( "Kkk", "6");
		List<UcSeqDiagramProperty> c=dbUtil.queryUcSeqDiagramPropertyBySearchString("Kkk", "6");
		System.out.println(b.size());
	}
}
