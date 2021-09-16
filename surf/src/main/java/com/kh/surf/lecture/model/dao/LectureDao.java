package com.kh.surf.lecture.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassInquiry;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Survey;
import com.kh.surf.payment.model.vo.Payment;

@Repository
public class LectureDao {
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 페이징
	 */
	public int selectFundingCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectFundingCount");
	}
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 목록 조회
	 */
	public ArrayList<Lecture> selectFundingList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectFundingList", null, rowBounds);
	}
	
	/**
	 * @author leeyeji
	 * 펀딩 상세 조회
	 */
	public Lecture selectFundingDetail(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("lectureMapper.selectFundingDetail", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 펀딩 클래스 응원하기
	 */
	public int ajaxSupportLecture(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("lectureMapper.ajaxSupportLecture", map);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 목록 페이징 처리용
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("lectureMapper.selectListCount", map);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 목록 조회용
	 */
	public ArrayList<Lecture> selectLectureList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureList", map, rowBounds);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 상세 조회용
	 */
	public Lecture selectLecture(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("lectureMapper.selectLecture", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 유저 찜한 클래스 페이징
	 */
	public int selectScrapCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("lectureMapper.selectScrapCount", userNo);
	}
	
	/**
	 * @author leeyeji
	 * 유저 찜한 클래스 목록 조회
	 */
	public ArrayList<Lecture> selectScrapList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectScrapList", userNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 소개 조회
	 */
	public ArrayList<ClassIntro> selectLectureIntro(SqlSessionTemplate sqlSession, int classNo) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureIntro", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 챕터 조회
	 */
	public ArrayList<Chapter> selectLectureChapter(SqlSessionTemplate sqlSession, int classNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureChapter", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 리뷰 조회용
	 */
	public ArrayList<Survey> selectLectureReview(SqlSessionTemplate sqlSession, int classNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureReview", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 문의 조회용
	 */
	public ArrayList<ClassInquiry> selectLectureInquiry(SqlSessionTemplate sqlSession, int classNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureInquiry", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 클래스 문의 등록하기
	 */
	public int ajaxEnrollInquiry(SqlSessionTemplate sqlSession, ClassInquiry i) {
		return sqlSession.insert("lectureMapper.ajaxEnrollInquiry", i);
	}
	
	/**
	 * @author leeyeji
	 * 찜하기 중복 체크
	 */
	public int scrapCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("lectureMapper.scrapCheck", map);
	}
	
	/**
	 * @author leeyeji
	 * 찜하기 기능
	 */
	public int ajaxScrapLecture(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("lectureMapper.ajaxScrapLecture", map);
	}
	
	public int selectTeacherNo(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("lectureMapper.selectTeacherNo", classNo);
	}
	
	/**
	 * @author leeyeji
	 * 내 클래스 조회
	 */
	public ArrayList<Lecture> selectMyLecture(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectMyLecture", userNo);
	}
	
	/**
	 * @author leeyeji
	 * 설문조사 조회
	 */
	public int insertSurvey(SqlSessionTemplate sqlSession, Survey s) {
		return sqlSession.insert("lectureMapper.insertSurvey", s);
	}
	
	/**
	 * @author leeyeji
	 * 진행률 조회
	 */
	public int ajaxLoadStudingDegree(SqlSessionTemplate sqlSession, ClassStuding s) {
		return sqlSession.selectOne("lectureMapper.ajaxLoadStudingDegree", s);
	}
	
	/**
	 * @author leeyeji
	 * 결제 내역 조회
	 */
	public int selectPayCount(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.selectOne("lectureMapper.selectPayCount", p);
	}
	
}
