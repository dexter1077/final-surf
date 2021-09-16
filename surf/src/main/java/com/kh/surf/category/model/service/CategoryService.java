package com.kh.surf.category.model.service;

import java.util.ArrayList;


import com.kh.surf.category.model.vo.Maincat;
import com.kh.surf.category.model.vo.Subcat;


public interface CategoryService {

	public ArrayList<String> selectCategory();
	
	public ArrayList<Subcat> selectSubCategory();

	public ArrayList<Maincat> AjaxSelectMaincatList();
	public ArrayList<Subcat> AjaxSelectSubcatList(int maincatNo);

}
