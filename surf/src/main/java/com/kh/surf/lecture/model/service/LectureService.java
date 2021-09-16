package com.kh.surf.lecture.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassInquiry;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Survey;
import com.kh.surf.payment.model.vo.Payment;

public interface LectureService {
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 조회용
	 */
	int selectFundingCount();
	ArrayList<Lecture> selectFundingList(PageInfo pi);
	
	/**
	 * @author leeyeji
	 * 펀딩 상세 조회용
	 */
	Lecture selectFundingDetail(int classNo);
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 응원하기
	 */
	int ajaxSupportLecture(HashMap<String, Integer> map);
	
	/**
	 * @author leeyeji
	 * 클래스 목록 조회용
	 */
	int selectListCount(HashMap<String, Object> map);
	ArrayList<Lecture> selectLectureList(PageInfo pi, HashMap<String, Object> map);
	
	/**
	 * @author leeyeji
	 * 클래스 상세 조회용
	 */
	Lecture selectLecture(int classNo);
	/**
	 * @author leeyeji
	 * 클래스 소개 조회용
	 */
	ArrayList<ClassIntro> selectLectureIntro(int classNo);
	
	/**
	 * @author leeyeji
	 * 클래스 챕터 조회용
	 */
	ArrayList<Chapter> selectLectureChapter(int classNo);
	
	/**
	 * @author leeyeji
	 * 클래스 리뷰 조회용
	 */
	ArrayList<Survey> selectLectureReview(int classNo);
	
	/**
	 * @author leeyeji
	 * 클래스 문의 조회용
	 */
	ArrayList<ClassInquiry> selectLectureInquiry(int classNo);
	
	int selectTeacherNo(int classNo);
	
	/**
	 * @author leeyeji
	 * 클래스 문의 등록용
	 */
	int ajaxEnrollInquiry(ClassInquiry i);
	
	/**
	 * @author leeyeji
	 * 유저 스크랩 목록 조회용
	 */
	ArrayList<Lecture> selectScrapList(int userNo);
	
	/**
	 * @author leeyeji
	 * 찜한 클래스 중복체크용
	 */
	int scrapCheck(HashMap<String, Object> map);
	
	/**
	 * @author leeyeji
	 * 클래스 찜하기용
	 */
	int ajaxScrapLecture(HashMap<String, Integer> map);
	
	/**
	 * @author leeyeji
	 * 내 클래스 조회
	 */
	ArrayList<Lecture> selectMyLecture(int userNo);
	
	/**
	 * @author leeyeji
	 * 설문조사 추가
	 */
	int insertSurvey(Survey s);
	
	/**
	 * @author leeyeji
	 * 진행률 조회
	 */
	int ajaxLoadStudingDegree(ClassStuding s);
	
	/**
	 * @author leeyeji
	 * 결제 내역 조회
	 */
	int selectPayCount(Payment p);
}
