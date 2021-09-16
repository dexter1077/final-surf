package com.kh.surf.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.admin.model.vo.LectureList;
import com.kh.surf.admin.model.vo.PaymentList;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.vo.Teacher;

public interface AdminService {

	// 1.어드민 로그인용 서비스
	Member loginAdmin(Member m);

	int insertAd(Ad a);

	// 2. 광고 게시판 리스트 페이지 조회용
	int selectListCount();

	ArrayList<Ad> selectList(PageInfo pi);

	// 2-1 결제내역 게시판 리스트 페이지 조회용
	int selectPmListCount();

	ArrayList<PaymentList> selectPmList(PageInfo pi);

	// 2-2 회원관리 게시판 리스트 페이지 조회용
	int selectMemListCount();

	ArrayList<Member> selectMemList(PageInfo pi);

	// 2-3 클래스등록관리 리스트 페이지 조회용
	int selectLectureListCount();

	ArrayList<Teacher> selectLectureList(PageInfo pi);

	// 2-4 펀딩클래스관리 리스트 페이지 조회용
	int selectFunListCount();

	ArrayList<LectureList> selectFunList(PageInfo pi);

	// 3.게시물 선택 삭제
	void delete(String adNo);

	// 3-1.펀딩클래스 선택 삭제
	void funUpdate(String classNo);

	// 4.광고베너 표시
	void update(String adNo);

	// 5.관리자페이지 이동
	Member selectAdmin(int userNo);

	// 6.광고 상세조회용
	int increaseCount(int adNo);

	Ad selectAd(int adNo);

	// 7.광고 수정용
	int updateAd(Ad ad);

	// 8.광고게시판 검색용
	ArrayList<Ad> selectSearchList(PageInfo pi, HashMap<String, String> map);

	int selectSearchListCount(HashMap<String, String> map);

	// 8-1.결제내역 게시판 검색용
	ArrayList<PaymentList> selectSearchPayList(PageInfo pi, HashMap<String, String> map);

	int selectSearchPayListCount(HashMap<String, String> map);

	// 8-2.회원관리 게시판 검색용
	ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map);

	int selectSearchMemListCount(HashMap<String, String> map);

	// 9.회원탈퇴용
	void userUpdate(String userNo);

	// 10.클래스등록관리 승인/반려/삭제/펀딩
	void approvalUpdate(String classNo);

	void companionUpdate(String classNo);

	void DeleteUpdate(String classNo);

	void fundingUpdate(String classNo);

	// 11.클래스등록관리 검색용
	ArrayList<LectureList> selectLecSearchList(PageInfo pi, HashMap<String, String> map);

	int selectLecSearchListCount(HashMap<String, String> map);

	// 12.펀딩클래스관리 검색용
	ArrayList<LectureList> selectFunSearchList(PageInfo pi, HashMap<String, String> map);

	int selectFunSearchListCount(HashMap<String, String> map);

	// 13.클래스 상세조회용
	Lecture selectLectureDetail(int lno);

	ArrayList<ClassIntro> selectIntroList2(int lno);

	// 14.결제 내역 페이징용

	int settleListCount();

	ArrayList<PaymentList> settleList(PageInfo pi);

}
