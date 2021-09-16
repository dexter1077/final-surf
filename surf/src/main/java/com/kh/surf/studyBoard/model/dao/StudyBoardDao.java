package com.kh.surf.studyBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.studyBoard.model.vo.Reply;
import com.kh.surf.studyBoard.model.vo.Report;
import com.kh.surf.studyBoard.model.vo.Study;

@Repository
public class StudyBoardDao {

	/** @author 최서경
	 * 스터디 게시물 개수 조회
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyboardMapper.selectListCount");
	}
	
	/** @author 최서경
	 * 스터디 게시물 목록 조회
	 */
	public ArrayList<Study> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("studyboardMapper.selectList", null, rowBounds);
	}
	
	/** @author 최서경
	 * 스터디 상세조회 -> 조회수 증가
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.update("studyboardMapper.increaseCount", studyNo);
	}
	
	/** @author 최서경
	 * 스터디 상세조회
	 */
	public Study selectStudy(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.selectOne("studyboardMapper.selectStudy", studyNo);
	}
	
	/** @author 최서경
	 * 스터디 등록
	 */
	public int insertStudy(SqlSessionTemplate sqlSession, Study s) {
		return sqlSession.insert("studyboardMapper.insertStudy", s);
	}
	
	/** @author 최서경
	 * 스터디 글 수정
	 */
	public int updateStudy(SqlSessionTemplate sqlSession, Study s) {
		return sqlSession.update("studyboardMapper.updateStudy", s);
	}
	
	/** @author 최서경
	 * 스터디 글 삭제
	 */
	public int deleteStudy(SqlSessionTemplate sqlSession, int studyNo) {
		return sqlSession.update("studyboardMapper.deleteStudy", studyNo);
	}
	
	/** @author 최서경
	 * 스터디 상세조회 -> 댓글 조회
	 */
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int studyNo){
		return (ArrayList)sqlSession.selectList("studyboardMapper.selectReplyList", studyNo);
	}
	
	/** @author 최서경
	 * 댓글 작성
	 */
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("studyboardMapper.insertReply", r);
	}
	
	/** @author 최서경
	 * 글 또는 댓글 신고하기
	 */
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("studyboardMapper.insertReport", r);
	}
	
	/** @author 최서경
	 * 모집여부 선택 후 스터디 갯수 조회
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("studyboardMapper.selectListCount", map);
	}
	
	/** @author 최서경
	 * 모집여부 선택 후 스터디 목록 조회
	 */
	public ArrayList<Study> selectList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("studyboardMapper.selectList", map, rowBounds);
	}
	
	/** @author 최서경
	 * 댓글 삭제
	 */
	public int deleteReply(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("studyboardMapper.deleteReply", rno);
	}
	
	/** @author 최서경
	 * 댓글 수정
	 */
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("studyboardMapper.updateReply", r);
	}
	
	/** @author 서정연
	 * 신고관리 리스트페이지 조회수용
	 */
	public int selectReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyboardMapper.selectReportCount");
	}

	/** @author 서정연
	 * 신고관리 리스트페이지 조회용
	 */
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("studyboardMapper.selectReportList", null, rowBounds);
	}
	
	public int updateB(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.update("studyboardMapper.updateBlind", reportNo);
	}
	
	public int updateR(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.update("studyboardMapper.updateRejection", reportNo);
	}

	public int reportListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("studyboardMapper.reportListCount", map);
	}

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("studyboardMapper.selectSearchReportList", map, rowBounds);
	}

	
}
