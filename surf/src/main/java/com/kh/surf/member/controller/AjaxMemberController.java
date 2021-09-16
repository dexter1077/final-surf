package com.kh.surf.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.surf.lecture.model.vo.ClassStuding;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.Progress;
import com.kh.surf.member.model.service.MemberService;
import com.kh.surf.member.model.vo.Member;

@Controller
public class AjaxMemberController {
	
	@Autowired
	private MemberService mService;
	
	/** 
	 * @author HeeRak
	 * 강의 비디오 목록  
	 */
	@ResponseBody
	@RequestMapping(value="ajaxVideoList.le", produces="application/json; charset=utf-8")
	public String ajaxSelectVideoList(HttpSession session,
									  Lecture l) {
		
		l.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		// 비디오 목록 가져오기
		ArrayList<ClassVideo> videoList = mService.ajaxSelectVideoList(l);
		
		return new Gson().toJson(videoList);
	}
	
	/**
	 * @author HeeRak
	 * 마지막으로 시청한 비디오 정보 저장하기
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxLatestVideoWatching.le", produces="application/json; charset=utf-8")
	public void ajaxUpdateClassStuding(HttpSession session,
								       ClassStuding cs) {
		cs.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int result = mService.ajaxUpdateClassStuding(cs);
		
	}
	
	/**
	 * @author HeeRak
	 * 시청기록 남기기
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxfinishedWatching.le", produces="application/json; charset=utf-8")
	public String ajaxUpdateWatched(HttpSession session,
									Progress pg) {
		
		pg.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int result = mService.ajaxUpdateWatched(pg);
		
		return new Gson().toJson(result);
	}
	
	/**
	 * @author HeeRak
	 * 강의 시청 진척도
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxLoadDegree.le", produces="application/json; charset=utf-8")
	public String ajaxLoadStudingDegree(HttpSession session,
									ClassStuding cs) {
		
		cs.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int degree = mService.ajaxLoadStudingDegree(cs);
		
		return new Gson().toJson(degree);
	}
	
	/**
	 * @author HeeRak
	 * 마지막으로 본 동영상 조회
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxlastViewVideoLoad.le", produces="application/json; charset=utf-8")
	public String ajaxlastViewVideoLoad(HttpSession session,
										ClassStuding cs) {
		
		cs.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		int videoNo = mService.ajaxlastViewVideoLoad(cs);
		
		return new Gson().toJson(videoNo);
	}
	
}
