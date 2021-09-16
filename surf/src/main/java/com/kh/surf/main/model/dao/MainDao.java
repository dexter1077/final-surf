package com.kh.surf.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.lecture.model.vo.ClassFunding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.studyBoard.model.vo.Study;

@Repository
public class MainDao {

	public ArrayList<Ad> selectMainAdList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectMainAdList");
	}
	
	public ArrayList<Lecture> selectRecomClassList(int condition, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectRecomClassList", condition);
	}
	
	public ArrayList<Study> selectPostList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectPostList");
	}
	
	public ArrayList<ClassFunding> selectFundingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectFundingList");
	}
}
