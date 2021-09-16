package com.kh.surf.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.admin.model.vo.LectureList;
import com.kh.surf.admin.model.vo.PaymentList;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.ClassIntro;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.vo.Teacher;

@Repository
public class AdminDao {

	public Member adminLogin(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("adminMapper.adminLogin", m);
	}

	public int insertAd(SqlSessionTemplate sqlSession, Ad a) {

		return sqlSession.insert("adminMapper.insertAd", a);
	}

	// 게시물 선택 삭제
	public void delete(SqlSessionTemplate sqlSession, String adNo) {
		sqlSession.delete("adminMapper.delete", adNo);
	}

	// 광고베너 표시
	public void update(SqlSessionTemplate sqlSession, String adNo) {
		sqlSession.update("adminMapper.update", adNo);
	}
	
	//회원탈퇴용
	public void userUpdate(SqlSessionTemplate sqlSession, String userNo) {
		sqlSession.update("adminMapper.userUpdate", userNo);
	}

	public Member selectAdmin(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectAdmin", userNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int adNo) {
		return sqlSession.update("adminMapper.increaseCount", adNo);
	}

	public Ad selectAd(SqlSessionTemplate sqlSession, int adNo) {
		return sqlSession.selectOne("adminMapper.selectAd", adNo);
	}

	public int adUpdate(SqlSessionTemplate sqlSession, Ad ad) {
		return sqlSession.update("adminMapper.adUpdate", ad);
	}

	public int updateAd(SqlSessionTemplate sqlSession, Ad ad) {

		return sqlSession.update("adminMapper.updateAd", ad);
	}

	public ArrayList<Ad> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectSearchList", map, rowBounds);

	}

	public ArrayList<Ad> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectList", null, rowBounds);

	}

	//결제내역 게시판 페이징
	public int selectPmListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectPmListCount");
	}

	public ArrayList<PaymentList> selectPmList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectPmList", null, rowBounds);

	}
	//펀딩클래스 게시판 페이징
	public ArrayList<LectureList> selectFunList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectFunList", null, rowBounds);

	}

	public int selectFunListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectFunListCount");
	}
	//회원관리 게시판 페이징
	public int selectMemListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemListCount");
	}

	public ArrayList<Member> selectMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectMemList", null, rowBounds);

	}
	//클래스등록관리 페이징
	public int selectLectureListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectLectureListCount");
	}
	
	public ArrayList<Teacher> selectLectureList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.selectLectureList", null, rowBounds);

	}
	
	/** @author kim
	 * 결제내역 검색
	 */
	public ArrayList<PaymentList> selectSearchPayList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("adminMapper.selectSearchPayList", map, rowBounds);
	}

	public int selectSearchPayListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectSearchPayListCount", map);
		
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectSearchListCount", map);
	}
	/** @author kim
	 * 유저관리 검색
	 */
	public int selectSearchMemListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectSearchListMemCount", map);
	}
	public ArrayList<Member> selectSearchMemList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("adminMapper.selectSearchMemList", map, rowBounds);
	}
	//클래스등록관리 승인/반려/삭제/펀딩
	public void approvalUpdate(SqlSessionTemplate sqlSession, String classNo) {
		sqlSession.update("adminMapper.approvalUpdate", classNo);
	}

	public void companionUpdate(SqlSessionTemplate sqlSession, String classNo) {
		sqlSession.update("adminMapper.companionUpdate", classNo);
	}

	public void DeleteUpdate(SqlSessionTemplate sqlSession, String classNo) {
		sqlSession.update("adminMapper.DeleteUpdate", classNo);
	}

	public void fundingUpdate(SqlSessionTemplate sqlSession, String classNo) {
		sqlSession.update("adminMapper.fundingUpdate", classNo);
	}
	//펀딩클래스 삭제
	public void funUpdate(SqlSessionTemplate sqlSession, String classNo) {
		sqlSession.update("adminMapper.DeleteUpdate", classNo);
	}

	public ArrayList<LectureList> selectLecSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
		HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList) sqlSession.selectList("adminMapper.selectLecSearchList", map, rowBounds);
	}

	public int selectLecSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectLecSearchListCount", map);
	}

	public ArrayList<LectureList> selectFunSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList) sqlSession.selectList("adminMapper.selectFunSearchList", map, rowBounds);
	}

	public int selectFunSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectFunSearchListCount", map);
	}

	public Lecture selectLectureDetail(SqlSessionTemplate sqlSession, int lno) {
		return sqlSession.selectOne("adminMapper.selectLectureDetail", lno);
	}

	public ArrayList<ClassIntro> selectIntroList2(SqlSessionTemplate sqlSession, int lno) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectIntroList2", lno);
	}

	public int settleListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.settleListCount");
	}

	public ArrayList<PaymentList> settleList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adminMapper.settleList", null, rowBounds);

	}

	

	
}
	


	

