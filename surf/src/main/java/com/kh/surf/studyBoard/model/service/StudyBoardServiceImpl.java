package com.kh.surf.studyBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.studyBoard.model.dao.StudyBoardDao;
import com.kh.surf.studyBoard.model.vo.Reply;
import com.kh.surf.studyBoard.model.vo.Report;
import com.kh.surf.studyBoard.model.vo.Study;

@Service
public class StudyBoardServiceImpl implements StudyBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StudyBoardDao sbDao;
	
	@Override
	public int selectListCount() {
		return sbDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Study> selectList(PageInfo pi) {
		return sbDao.selectList(sqlSession, pi);
	}
	@Override
	public int increaseCount(int studyNo) {
		return sbDao.increaseCount(sqlSession, studyNo);
	}
	@Override
	public Study selectStudy(int studyNo) {
		return sbDao.selectStudy(sqlSession, studyNo);
	}
	@Override
	public int insertStudy(Study s) {
		return sbDao.insertStudy(sqlSession, s);
	}
	@Override
	public int deleteStudy(int studyNo) {
		return sbDao.deleteStudy(sqlSession, studyNo);
	}
	@Override
	public int updateStudy(Study s) {
		return sbDao.updateStudy(sqlSession, s);
	}
	@Override
	public ArrayList<Reply> selectReplyList(int studyNo) {
		return sbDao.selectReplyList(sqlSession, studyNo);
	}
	@Override
	public int insertReply(Reply r) {
		return sbDao.insertReply(sqlSession, r);
	}
	@Override
	public int insertReport(Report r) {
		return sbDao.insertReport(sqlSession, r);
	}
	
	@Override
	public int selectListCount(HashMap<String, String> map) {
		return sbDao.selectListCount(sqlSession, map);
	}
	
	@Override
	public int deleteReply(int rno) {
		return sbDao.deleteReply(sqlSession, rno);
	}
	
	@Override
	public int updateReply(Reply r) {
		return sbDao.updateReply(sqlSession, r);
	}
	
	
	@Override
	public ArrayList<Study> selectList(HashMap<String, String> map, PageInfo pi) {
		return sbDao.selectList(sqlSession, map, pi);
	}
	
	@Override
	public int selectReportCount() {
		return sbDao.selectReportCount(sqlSession);
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return sbDao.selectReportList(sqlSession, pi);
	}
	
	@Override
	public Study selectReport(int reportNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int increaseReportCount(int reportNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateB(int reportNo) {
		return sbDao.updateB(sqlSession, reportNo);
	}
	@Override
	public int updateR(int reportNo) {
		return sbDao.updateR(sqlSession, reportNo);
	}
	@Override
	public int reportListCount(HashMap<String, String> map) {
		return sbDao.reportListCount(sqlSession, map);
	}
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi, HashMap<String, String> map) {
		return sbDao.selectReportList(sqlSession, pi, map);
	}


}
