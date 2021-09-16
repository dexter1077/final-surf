package com.kh.surf.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.common.template.Pagination;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.payment.model.service.PaymentService;
import com.kh.surf.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	/**
	 * @author leeyeji
	 * 주문 목록 조회용
	 */
	@RequestMapping("order.mem")
	public ModelAndView selectOrderList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, int uno) {
		int listCount = pService.selectListCount(uno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Payment> pList = pService.selectOrderList(uno, pi);
		mv.addObject("pList", pList)
		  .addObject("pi", pi)
		  .setViewName("member/orderHistoryList");
		return mv;
	}
	
	/**
	 * @author leeyeji
	 * 결제 성공
	 */
	@ResponseBody
	@RequestMapping(value="payments.do")
	public int paymentSuccess(Payment p) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", p.getUserNo());
		map.put("classNo", p.getClassNo());

		int payResult = pService.insertPayment(p);
		if(payResult > 0) {
			
			ArrayList<ClassVideo> cList = pService.selectMyLecVideo(map);
			
			if(cList != null) {
				map.put("list", cList);
			}
			int proResult = pService.insertProgress(map);
		}
		return payResult;				
		
	}
	
	
	
}
