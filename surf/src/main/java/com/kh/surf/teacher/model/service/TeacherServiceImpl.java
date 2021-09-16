package com.kh.surf.teacher.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassInquiry;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.MonthlyStats;
import com.kh.surf.lecture.model.vo.Survey;
import com.kh.surf.teacher.model.dao.TeacherDao;
import com.kh.surf.teacher.model.vo.StatsData;
import com.kh.surf.teacher.model.vo.Teacher;

/**
 * @author 윤희락7.26
 *
 */
@Service
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private TeacherDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @author 윤희락 7.26
	 * 로그인한 회원 Teacher정보요청처리
	 */
	@Override
	public Teacher selectTeacher(int userNo) {
		return tDao.selectTeacher(userNo, sqlSession);
	}
	
	
	/**
	 * @author HeeRak
	 * 강사정보수정시 닉네임 중복체크
	 */
	@Override
	public int checkNickname(Teacher t) {
		return tDao.checkNickname(t, sqlSession);
	}


	/**
	 * @author HeeRak
	 * 강사정보수정 처리 결과
	 */
	@Override
	public int updateTeacher(Teacher t) {
		return tDao.updateTeacher(t, sqlSession);
	}

	
	/**
	 * @author WooJoo
	 * 조회 가능한 클래스 목록 조회 
	 */
	@Override
	public ArrayList<Lecture> selectClassList(String userNo) {
		return tDao.selectClassList(userNo, sqlSession);
	}
	
	
	/**
	 * @author WooJoo
	 * 조회할 후기의 개수 조회 
	 */
	@Override
	public int selectReviewCount(HashMap<String, String> map) {
		return tDao.selectReviewCount(map, sqlSession);
	}


	/**
	 * @author WooJoo
	 * 후기 목록 조회 
	 */
	@Override
	public ArrayList<Survey> selectReviewList(PageInfo pi, HashMap<String, String> map) {
		return tDao.selectReviewList(pi, map, sqlSession);
	}
	
	
	/**
	 * @author WooJoo
	 * 후기 상세 내용 조회
	 */
	@Override
	public Survey selectReviewDetail(int sno) {
		return tDao.selectReviewDetail(sno, sqlSession);
	}
	
	
	/**
	 * @author HeeRak
	 * 한 강사의 모든 클래스 정보 가져오기
	 */
	@Override
	public ArrayList<Lecture> selectTeacherClassAll(int userNo) {
		return tDao.selectTeacherClassAll(userNo, sqlSession);
	}
	/**
	 * @author HeeRak
	 * 월별집계 (전체 클래스)
	 */
	@Override
	public ArrayList<MonthlyStats> monthlyStatsAll(int userNo) {
		return tDao.monthlyStatsAll(userNo, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 월별집계 (특정 1개 클래스)
	 */
	@Override
	public ArrayList<MonthlyStats> monthlyStatsLecture(int classNo) {
		return tDao.monthlyStatsLecture(classNo, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강사의 클래스 목록 수 조회
	 */
	@Override
	public int selectLectureListCount(int userNo) {
		return tDao.selectLectureListCount(userNo, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 강사의 클래스정보 목록 조회
	 */
	@Override
	public ArrayList<Lecture> selectLectureByTeacher(int userNo, PageInfo pi) {
		return tDao.selectLectureByTeacher(userNo, pi, sqlSession);
	}


	/**
	 * @author HeeRak
	 * 강사 클래스 펀딩 수락
	 */
	@Override
	public int startFunding(Lecture l) {
		return tDao.startFunding(l, sqlSession);
	}


	/**
	 * @author HeeRak
	 * 강사 클래스 삭제
	 */
	@Override
	public int deleteLecture(Lecture l) {
		return tDao.deleteLecture(l, sqlSession);
	}


	/**
	 * @author WooJoo
	 * 조회할 문의 개수 조회
	 */
	@Override
	public int selectInquiryCount(HashMap<String, String> map) {
		return tDao.selectInquiryCount(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 문의 목록 조회
	 */
	@Override
	public ArrayList<ClassInquiry> selectInquiryList(PageInfo pi, HashMap<String, String> map) {
		return tDao.selectInquiryList(pi, map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 문의 및 답변 상세 내용 조회
	 */
	@Override
	public ClassInquiry selectInquiryDetail(int ino) {
		return tDao.selectInquiryDetail(ino, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 문의글 답변 작성
	 */
	@Override
	public int updateNewAnswer(ClassInquiry i) {
		return tDao.updateNewAnswer(i, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 문의글 답변 수정
	 */
	@Override
	public int updateOldAnswer(ClassInquiry i) {
		return tDao.updateOldAnswer(i, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 문의글 답변 삭제
	 */
	@Override
	public int deleteAnswer(int ino) {
		return tDao.deleteAnswer(ino, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 신규 수강 건수 데이터 조회
	 */
	@Override
	public ArrayList<StatsData> selectNewOrderStats(HashMap<String, String> map) {
		return tDao.selectNewOrderStats(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 완강 소요 일수 데이터 조회
	 */
	@Override
	public ArrayList<StatsData> selectStudyDaysStats(HashMap<String, String> map) {
		return tDao.selectStudyDaysStats(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 수강생 성별 비율 데이터 조회
	 */
	@Override
	public ArrayList<StatsData> selectGenderRateStats(HashMap<String, String> map) {
		return tDao.selectGenderRateStats(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 수강생 연령대별 비율 데이터 조회
	 */
	@Override
	public ArrayList<StatsData> selectAgeGroupRateStats(HashMap<String, String> map) {
		return tDao.selectAgeGroupRateStats(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 설문 조사 데이터 조회
	 */
	@Override
	public ArrayList<StatsData> selectSurveyStats(HashMap<String, String> map) {
		return tDao.selectSurveyStats(map, sqlSession);
	}

	/**
	 * @author WooJoo
	 * 설문 조사 응답수 조회
	 */
	@Override
	public int selectRespondentCount(HashMap<String, String> map) {
		return tDao.selectRespondentCount(map, sqlSession);
	}

	/**
	 * @author leeyeji
	 * 강사 신청
	 */
	@Override
	public int applyTeacher(Teacher t) {
		return tDao.applyTeacher(sqlSession, t);
	}
	
	
	/**
	 * @author HeeRak
	 * 강의 등록하기 0
	 */
	@Override
	public int insertLecture(Lecture l) {
		return tDao.insertLecture(l, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 강의 입력페이지 조회 '강의'
	 */
	@Override
	public Lecture selectLectureInput(Lecture l) {
		return tDao.selectLectureInput(l, sqlSession);
	}
	/**
	 * @author HeeRak
	 * 강의 입력페이지 조회 '강의소개'
	 */
	@Override
	public ArrayList<ClassIntro> selectIntroList2(Lecture l) {
		return tDao.selectIntroList2(l, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 페이지 조회 '챕터'
	 */
	@Override
	public ArrayList<Chapter> selectChapterList(int classNo) {
		return tDao.selectChapterList(classNo, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 페이지 조회 '비디오 목록'
	 */
	@Override
	public ArrayList<ClassVideo> ajaxSelectVideoList(Lecture l) {
		return tDao.ajaxSelectVideoList(l, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 수정|등록 '강의' 0, 1, 2, 4
	 */
	@Override
	public int updateLecture0(Lecture l) {
		return tDao.updateLecture0(l, sqlSession);
	}
	@Override
	public int updateLecture1(Lecture l) {
		return tDao.updateLecture1(l, sqlSession);
	}
	@Override
	public int updateLecture2(Lecture l) {
		return tDao.updateLecture2(l, sqlSession);
	}
	@Override
	public int updateLecture4(Lecture l) {
		return tDao.updateLecture4(l, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 등록|수정 '강의 소개'
	 */
	@Override
	public int updateClassIntro2(ArrayList<ClassIntro> classIntroList) {
		return tDao.updateClassIntro2(classIntroList, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 삭제 '강의 소개'
	 */
	@Override
	public int deleteClassIntro2(Lecture introInfo) {
		return tDao.deleteClassIntro2(introInfo, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 강의 등록|수정 '챕터 목록' insert
	 */
	@Override
	public int insertChapter(ArrayList<Chapter> chList) {
		return tDao.insertChapter(chList, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 강의 등록|수정 '비디오 목록' insert
	 */
	@Override
	public int insertClassVideo(ArrayList<ClassVideo> cvList) {
		return tDao.insertClassVideo(cvList, sqlSession);
	}
	
	/**
	 * 강의 등록|수정 '비디오 목록' 제거
	 */
	@Override
	public int deleteVideoList(String[] deleteFileName) {
		return tDao.deleteVideoList(deleteFileName, sqlSession);
	}
	
	/**
	 * @author HeeRak
	 * 강의 등록|수정 '챕터 목록' 제거
	 */
	@Override
	public int deleteChapterList(Chapter deleteChap) {
		return tDao.deleteChapterList(deleteChap, sqlSession);
	}


	/**
	 * @author HeeRak
	 * 강의 등록|수정 '챕터'
	 */
	@Override
	public int updateChapterList(ArrayList<Chapter> chList) {
		return tDao.updateChapterList(chList, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 등록|수정 '비디오 목록'
	 */
	@Override
	public int updateVideoList(ArrayList<ClassVideo> cvList) {
		return tDao.updateVideoList(cvList, sqlSession);
	}

	/**
	 * @author HeeRak
	 * 강의 등록|수정 '완성도'
	 */
	@Override
	public int ajaxLoadDegree(int classNo) {
		return tDao.ajaxLoadDegree(classNo, sqlSession);
	}


	/**
	 * @author HeeRak
	 * 강의 오픈 신청 
	 */
	@Override
	public int updateStatus(Lecture l) {
		return tDao.updateStatus(l, sqlSession);
	}


	




	

	


}
