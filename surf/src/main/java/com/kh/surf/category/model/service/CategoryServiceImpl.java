package com.kh.surf.category.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.category.model.dao.CategoryDao;


import com.kh.surf.category.model.vo.Maincat;
import com.kh.surf.category.model.vo.Subcat;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao cDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<String> selectCategory(){
		ArrayList<String> arrCat = cDao.selectCategory(sqlSession);
		return arrCat;
	}

	/**
	 * 메인카테고리 서브카테고리 조회
	 * @author HeeRak
	 */
	@Override
	public ArrayList<Maincat> AjaxSelectMaincatList() {
		return cDao.AjaxSelectMaincatList(sqlSession);
	}
	@Override
	public ArrayList<Subcat> AjaxSelectSubcatList(int maincatNo) {
		return cDao.AjaxSelectSubcatList(maincatNo, sqlSession);
	}

	/**
	 * @author leeyeji
	 * 서브 카테고리 조
	 */
	@Override
	public ArrayList<Subcat> selectSubCategory() {
		return cDao.selectSubCategory(sqlSession);
	}

}
