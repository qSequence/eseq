package com.enterprisesolutions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.enterprisesequence.core.App;

public class MyMenuController implements Controller {

	@Autowired
	App app;
	
	public ModelAndView handleRequest(HttpServletRequest httpServletRequest,
			HttpServletResponse arg1) throws Exception {
		return app.menuDisplay(httpServletRequest, arg1);
	}


//	private List<UcSeqMenuImages> querySeqMenuImagesList(String userId, String seqMstId, String symDir) {
//		List<UcSeqMenuSeqMst> ucSeqMenuSeqMstList =null;
//		List<BigDecimal> tempMenuItemList = new ArrayList<BigDecimal>();// these are the selected menu items for this sequence
//		if(seqMstId!=null && !seqMstId.isEmpty()){
//			ucSeqMenuSeqMstList = dbUtil.queryUcSeqMenuSeqMst(userId, converterUtil.convertStringToBigInteger(seqMstId));
//			for(UcSeqMenuSeqMst ucSeqMenuSeqMst:ucSeqMenuSeqMstList){
//				tempMenuItemList.add(converterUtil.convertBigIntegerToBigDecimal(ucSeqMenuSeqMst.getMenuItemId()));
//			}
//		}
//		List<UcSeqMenuImages> ucSeqMenuImagesList = dbUtil.queryUcSeqMenuImages(userId);
//		
//		for(UcSeqMenuImages ucSeqMenuImages : ucSeqMenuImagesList){
//			//set ImageUrl
//			ucSeqMenuImages.setImageUrl("/qSequence_IMAGES/"+symDir+"/"+ucSeqMenuImages.getMenuImageFileName());
//			if(tempMenuItemList.contains(ucSeqMenuImages.getMenuItemId())){
//				ucSeqMenuImages.setSelected(true);
//			}else{
//				ucSeqMenuImages.setSelected(false);
//			}
//
////			//Check if Symlink exists
////			Path file = Paths.get(symDir+"/"+ucSeqMenuImages.getMenuImageFileName());
////			boolean isSymbolicLink = Files.isSymbolicLink(file);
////			if(isSymbolicLink == false){
////				appUtil.createSymlink(Paths.get(symDir+"/"+ucSeqMenuImages.getMenuImageFileName()), Paths.get(uploadDir+"/"+ucSeqMenuImages.getMenuImageFileName()));
////			}
//			
//		}
//		return ucSeqMenuImagesList;
//	}


}