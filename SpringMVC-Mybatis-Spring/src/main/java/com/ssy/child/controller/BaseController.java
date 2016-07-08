package com.ssy.child.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssy.child.entity.InstorageForm;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.Goods;

public class BaseController{
	@Autowired
	private  HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	public static final String VIEW = "view";
	public static final String LIST = "list";
	public static final String STATUS = "status";
	public static final String WARN = "warn";
	public static final String SUCCESS = "success";
	public static final String CHAIN = "chain"; 
	public static final String REDIRECT = "redirect";
	public static final String OBJECT = "type_object";
	public static final String ERROR = "error";
	public static final String MESSAGE = "message";
	public static final String CONTENT = "content";
	
	
	// AJAX输出，返回null
		public String ajax(String content, String type) {
			try {
				response.setContentType(type + ";charset=UTF-8");
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);
				response.getWriter().write(content);
				response.getWriter().flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}

		// AJAX输出文本，返回null
		public String ajaxText(String text) {
			return ajax(text, "text/plain");
		}

		// AJAX输出HTML，返回null
		public String ajaxHtml(String html) {
			return ajax(html, "text/html");
		}

		// AJAX输出XML，返回null
		public String ajaxXml(String xml) {
			return ajax(xml, "text/xml");
		}

		public String ajaxJson(GoodRestDetail g){
			return ajax(JSONObject.fromObject(g).toString(),"text/json");
		}
		
		public String ajaxJson(Goods g){
			return ajax(JSONObject.fromObject(g).toString(),"text/json");
		}
		public String ajaxJson(InstorageForm i){
			return ajax(JSONObject.fromObject(i).toString(),"text/json");
		}
		// 根据字符串输出JSON，返回null
		public String ajaxJson(String jsonString) {
			return ajax(jsonString, "text/json");
		}
		
		// 根据Map输出JSON，返回null
		public String ajaxJson(Map<?, ?> jsonMap) {
			JSONObject jsonObject = JSONObject.fromObject(jsonMap);
			return ajax(jsonObject.toString(), "text/json");
		}
		public String ajaxJson(List<?> jsonList){
			String string=JSONArray.fromObject(jsonList).toString();
			return ajax(string, "text/json");
		}
		// 输出JSON警告消息，返回null
		public String ajaxJsonWarnMessage(String message) {
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put(STATUS, WARN);
			jsonMap.put(MESSAGE, message);
			JSONObject jsonObject = JSONObject.fromObject(jsonMap);
			return ajax(jsonObject.toString(), "text/json");
		}
		
		// 输出JSON成功消息，返回null
		public String ajaxJsonSuccessMessage(String message) {
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put(STATUS, SUCCESS);
			jsonMap.put(MESSAGE, message);
			JSONObject jsonObject = JSONObject.fromObject(jsonMap);
			return ajax(jsonObject.toString(), "text/json");
		}
		
		// 输出JSON错误消息，返回null
		public String ajaxJsonErrorMessage(String message) {
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put(STATUS, ERROR);
			jsonMap.put(MESSAGE, message);
			JSONObject jsonObject = JSONObject.fromObject(jsonMap);
			return ajax(jsonObject.toString(), "text/json");
		}
}
