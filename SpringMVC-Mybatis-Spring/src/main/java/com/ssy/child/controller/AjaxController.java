package com.ssy.child.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssy.child.entity.InstorageForm;
import com.ssy.child.entity.OutStorageForm;
import com.ssy.child.model.Auth;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.SupplierInfo;
import com.ssy.child.service.DbInfoService;
import com.ssy.child.service.InstorageService;
import com.ssy.child.service.MaintainService;
import com.ssy.child.service.OutStorageService;


@Controller
@RequestMapping("/ajax")
public class AjaxController extends BaseController{
	
	@Autowired
	private  HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private DbInfoService dbService;
	@Autowired
	private InstorageService instorageService;
	@Autowired
	private OutStorageService outstorageService;
	@Autowired
	private MaintainService mService;
	
	@RequestMapping(value="/getDetailGoodRestInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxGetDetailGoodRestInfo(Integer id){
		
		this.ajaxJson(dbService.getSpecGoodRestWithId(id));
	}
	

	@RequestMapping(value="/sendGoodInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxSendGoodInfo(InstorageForm goodInfo){
		
		this.ajaxJson(instorageService.setGoodInfo(goodInfo));
	}
	
	@RequestMapping(value="/outputGoods",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxOutputGoods(OutStorageForm outStorageForm){
		outStorageForm.setPeople(0);//暂时未加权限管理
		this.ajaxText(outstorageService.OutputGoods(outStorageForm));
	}
	
	@RequestMapping(value="/sendSupplierInfo" , method = RequestMethod.POST)
	@ResponseBody
	public void ajaxAddSupplier(SupplierInfo supplierInfo){
		Auth user = new Auth();
		user.setId(0);//暂时未加权限管理
		this.ajaxText(mService.addSupplier(supplierInfo, user));
	}
	
	@RequestMapping(value="/delSupplierInfo", method=RequestMethod.POST)
	@ResponseBody
	public void ajaxDelSupplier(Integer id){
		this.ajaxText(mService.delSupplier(id));
	}
	
	@RequestMapping(value="/sendGoodCatalogInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxAddGood(GoodCatalogInfo goodCatalogInfo){
		Auth user = new Auth();
		user.setId(0);//暂时未加权限管理
		this.ajaxText(mService.addGood(goodCatalogInfo, user));
	}
	
//	@RequestMapping(value="/delGood",method = RequestMethod.POST)
//	@ResponseBody
//	public void ajaxDelGood(Integer id){
//		this.ajaxText(mService.delGood(id));
//	}
	@RequestMapping(value = "/getGoodDetailInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxGetGoodDetailInfo(Integer id){
		this.ajaxJson(mService.getSpecGoodWithId(id));
	}
	
	@RequestMapping(value = "/modifyGoodCatalogInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxModifyGood(GoodCatalogInfo goodCatalogInfo){
		Auth user = new Auth();
		user.setId(0);//暂时未加权限管理
		this.ajaxText(mService.updateGood(goodCatalogInfo, user));
	}
	
	@RequestMapping(value="/getSupplierCatalog",method=RequestMethod.POST)
	@ResponseBody
	public void ajaxSupplierCatalog(){
		this.ajaxJson(mService.getSupplierCatalog());
	}
	
	@RequestMapping(value="/getGoodNameCatalog",method=RequestMethod.POST)
	@ResponseBody
	public void ajaxGoodNameCatalog(){
		this.ajaxJson(mService.getGoodCatalog());
	}
	
	@RequestMapping(value = "/getGoodInfo",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxGetGoodInfo(Integer id){
		this.ajaxJson(mService.getGoodInfoWithId(id));
	}
	
	@RequestMapping(value = "/getGoodCodeCatalog",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxGetGoodCodeInfo(Integer id){
		this.ajaxJson(mService.getGoodCodeInfo(id));
	}
	
	@RequestMapping(value = "/getPeopleCatalog",method = RequestMethod.POST)
	@ResponseBody
	public void ajaxGetPeopleInfo(Integer id){
		this.ajaxJson(mService.getPeopleInfo());
	}
}
