package com.kh.surf.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.lecture.model.vo.ClassFunding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.main.model.dao.MainDao;
import com.kh.surf.studyBoard.model.vo.Study;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public ArrayList<Ad> selectMainAdList() {
		return mDao.selectMainAdList(sqlSession);
	}


	@Override
	public ArrayList<Lecture> selectRecomClassList(int condition) {
		return mDao.selectRecomClassList(condition, sqlSession);
	}


	@Override
	public ArrayList<Study> selectPostList() {
		return mDao.selectPostList(sqlSession);
	}


	@Override
	public ArrayList<ClassFunding> selectFundingList() {
		return mDao.selectFundingList(sqlSession);
	}


}
