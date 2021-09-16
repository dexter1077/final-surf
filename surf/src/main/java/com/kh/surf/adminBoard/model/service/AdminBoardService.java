package com.kh.surf.adminBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.surf.adminBoard.model.vo.AdminBoard;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.teacher.model.vo.Teacher;

public interface AdminBoardService {
	
		/*
		 *  관리자 (공지사항 / FAQ / 강사신청 / 신고 관리) : 서정연
		 */
	
	   /** 공지사항 **/
	   // 1. 공지사항 게시판 리스트 페이지 조회용 (페이징)
	   int selectNoticeCount();
	   ArrayList<AdminBoard> selectNoticeList(PageInfo pi);
	   
	   // 2. 공지사항 게시글 작성하기용
	   int insertAdminNotice(AdminBoard ab);
	   
	   // 3. 공지사항 게시글 상세조회용
	   int increaseCountNotice(int boardNo);
	   AdminBoard selectAdminNotice(int boardNo);
	   
	   // 4. 공지사항 게시글 삭제용
	   int deleteAdminNotice(int boardNo);
	   
	   // 5. 공지사항 게시글 수정용
	   int updateAdminNotice(AdminBoard ab);
	   
	   // 6. 검색용
	   int selectSearchNoticeCount(HashMap<String, String> map);
	   ArrayList<AdminBoard> selectSearchNoticeList(PageInfo pi, HashMap<String, String> map);
	   
	   
	   /** FAQ **/
	   // 1. FAQ 게시판 리스트 페이지 조회용 (페이징)
	   int selectFaqCount();
	   ArrayList<AdminBoard> selectFaqList(PageInfo pi);
	   
	   // 2. FAQ 게시글 작성하기용
	   int insertAdminFaq(AdminBoard ab);
	   
	   // 3. FAQ  게시글 삭제용
	   int deleteAdminFaq(int boardNo);
	   
	   // 4. FAQ  게시글 수정용
	   int updateAdminFaq(AdminBoard ab);
	   
	   
	   
	   /** 강사신청 관리 **/
	   // 1. 게시판 리스트 페이지 조회용 (페이징)
	   int selectTeacherCount();
	   ArrayList<Teacher> selectTeacherList(PageInfo pi);
	   
	   // 2. 게시글 상세조회용
	   Teacher selectTeacher(int tno);
	   
	   // 3. 게시글 승인
	   int updateYes(int tno);
	   
	   // 4. 게시글 반려
	   int updateNo(int tno);
	   
	   /** 검색 관련 **/
	   // 1. 강사관리페이지 검색
	   int teacherListCount(HashMap<String, String> map);
		
	   ArrayList<Teacher> selectTeacherList(PageInfo pi, HashMap<String, String> map);
	   
	   // 2. FAQ페이지 검색
		int faqListCount(HashMap<String, String> map);
		
		ArrayList<AdminBoard> selectFaqList(PageInfo pi, HashMap<String, String> map);

	   
	   
}
