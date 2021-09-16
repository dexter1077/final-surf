package com.kh.surf.member.model.service;

import java.util.ArrayList;

import com.kh.surf.lecture.model.vo.Chapter;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Progress;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.vo.Teacher;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m);
	
	// 회원정보 수정
	int updateMemInfo(Member m);
	
	// 회원 비밀번호 수정
	int updateMemPwd(Member m);
	
	// 회원탈퇴
	int deleteMember(int userNo);
	
	// 아이디 중복체크
	int idCheck(Member m);
	
	// status체크
	String statusCheck(Member m);
	
	// 클래스 번호로 '강사 정보' 가져오기
	Teacher selectTeacherByClassNo(int classNo);
	
	// 클래스 번호로 '강의챕터목록' 가져오기
	ArrayList<Chapter> selectChapterList(int classNo);
	
	// 클래스 번호로 '강의영상목록' 가져오기
	ArrayList<ClassVideo> ajaxSelectVideoList(Lecture l);
	
	// 마지막로 본 비디오 번호 저장 
	int ajaxUpdateClassStuding(ClassStuding cs);
	
	// 비디오 시청기록 수정
	int ajaxUpdateWatched(Progress pg);
	
	// 강의 시청 진척도
	int ajaxLoadStudingDegree(ClassStuding cs);
	
	// 마지막 시청 강의 번호 조회
	int ajaxlastViewVideoLoad(ClassStuding cs);
	
}
