package com.kh.surf.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.admin.model.dao.AdminDao;
import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.admin.model.vo.LectureList;
import com.kh.surf.admin.model.vo.PaymentList;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.vo.Teacher;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginAdmin(Member m) {

		return aDao.adminLogin(sqlSession, m);
	}

	@Override
	public int insertAd(Ad a) {

		return aDao.insertAd(sqlSession, a);
	}

	// 게시물 선택 삭제
	@Override
	public void delete(String adNo) {
		aDao.delete(sqlSession, adNo);

	}

	// 광고베너 표시
	@Override
	public void update(String adNo) {
		aDao.update(sqlSession, adNo);

	}

	// 회원탈퇴용
	@Override
	public void userUpdate(String userNo) {
		aDao.userUpdate(sqlSession, userNo);

	}

	@Override
	public Member selectAdmin(int userNo) {
		return aDao.selectAdmin(userNo, sqlSession);
	}

	// 광고 상세조회용
	@Override
	public int increaseCount(int adNo) {
		return aDao.increaseCount(sqlSession, adNo);
	}

	@Override
	public Ad selectAd(int adNo) {
		return aDao.selectAd(sqlSession, adNo);
	}

	@Override
	public int updateAd(Ad ad) {
		return aDao.updateAd(sqlSession, ad);
	}

	// 광고 게시판 페이징
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Ad> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}

	// 결제내역 게시판 페이징
	@Override
	public int selectPmListCount() {
		return aDao.selectPmListCount(sqlSession);
	}

	@Override
	public ArrayList<PaymentList> selectPmList(PageInfo pi) {
		return aDao.selectPmList(sqlSession, pi);

	}

	// 회원관리 게시판 페이징
	@Override
	public int selectMemListCount() {
		return aDao.selectMemListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return aDao.selectMemList(sqlSession, pi);
	}

	// 클래스등록관리 페이징
	@Override
	public int selectLectureListCount() {
		return aDao.selectLectureListCount(sqlSession);
	}

	@Override
	public ArrayList<Teacher> selectLectureList(PageInfo pi) {
		return aDao.selectLectureList(sqlSession, pi);
	}

	// 펀딩클래스관리 페이징
	@Override
	public int selectFunListCount() {
		return aDao.selectFunListCount(sqlSession);
	}

	@Override
	public ArrayList<LectureList> selectFunList(PageInfo pi) {
		return aDao.selectFunList(sqlSession, pi);
	}

	// 결제관리 검색용
	@Override
	public ArrayList<PaymentList> selectSearchPayList(PageInfo pi, HashMap<String, String> map) {
		return aDao.selectSearchPayList(sqlSession, pi, map);
	}

	@Override
	public int selectSearchPayListCount(HashMap<String, String> map) {
		return aDao.selectSearchPayListCount(sqlSession, map);
	}

	// 광고관리 검색용
	@Override
	public ArrayList<Ad> selectSearchList(PageInfo pi, HashMap<String, String> map) {
		return aDao.selectSearchList(sqlSession, pi, map);
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return aDao.selectSearchListCount(sqlSession, map);
	}

	//
	@Override
	public ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map) {
		return aDao.selectSearchMemList(sqlSession, pi, map);
	}

	@Override
	public int selectSearchMemListCount(HashMap<String, String> map) {
		return aDao.selectSearchMemListCount(sqlSession, map);
	}

	// 클래스등록관리 승인/반려/삭제/펀딩
	@Override
	public void approvalUpdate(String classNo) {
		aDao.approvalUpdate(sqlSession, classNo);
	}

	@Override
	public void companionUpdate(String classNo) {
		aDao.companionUpdate(sqlSession, classNo);
	}

	@Override
	public void DeleteUpdate(String classNo) {
		aDao.DeleteUpdate(sqlSession, classNo);
	}

	@Override
	public void fundingUpdate(String classNo) {
		aDao.fundingUpdate(sqlSession, classNo);
	}

	// 클래스펀딩관리 삭제
	@Override
	public void funUpdate(String classNo) {
		aDao.funUpdate(sqlSession, classNo);
	}

	@Override
	public ArrayList<LectureList> selectLecSearchList(PageInfo pi, HashMap<String, String> map) {
		return aDao.selectLecSearchList(sqlSession, pi, map);
	}

	@Override
	public int selectLecSearchListCount(HashMap<String, String> map) {
		return aDao.selectLecSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<LectureList> selectFunSearchList(PageInfo pi, HashMap<String, String> map) {
		return aDao.selectFunSearchList(sqlSession, pi, map);
	}

	@Override
	public int selectFunSearchListCount(HashMap<String, String> map) {
		return aDao.selectFunSearchListCount(sqlSession, map);
	}

	@Override
	public Lecture selectLectureDetail(int lno) {
		return aDao.selectLectureDetail(sqlSession, lno);
	}

	@Override
	public ArrayList<ClassIntro> selectIntroList2(int lno) {
		return aDao.selectIntroList2(sqlSession, lno);
	}

	@Override
	public int settleListCount() {
		return aDao.settleListCount(sqlSession);
	}

	@Override
	public ArrayList<PaymentList> settleList(PageInfo pi) {
		return aDao.settleList(sqlSession, pi);
	}

}
