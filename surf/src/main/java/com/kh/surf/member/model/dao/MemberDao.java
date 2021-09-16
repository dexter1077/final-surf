package com.kh.surf.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Progress;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.vo.Teacher;

@Repository
public class MemberDao {

	
	/** @author 최서경
	 * 회원 로그인
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return  sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	/** @author 최서경
	 * 회원가입
	 */
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	/** @author 최서경
	 * 회원가입 아이디 중복체크
	 */
	public int idCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idCheck", m);
	}
	
	/** @author 최서경
	 * 상태 체크(SNS로그인에 필요)
	 */
	public String statusCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.statusCheck", m);
	}

	/** @author 최서경
	 * 마이페이지 회원정보 수정
	 */
	public int updateMemInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemInfo", m);
	}
	
	/** @author 최서경
	 * 마이페이지 비밀번호 수정
	 */
	public int updateMemPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemPwd", m);
	}
	
	/** @author 최서경
	 * 회원탈퇴
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	/**
	 * @author HeeRak
	 * 클래스 번호로 강사 정보 조회
	 */
	public Teacher selectTeacherByClassNo(int classNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectTeacherByClassNo", classNo);
	}
	
	/**
	 * @author HeeRak
	 * 클래스 번호로 강의챕터목록 조회
	 */
	public ArrayList<Chapter> selectChapterList(int classNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectChapterList", classNo);
	}

	/**
	 * @author HeeRak
	 * 클래스 번호로 강의영상목록 조회
	 */
	public ArrayList<ClassVideo> ajaxSelectVideoList(Lecture l, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.ajaxSelectVideoList", l);
	}
	
	/**
	 * @author HeeRak
	 * 마지막 영상 시청 기록
	 */
	public int ajaxUpdateClassStuding(ClassStuding cs, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.ajaxUpdateClassStuding", cs);
	}
	
	/**
	 * @author HeeRak
	 * 영상 시청 기록 수정
	 */
	public int ajaxUpdateWatched(Progress pg, SqlSessionTemplate sqlSession) {
		return sqlSession.update("lectureMapper.ajaxUpdateWatched", pg);
	}

	/**
	 * @author HeeRak
	 * 강의 시청 진척도
	 */
	public int ajaxLoadStudingDegree(ClassStuding cs, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.ajaxLoadStudingDegree", cs);
	}
	
	/**
	 * @author HeeRak
	 * 마지막 시청영상 번호 조회
	 */
	public int ajaxlastViewVideoLoad(ClassStuding cs, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.ajaxlastViewVideoLoad", cs);
	}
}
