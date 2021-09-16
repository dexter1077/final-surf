package com.kh.surf.category.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.surf.category.model.service.CategoryService;
import com.kh.surf.category.model.vo.Maincat;
import com.kh.surf.category.model.vo.Subcat;

@Controller
public class AjaxCategoryController {
	
	@Autowired
	private CategoryService cService;
	
	/**
	 * 메인카테고리번호 목록 조회
	 * @return 메인 카테고리 list
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxMainCat.te", produces="application/json; charset=utf-8")
	public String AjaxSelectMaincatList() {
		
		ArrayList<Maincat> mcList = cService.AjaxSelectMaincatList(); 
		
		return new Gson().toJson(mcList);
	}
	
	/**
	 * 메인카테고리번호로  서브카테고리 목록 조회
	 * @return 서브카테고리 list
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxSubcat.te", produces="application/json; charset=utf-8")
	public String AjaxSelectSubcatList(int maincatNo) {
		
		ArrayList<Subcat> scList = cService.AjaxSelectSubcatList(maincatNo);
		
		return new Gson().toJson(scList);
	}
	
	
}
