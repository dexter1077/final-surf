package com.kh.surf.teacher.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassInquiry;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.MonthlyStats;
import com.kh.surf.lecture.model.vo.Survey;
import com.kh.surf.teacher.model.vo.StatsData;
import com.kh.surf.teacher.model.vo.Teacher;

@Repository
public class TeacherDao {

	/**
	 * @author HeeRak
	 * @return 로그인한 회원의 teacher정보
	 */
	public Teacher selectTeacher(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectTeacher", userNo);
	}

	/**
	 * @author HeeRak
	 * @return 강사 닉네임 중복확인 결과
	 */
	public int checkNickname(Teacher t, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.checkNickname", t);
	}

	/**
	 * @author HeeRak
	 * @return 강사정보수정 결과
	 */
	public int updateTeacher(Teacher t, SqlSessionTemplate sqlSession) {
		return sqlSession.update("teacherMapper.updateTeacher", t);
	}

	/**
	 * @author HeeRak
	 * @return 강사의 모든 클래스번호
	 */
	public ArrayList<Lecture> selectTeacherClassAll(int userNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectTeacherClassAll", userNo);
	}
	
	/**
	 * @author HeeRak
	 * @return 한 강사의 전체 클래스 월별수익
	 */
	public ArrayList<MonthlyStats> monthlyStatsAll(int userNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.monthlyStatsAll", userNo);
	}

	/**
	 * @author HeeRak
	 * @return 한 강사의 한 클래스 월별수익
	 */
	public ArrayList<MonthlyStats> monthlyStatsLecture(int classNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.monthlyStatsLecture", classNo);
	}

	
	
	/**
	 * @author WooJoo
	 * @return 해당 강사의 클래스 목록
	 */
	public ArrayList<Lecture> selectClassList(String userNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectClassList", userNo);
	}
	
	/**
	 * @author WooJoo
	 * @return 조회할 후기의 총 개수
	 */
	public int selectReviewCount(HashMap<String, String> map , SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectReviewCount", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 후기 목록
	 */
	public ArrayList<Survey> selectReviewList(PageInfo pi, HashMap<String, String> map , SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("teacherMapper.selectReviewList", map, rowBounds);
	}
	
	/**
	 * @author WooJoo
	 * @return 후기 상세 내용
	 */
	public Survey selectReviewDetail(int sno, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectReviewDetail", sno);
	}

	/**
	 * @author HeeRak
	 * @return (한 강사의)클래스 목록 수
	 */
	public int selectLectureListCount(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectLectureListCount", userNo);
	}
	
	/**
	 * @author HeeRak
	 * @return (한 강사의)클래스 목록
	 */
	public ArrayList<Lecture> selectLectureByTeacher(int userNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureByTeacher", userNo, rowBounds);
	}

	/**
	 * @author HeeRak
	 * @return 클래스 펀딩승인처리 결과
	 */
	public int startFunding(Lecture l, SqlSessionTemplate sqlSession) {
		int result1 = sqlSession.insert("teacherMapper.insertFunding", l);
		int result2 = sqlSession.update("teacherMapper.startFunding", l);
		return result1 * result1;
	}

	/**
	 * @author HeeRak
	 * @return 클래스 삭제요청처리 결과
	 */
	public int deleteLecture(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("teacherMapper.deleteLecture", l);
	}
	
	/**
	 * @author WooJoo
	 * @return 조회할 문의의 총 개수
	 */
	public int selectInquiryCount(HashMap<String, String> map , SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectInquiryCount", map);
	}

	/**
	 * @author WooJoo
	 * @return 문의글 목록
	 */
	public ArrayList<ClassInquiry> selectInquiryList(PageInfo pi, HashMap<String, String> map , SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("teacherMapper.selectInquiryList", map, rowBounds);
	}
	
	/**
	 * @author WooJoo
	 * @return 문의 상세 내용
	 */
	public ClassInquiry selectInquiryDetail(int ino, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectInquiryDetail", ino);
	}
	
	/**
	 * @author WooJoo
	 * @return 답변 작성 결과
	 */
	public int updateNewAnswer(ClassInquiry i, SqlSessionTemplate sqlSession) {
		return sqlSession.update("teacherMapper.updateNewAnswer", i);
	}
	
	/**
	 * @author WooJoo
	 * @return 답변 수정 결과
	 */
	public int updateOldAnswer(ClassInquiry i, SqlSessionTemplate sqlSession) {
		return sqlSession.update("teacherMapper.updateOldAnswer", i);
	}
	
	/**
	 * @author WooJoo
	 * @return 답변 삭제 결과
	 */
	public int deleteAnswer(int ino, SqlSessionTemplate sqlSession) {
		return sqlSession.update("teacherMapper.deleteAnswer", ino);
	}
	
	/**
	 * @author WooJoo
	 * @return 신규 수강 건수 통계 데이터
	 */
	public ArrayList<StatsData> selectNewOrderStats(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectNewOrderStats", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 완강 소요 일수 통계 데이터
	 */
	public ArrayList<StatsData> selectStudyDaysStats(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectStudyDaysStats", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 수강생 성별 비율 데이터
	 */
	public ArrayList<StatsData> selectGenderRateStats(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectGenderRateStats", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 수강생 연령대별 비율 데이터
	 */
	public ArrayList<StatsData> selectAgeGroupRateStats(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectAgeGroupRateStats", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 설문 조사 통계 데이터
	 */
	public ArrayList<StatsData> selectSurveyStats(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("teacherMapper.selectSurveyStats", map);
	}
	
	/**
	 * @author WooJoo
	 * @return 설문 조사 응답수
	 */
	public int selectRespondentCount(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectRespondentCount", map);
	}
	
	/**
	 * @author leeyeji
	 * 강사 신청
	 */
	public int applyTeacher(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("teacherMapper.applyTeacher", t);
	}
	
	/**
	 * @author HeeRak
	 * 클래스 등록하기
	 */
	public int insertLecture(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.insertLecture", l);
	}

	/**
	 * @author HeeRak
	 * 클래스 input 페이지 0-4 데이터 Lecture 가져오기
	 */
	public Lecture selectLectureInput(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectLectureInput", l);
	}
	
	/**
	 * @author HeeRak
	 * 클래스 input 페이지 2 데이터 가져오기  ClassIntro List
	 */
	public ArrayList<ClassIntro> selectIntroList2(Lecture l, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectIntroList2", l);
	}
	
	/**
	 * @author HeeRak
	 * 클래스 input 페이지 3 데이터 가져오기 Chapter, ClassVideo List
	 */
	public ArrayList<Chapter> selectChapterList(int classNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectChapterList", classNo);
	}
	public ArrayList<ClassVideo> ajaxSelectVideoList(Lecture l, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.ajaxSelectVideoListbyTeacher", l);
	}

	/**
	 * @author HeeRak
	 * 0-4번 등록|수정페이지  update
	 */
	// 0번 페이지
	public int updateLecture0(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.updateLecture0", l);
	}
	
	// 1번 페이지
	public int updateLecture1(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.updateLecture1", l);
	}
	
	// 2번 페이지
	public int updateLecture2(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.updateLecture2", l);
	}
	public int updateClassIntro2(ArrayList<ClassIntro> list, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.updateClassIntro2", list);
	}
	public int deleteClassIntro2(Lecture introInfo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("lectureMapper.deleteClassIntro2", introInfo);
	}
	
	// 3번 페이지
	public int insertChapter(ArrayList<Chapter> chList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.insertChapter", chList);
	}
	public int insertClassVideo(ArrayList<ClassVideo> cvList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.insertClassVideo", cvList);
	}
	public int deleteVideoList(String[] deleteFileName, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("lectureMapper.deleteVideoList", deleteFileName);
	}
	public int deleteChapterList(Chapter deleteChap, SqlSessionTemplate sqlSession) { 
		return sqlSession.delete("lectureMapper.deleteChapterList", deleteChap);
	}
	public int updateChapterList(ArrayList<Chapter> chList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.updateChapterList", chList);
	}
	public int updateVideoList(ArrayList<ClassVideo> cvList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lectureMapper.updateVideoList", cvList);
	}
	
	// 4번 페이지
	public int updateLecture4(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.updateLecture4", l);
	}

	/**
	 * 강의 등록|수정 페이지 완성도
	 * @author HeeRak
	 */
	public int ajaxLoadDegree(int classNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.ajaxLoadDegree", classNo);
	}

	/**
	 * 강의 오픈 신청하기
	 * @author HeeRak
	 */
	public int updateStatus(Lecture l, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.updateStatus", l);
	}

	

	



	
}
