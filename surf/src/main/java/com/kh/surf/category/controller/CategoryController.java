package com.kh.surf.category.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.surf.category.model.service.CategoryService;
import com.kh.surf.category.model.vo.Subcat;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService cService;
	
	@ResponseBody
	@RequestMapping(value="cat.do", produces="application/json; charset=utf-8")
	public String selectCategory(){
		
		ArrayList<String> arrCat = cService.selectCategory();
		ArrayList<String[]> resultArr = new ArrayList<>();
		
		for(String s : arrCat) {
			
			String[] arr = s.split(",");
			
			resultArr.add(arr);
		}
		
		return new Gson().toJson(resultArr);
		
	}
	
	@ResponseBody
	@RequestMapping(value="subcat.do", produces="application/json; charset=utf-8")
	public String selectsubCategory(){
		
		ArrayList<Subcat> scList = cService.selectSubCategory();
		
		return new Gson().toJson(scList);
		
	}
	
}
