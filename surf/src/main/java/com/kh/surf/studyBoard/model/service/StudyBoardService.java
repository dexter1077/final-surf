package com.kh.surf.studyBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.studyBoard.model.vo.Reply;
import com.kh.surf.studyBoard.model.vo.Report;
import com.kh.surf.studyBoard.model.vo.Study;

public interface StudyBoardService {

	// 1. 스터디 리스트 페이지 조회
	int selectListCount();
	ArrayList<Study> selectList(PageInfo pi);
	
	// 2. 스터디 상세 조회
	int increaseCount(int studyNo);
	Study selectStudy(int studyNo);
	
	// 3. 스터디 작성하기
	int insertStudy(Study s);
	
	// 4. 스터디 삭제
	int deleteStudy(int studyNo);
	
	// 5. 스터디 수정
	int updateStudy(Study s);
	
	// 6. 댓글리스트 조회
	ArrayList<Reply> selectReplyList(int studyNo);
	
	// 7. 댓글 작성
	int insertReply(Reply r);
	
	// 8. 신고하기
	int insertReport(Report r);
	
	// 9. 기준 선택 후 -> 스터디 목록 조회
	int selectListCount(HashMap<String, String> map);
	ArrayList<Study> selectList(HashMap<String, String> map, PageInfo pi);
	
	// 10. 댓글 삭제
	int deleteReply(int rno);
	
	// 11. 댓글 수정
	int updateReply(Reply r);
	   
	/** 신고관리 **/
	// 1. 신고 게시판 리스트 페이지 조회용 (페이징)
	int selectReportCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	
	// 2. 신고 상세 조회
	int increaseReportCount(int reportNo);
	Study selectReport(int reportNo);
	   
	// 3. 신고글 블라인드
	int updateB(int reportNo);	
	
	// 4. 신고글 기각
	int updateR(int reportNo);
	
	/** 검색관리 **/
	//1. 신고관리 검색
	int reportListCount(HashMap<String, String> map);
	ArrayList<Report> selectReportList(PageInfo pi, HashMap<String, String> map);
}
