package com.kh.surf.main.model.service;

import java.util.ArrayList;

import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.lecture.model.vo.ClassFunding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.studyBoard.model.vo.Study;

public interface MainService {

	// 1. 메인 광고 배너 조회
	ArrayList<Ad> selectMainAdList();
	
	// 2. 메인 추천 클래스 조회
	ArrayList<Lecture> selectRecomClassList(int condition);
	
	// 3. 메인 커뮤니티 포스트 조회
	ArrayList<Study> selectPostList();
	
	// 4. 메인 펀딩 클래스 배너 조회
	ArrayList<ClassFunding> selectFundingList();
}
