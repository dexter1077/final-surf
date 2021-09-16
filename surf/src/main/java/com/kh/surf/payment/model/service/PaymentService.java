package com.kh.surf.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.payment.model.vo.Payment;

public interface PaymentService {
	
	/**
	 * @author leeyeji
	 * 주문 내역 조회
	 */
	int selectListCount(int uesrNo);
	ArrayList<Payment> selectOrderList(int userNo, PageInfo pi);
	
	// progress 테이블에 추가하기 위한 비디오 조회
	ArrayList<ClassVideo> selectMyLecVideo(HashMap<String, Object> map);
	
	// progress 데이터 추가
	int insertProgress(HashMap<String, Object> map);
	
	// DB에 주문 내역 추가
	int insertPayment(Payment p);
	
}
