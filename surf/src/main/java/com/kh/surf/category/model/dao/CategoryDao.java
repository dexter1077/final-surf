package com.kh.surf.category.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.kh.surf.category.model.vo.Maincat;
import com.kh.surf.category.model.vo.Subcat;


@Repository
public class CategoryDao {

	public ArrayList<String> selectCategory(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("categoryMapper.selectCategory");
	}
	
	/**
	 * @author leeyeji
	 * 서브 카테고리 조회
	 */
	public ArrayList<Subcat> selectSubCategory(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("categoryMapper.selectSubCategory");
	}
	
	/**
	 * 메인 카테고리 조회
	 * @author HeeRak
	 */
	public ArrayList<Maincat> AjaxSelectMaincatList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("categoryMapper.AjaxSelectMaincatList");
	}

	/**
	 * 메인 카테고리 번호로 서브 카테고리 조회
	 */
	public ArrayList<Subcat> AjaxSelectSubcatList(int maincatNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("categoryMapper.AjaxSelectSubcatList", maincatNo);
	}

}
