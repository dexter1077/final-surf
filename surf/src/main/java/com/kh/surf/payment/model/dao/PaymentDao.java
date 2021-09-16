package com.kh.surf.payment.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.payment.model.vo.Payment;

@Repository
public class PaymentDao {
	
	/**
	 * @author leeyeji
	 * 주문 내역 페이징
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("paymentMapper.selectListCount", userNo);
	}
	
	/**
	 * @author leeyeji
	 * 주문 내역 조회
	 */
	public ArrayList<Payment> selectOrderList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("paymentMapper.selectOrderList", userNo, rowBounds);
	}
	
	/**
	 * @author leeyeji
	 * 주문 내역 추가
	 */
	public int insertPayment(SqlSessionTemplate sqlSession, Payment p) {
		return sqlSession.insert("paymentMapper.insertPayment", p);
	}
	
	/**
	 * @author leeyeji
	 * Progress에 추가할 비디오 목록 조회
	 */
	public ArrayList<ClassVideo> selectMyLecVideo(SqlSessionTemplate sqlSession, HashMap<String, Object> map){
		ArrayList<ClassVideo> list = (ArrayList)sqlSession.selectList("paymentMapper.selectMyLecVideo", map);
		System.out.println("dao:" + list);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 주문 성공 시 progress 테이블에 해당 데이터 추가
	 */
	public int insertProgress(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("paymentMapper.insertProgress", map);
	}
	

}
