package com.ssy.child.common;

import java.sql.Date;
import java.sql.Timestamp;

import com.ssy.child.entity.InstorageForm;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Instorage;



public class PublicFunction {
	public static String doNull(Object obj)
	{
		if(null==obj)
		{
			return "";
		}
		else
		{
			return obj.toString().trim();
		}
	}
	
	public static Goods returnGoods(InstorageForm instorageForm){
		Goods good = new Goods();
		good.setGoodId(instorageForm.getGoodId());
		good.setGoodName(instorageForm.getGoodName());
//		good.setGoodSupplier(instorageForm.getGoodSupplier());
		good.setGoodSpeci(instorageForm.getGoodSpeci());
		return good;
		
	}
	
	public static Instorage returnInstorage(InstorageForm instorageForm){
		Instorage instorage = new Instorage();
		
//		instorage.setGoodName(instorageForm.getGoodName());
//		
//		instorage.setGoodId(instorageForm.getGoodId());
		
		String price = instorageForm.getPrice();
		instorage.setPrice(Double.parseDouble(price));
		
		String number = instorageForm.getNumber();
		instorage.setNumber(Integer.valueOf(number));
		
		instorage.setPeople(instorageForm.getPeople());
		
		instorage.setDate(returnTimeStamp(instorageForm.getDate()));
		
		
		return instorage;
		
	}
	
	private static Timestamp returnTimeStamp(String date){
		if(date == null || date.length() == 0){
			return null;
		}
		String[] date_split = date.split("");
		int day = Integer.valueOf(date_split[0]);
		int month = 0;
		int year = Integer.valueOf(date_split[2]);
		
		switch(date_split[1]){
			case "一月":
				month = 1;
				break;
			case "二月":
				month = 2;
				break;
			case "三月":
				month = 3;
				break;
			case "四月":
				month = 4;
				break;
			case "五月":
				month = 5;
				break;
			case "六月":
				month = 6;
				break;
			case "七月":
				month = 7;
				break;
			case "八月":
				month = 8;
				break;
			case "九月":
				month = 9;
				break;
			case "十月":
				month = 10;
				break;
			case "十一月":
				month = 11;
				break;
			case "十二月":
				month = 12;
				break;
			default:
				break;
			}
		
		return new Timestamp(Date.valueOf(year+"-"+month+"-"+day).getTime());
	}
	

}
