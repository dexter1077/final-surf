package com.kh.surf.adminBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.adminBoard.model.vo.AdminBoard;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.teacher.model.vo.Teacher;

@Repository
public class AdminBoardDao {
	
	/** 공지사항 **/
	
	// 공지사항 리스트조회 카운트(관리자)
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminBoardMapper.selectNoticeCount");
	}
	
	// 공지사항 리스트조회(관리자)
	public ArrayList<AdminBoard> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminBoardMapper.selectNoticeList", null, rowBounds);
	}
	
	// 공지사항 글작성(관리자)
	public int insertAdminNotice(SqlSessionTemplate sqlSession, AdminBoard ab) {
		return sqlSession.insert("adminBoardMapper.insertAdminNotice", ab);
	}

	// 공지사항 상세조회 카운트(관리자)
	public int increaseCountNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminBoardMapper.increaseCountNotice", boardNo);
	}
	
	// 공지사항 상세조회(관리자)
	public AdminBoard selectAdminNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminBoardMapper.selectAdminNotice", boardNo);
	}
	
	// 공지사항 삭제(관리자)
	public int deleteAdminNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminBoardMapper.deleteAdminNotice", boardNo);
	}
	
	// 공지사항 수정(관리자)
	public int updateAdminNotice(SqlSessionTemplate sqlSession, AdminBoard ab) {
		return sqlSession.update("adminBoardMapper.updateAdminNotice", ab);
	}
	
	// 공지사항 검색(관리자)
	public int selectSearchNoticeCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminBoardMapper.selectSearchNoticeCount", map);
	}
	
	public ArrayList<AdminBoard> selectSearchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("adminBoardMapper.selectSearchNoticeList", map, rowBounds);

	}
	
	/** FAQ **/
	
	// FAQ 리스트조회 카운트(관리자)
	public int selectFaqCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminBoardMapper.selectFaqCount");
	}
	
	// FAQ 리스트조회(관리자)
	public ArrayList<AdminBoard> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminBoardMapper.selectFaqList", null, rowBounds);
	}

	// FAQ 글작성(관리자)
	public int insertAdminFaq(SqlSessionTemplate sqlSession, AdminBoard ab) {
		return sqlSession.insert("adminBoardMapper.insertAdminFaq", ab);
	}
	
	// FAQ 글삭제(관리자)
	public int deleteAdminFaq(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminBoardMapper.deleteAdminFaq", boardNo);
	}
	
	// FAQ 글수정(관리자)
	public int updateAdminFaq(SqlSessionTemplate sqlSession, AdminBoard ab) {
		return sqlSession.update("adminBoardMapper.updateAdminFaq", ab);
	}
	
	
	/** 강사신청  **/
	// 강사신청 리스트조회 카운트(관리자)
	public int selectTeacherCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminBoardMapper.selectTeacherCount");
	}
	
	// 강사신청 리스트조회(관리자)	
	public ArrayList<Teacher> selectTeacherList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminBoardMapper.selectTeacherList", null, rowBounds);
	}

	// 강사신청 리스트 상세조회(관리자)
	public Teacher selectTeacher(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("adminBoardMapper.selectTeacher", tno);
	}
	
	// 강사신청 승인(관리자)
	public int updateYes(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.update("adminBoardMapper.updateYes", tno);
	}	
	
	// 강사신청 반려(관리자)
	public int updateNo(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.update("adminBoardMapper.updateNo", tno);
	}

	//강사관리 검색(관리자)
	public int teacherListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminBoardMapper.teacherListCount", map);
	}

	public ArrayList<Teacher> selectTeacherList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("adminBoardMapper.selectSearchTeacherList", map, rowBounds);
	}
	
	//FAQ관리 검색(관리자)
	public int faqListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminBoardMapper.faqListCount", map);
	}

	public ArrayList<AdminBoard> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("adminBoardMapper.selectSearchFaqList", map, rowBounds);
	}	

	

}
