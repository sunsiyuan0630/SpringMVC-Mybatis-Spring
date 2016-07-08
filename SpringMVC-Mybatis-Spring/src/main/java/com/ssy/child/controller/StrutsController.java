package com.ssy.child.controller;





import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.ssy.child.common.PublicFunction;
import com.ssy.child.model.Auth;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.Instorage;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.model.OutstorageRecord;
import com.ssy.child.model.SupplierInfo;
import com.ssy.child.service.DbInfoService;
import com.ssy.child.service.InstorageService;
import com.ssy.child.service.MaintainService;
import com.ssy.child.service.OutStorageService;


@Controller
@RequestMapping("/struts")
public class StrutsController {

	@Autowired
	private  HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private DbInfoService dbService;
	@Autowired
	private OutStorageService osService;
	@Autowired
	private MaintainService mService;
	@Autowired
	private InstorageService iService;
	
	@RequestMapping("/injectPOJO")
	public String gotoInjectPOJO(){
		return "injectPOJO";
	}
	
	@RequestMapping("/main")
	public String gotoMain(){
		 
		return "main";
	}
	@RequestMapping("/top")
	public String getTop(){
		return "top";
	}
//	@RequestMapping(value="/test",method=RequestMethod.GET)
//	public String getTest(Integer pageNum,Integer pageSize,Model model){
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
//        CountryMapper countryMapper = sqlSession.getMapper(CountryMapper.class);
//        try {
//            PageHelper.startPage(pageNum,pageSize);
//            List<Country> list = countryMapper.selectAll();
//            PageInfo<Country> page = new PageInfo(list);
//            request.setAttribute("page", page);
//        } catch (Exception e) {
//        	request.setAttribute("err", "错误:" + e.getMessage());
//        }
//		return "test";
//	}
	@RequestMapping("/content")
	public String getContent(){
		return "content";
	}
	@RequestMapping("/left")
	public String getLeft(){
		return "left";
	}
	@RequestMapping("/storage")
	public String getIntoStorage(Integer pageNum,Integer pageSize,Integer goodId,Integer goodNumber,Float goodPrice,Integer people,Timestamp dateInput){
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;
		
		//打开页面，不涉及插入操作
		if(goodId==null){
			try {
				PageInfo<Map<String, Object>> page = dbService.getInstoragePageInfo(pageNum, pageSize);
				request.setAttribute("page", page);
			} catch (Exception e) {
				request.setAttribute("err", "错误:" + e.getMessage());
			}
		}else{
			Auth user = new Auth();
			user.setId(0);//暂时未加权限管理
			iService.instorageGood(goodId, goodNumber, goodPrice, people, dateInput, user);
			try {
				PageInfo<Map<String, Object>> page = dbService.getInstoragePageInfo(pageNum, pageSize);
				request.setAttribute("page", page);
			} catch (Exception e) {
				request.setAttribute("err", "错误:" + e.getMessage());
			}
		}
		return "storage";
	}
	@RequestMapping("/infomaintain")
	public String getInfomaintain(){
		return "infomaintain";
	}
	@RequestMapping("/outstorage")
	public String getOutStorage(Integer pageNum,Integer pageSize,String goodName,Integer goodId,Model model){
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;
		
		if((!"".equals(PublicFunction.doNull(goodName)))||(!"".equals(PublicFunction.doNull(goodId)))){
			try {
				 PageInfo<OutStorageResultMap> page = dbService.getGoodRestPageInfoWithParam(pageNum, pageSize, goodName, goodId);
				 request.setAttribute("page", page);
			} catch (Exception e) {
				 request.setAttribute("err", "错误:" + e.getMessage());
			}
		}else{
			try {
				 PageInfo<OutStorageResultMap> page = dbService.getGoodRestPageInfo(pageNum, pageSize);
				 request.setAttribute("page", page);
			} catch (Exception e) {
				 request.setAttribute("err", "错误:" + e.getMessage());
			}
		}
		
		model.addAttribute("goodName",goodName);
		model.addAttribute("goodId", goodId);
		return "outstorage";
	}
	@RequestMapping("/leftstorage")
	public String getLeftStorage(Integer pageNum,Integer pageSize,String goodName,Integer goodId,Model model){
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;
		
		if((!"".equals(PublicFunction.doNull(goodName)))||(!"".equals(PublicFunction.doNull(goodId)))){
			try {
				 PageInfo<OutStorageResultMap> page = dbService.getGoodRestPageInfoWithParam(pageNum, pageSize, goodName, goodId);
				 request.setAttribute("page", page);
			} catch (Exception e) {
				 request.setAttribute("err", "错误:" + e.getMessage());
			}
		}else{
			try {
				 PageInfo<OutStorageResultMap> page = dbService.getGoodRestPageInfo(pageNum, pageSize);
				 request.setAttribute("page", page);
			} catch (Exception e) {
				 request.setAttribute("err", "错误:" + e.getMessage());
			}
		}
		
		model.addAttribute("goodName",goodName);
		model.addAttribute("goodId", goodId);
		return "leftstorage";
	}
	
	
	@RequestMapping("/outstorageRecord")
	public String getOutstorageRecord(Integer pageNum,Integer pageSize){
		
		
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;
		
		PageInfo<OutstorageRecord> page = osService.getOutstorageRecord(pageNum, pageSize);
		 request.setAttribute("page", page);
		return "outstorageRecord";
	}
	@RequestMapping("/infomaintainleft")
	public String getInfoMaintainLeft(){
		return "infomaintainleft";
	}
	
	@RequestMapping("/supplier")
	public String getSupplier(Integer pageNum,Integer pageSize){
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;

		PageInfo<SupplierInfo> page = mService.getSuppliersWithParam(pageNum, pageSize);
		 request.setAttribute("page", page);
		return "supplier";
	}
	
	@RequestMapping("/goodCatalog")
	public String getGoodCatalog(Integer pageNum,Integer pageSize){
		if(pageNum==null) pageNum=1;
		if(pageSize==null) pageSize=10;
		
		PageInfo<GoodCatalogInfo> page = mService.getGoodCatalogWithParam(pageNum, pageSize);
		 request.setAttribute("page", page);
		return "goodCatalog";
	}
	
	
	
	
	@RequestMapping("/datetimepicker")
	public String testDateTimePicker(){
		return "datetimepicker";
	}
}
