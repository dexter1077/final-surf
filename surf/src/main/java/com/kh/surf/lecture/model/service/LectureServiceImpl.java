package com.kh.surf.lecture.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.dao.LectureDao;
import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassInquiry;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Survey;
import com.kh.surf.payment.model.vo.Payment;

@Service
public class LectureServiceImpl implements LectureService{

	@Autowired
	private LectureDao lDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 페이징
	 */
	@Override
	public int selectFundingCount() {
		return lDao.selectFundingCount(sqlSession);
	}

	/**
	 * @author leeyeji
	 * 펀딩 클래스 목록 조회
	 */
	@Override
	public ArrayList<Lecture> selectFundingList(PageInfo pi) {
		return lDao.selectFundingList(sqlSession, pi);
	}
	
	/**
	 * @author leeyeji
	 * 펀딩 상세 조회
	 */
	@Override
	public Lecture selectFundingDetail(int classNo) {
		return lDao.selectFundingDetail(sqlSession, classNo);
	}

	/**
	 * @author leeyeji
	 * 펀딩 클래스 응원하기
	 */
	@Override
	public int ajaxSupportLecture(HashMap<String, Integer> map) {
		return lDao.ajaxSupportLecture(sqlSession, map);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 목록 페이징
	 */
	@Override
	public int selectListCount(HashMap<String, Object> map) {
		return lDao.selectListCount(sqlSession, map);
	}

	/**
	 * @author leeyeji
	 * 클래스 목록 조회
	 */
	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi, HashMap<String, Object> map) {
		return lDao.selectLectureList(sqlSession, pi, map);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 상세 조회
	 */
	@Override
	public Lecture selectLecture(int classNo) {
		return lDao.selectLecture(sqlSession, classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 소개 조회
	 */
	@Override
	public ArrayList<ClassIntro> selectLectureIntro(int classNo) {
		return lDao.selectLectureIntro(sqlSession, classNo);
	}

	/**
	 * @author leeyeji
	 * 클래스 챕터 조회
	 */
	@Override
	public ArrayList<Chapter> selectLectureChapter(int classNo) {
		return lDao.selectLectureChapter(sqlSession, classNo);
	}

	/**
	 * @author leeyeji
	 * 클래스 리뷰 조회
	 */
	@Override
	public ArrayList<Survey> selectLectureReview(int classNo) {
		return lDao.selectLectureReview(sqlSession, classNo);
	}

	/**
	 * @author leeyeji
	 * 클래스 문의 조회
	 */
	@Override
	public ArrayList<ClassInquiry> selectLectureInquiry(int classNo) {
		return lDao.selectLectureInquiry(sqlSession, classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 문의 등록하기
	 */
	@Override
	public int ajaxEnrollInquiry(ClassInquiry i) {
		return lDao.ajaxEnrollInquiry(sqlSession, i);
	}
	
	/**
	 * @author leeyeji
	 * 유저 스크랩 목록 조회
	 */
	@Override
	public ArrayList<Lecture> selectScrapList(int userNo) {
		return lDao.selectScrapList(sqlSession, userNo);
	}

	/**
	 * @author leeyeji
	 * 찜하기 기능
	 */
	@Override
	public int ajaxScrapLecture(HashMap<String, Integer> map) {
		return lDao.ajaxScrapLecture(sqlSession, map);
	}
	
	/**
	 * @author leeyeji
	 * 찜하기 중복 체크
	 */
	@Override
	public int scrapCheck(HashMap<String, Object> map) {
		return lDao.scrapCheck(sqlSession, map);
	}

	/**
	 * @author leeyeji
	 * 강사 번호 조회
	 */
	@Override
	public int selectTeacherNo(int classNo) {
		return lDao.selectTeacherNo(sqlSession, classNo);
	}

	/**
	 * @author leeyeji
	 * 내 클래스 목록 조회
	 */
	@Override
	public ArrayList<Lecture> selectMyLecture(int userNo) {
		return lDao.selectMyLecture(sqlSession, userNo);
	}

	/**
	 * @author leeyeji
	 * 설문조사 추가
	 */
	@Override
	public int insertSurvey(Survey s) {
		return lDao.insertSurvey(sqlSession, s);
	}

	/**
	 * @author leeyeji
	 * 진행률 조회
	 */
	@Override
	public int ajaxLoadStudingDegree(ClassStuding s) {
		return lDao.ajaxLoadStudingDegree(sqlSession, s);
	}

	/**
	 * @author leeyeji
	 * 결제 내역 조회
	 */
	@Override
	public int selectPayCount(Payment p) {
		return lDao.selectPayCount(sqlSession, p);
	}
	
	
}
