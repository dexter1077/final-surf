package com.kh.surf.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.surf.admin.model.vo.Ad;
import com.kh.surf.lecture.model.vo.ClassFunding;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.main.model.service.MainService;
import com.kh.surf.studyBoard.model.vo.Study;


@Controller
public class MainController {

	@Autowired
	private MainService mService;
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 메인페이지 광고 배너 리스트 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxAdList.do", produces="application/json; charset=utf-8")
	public String selectMainAdList() {
		
		ArrayList<Ad> alist = mService.selectMainAdList();
		
		return new Gson().toJson(alist);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 메인페이지 추천 클래스 리스트 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxRecomClassList.do", produces="application/json; charset=utf-8")
	public String selectRecomClassList(@RequestParam(value="condition", defaultValue="1")int condition) {
		
		ArrayList<Lecture> clist = mService.selectRecomClassList(condition);
		
		return new Gson().toJson(clist);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 메인페이지 커뮤니티 포스트 리스트 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxPostList.do", produces="application/json; charset=utf-8")
	public String selectPostList() {
		
		ArrayList<Study> plist = mService.selectPostList();
		
		return new Gson().toJson(plist);
	}
	
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 메인페이지 펀딩 클래스 리스트 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxFundingList.do", produces="application/json; charset=utf-8")
	public String selectFundingList() {
		
		ArrayList<ClassFunding> flist = mService.selectFundingList();
		
		return new Gson().toJson(flist);
	}
}
