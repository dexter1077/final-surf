package com.kh.surf.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.surf.lecture.model.vo.ClassVideo;
import com.kh.surf.lecture.model.vo.Lecture;
import com.kh.surf.lecture.model.vo.MonthlyStats;
import com.kh.surf.member.model.vo.Member;
import com.kh.surf.teacher.model.service.TeacherService;
import com.kh.surf.teacher.model.vo.StatsData;
import com.kh.surf.teacher.model.vo.Teacher;

@Controller
public class AjaxTeacherController {
	
	@Autowired
	private TeacherService tService;
	
	/**
	 * @author HeeRak
	 * 공통영역 강사 이미지 노출을 위한 정보요청
	 */
	@ResponseBody
	@RequestMapping(value="ajaxLoadInfo.te", produces="application/json; charset=utf-8")
	public String selectTeacher(HttpSession session) {
		
		Teacher t = tService.selectTeacher(((Member)session.getAttribute("loginUser")).getUserNo());
		
		return new Gson().toJson(t);
	}
	
	/**
	 * 닉네임 중복확인 ajax
	 * @param checkNc
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="ajaxNicknameCheck.te", produces="text/html; charset=utf-8")
	public String checkNickname(HttpSession session,
								Teacher t) {
		
		t.setTeacherNo(((Member)session.getAttribute("loginUser")).getUserNo());
		String responseData;		
		int result = tService.checkNickname(t);
		
		if(result > 0) {
			responseData = "NNNNN";
		}else {
			responseData = "NNNNY";
		}
		
		return responseData;
	}
	/**
	 * 강사정보수정ajax
	 * @author HeeRak
	 * @param file - introContent
	 */
	@ResponseBody
	@RequestMapping(value="ajaxUpdate.te", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	public String uploadFile(MultipartFile file, Teacher t, HttpSession session) {
		
		t.setTeacherNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		String savePath = "resources/uploadFiles/profile_image/";
		System.out.println(t);
		// 요청 이전의 파일 수정명
		String beforeChagneName = t.getProfileImage().substring(t.getProfileImage().lastIndexOf("/")+1);
		// 새로운 첨부파일 있는 경우
		if(!file.getOriginalFilename().equals("")) {
			// 기존 파일 지우기
			if(!t.getProfileImage().equals("")) {
				new File(session.getServletContext().getRealPath(savePath) + beforeChagneName).delete();
			}
			
			// 새로운 파일 업로드(template 사용)
			String changeName = saveFile(session, file, "/"+savePath);
			t.setProfileImage(savePath + changeName);
			
		}
						
		int result = tService.updateTeacher(t);
		String responseData;
			
		if(result > 0) {
			responseData = "강사정보 수정완료";
		}else {
			responseData = "강사정보 수정실패";
		}
		
		return responseData;
	}
		
	/**
	 * 강사 특정 클래스 월별집계통계 요청
	 * @author HeeRak
	 * @return 
	 */
	@ResponseBody
	@RequestMapping(value="ajaxSelectClassLoan.te", produces="application/json; charset=utf-8")
	public String monthlyStatsLecture(int classNo, HttpSession session) {
			
		ArrayList<MonthlyStats> list = new ArrayList<>();
		
		if(classNo == 0) {	// 전체클래스 요청
			list = tService.monthlyStatsAll(((Member)session.getAttribute("loginUser")).getUserNo());
		}else {		// 한 클래스 요청
			list = tService.monthlyStatsLecture(classNo);			
		}
		
		return new Gson().toJson(list);
		
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 수강 통계, 신규 수강 건수 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxNewOrderStats.te", produces="application/json; charset=utf-8")
	public String selectNewOrderStats(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno,
			@RequestParam(value="condition", defaultValue="daily") String condition) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		map.put("condition", condition);
		
		ArrayList<StatsData> list1 = tService.selectNewOrderStats(map);
		
		return new Gson().toJson(list1);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 수강 통계, 완강 소요 일수 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxStudyDaysStats.te", produces="application/json; charset=utf-8")
	public String selectStudyDaysStats(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		
		ArrayList<StatsData> list2 = tService.selectStudyDaysStats(map);
		
		return new Gson().toJson(list2);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 수강 통계, 수강생 성별 비율 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxGenderRateStats.te", produces="application/json; charset=utf-8")
	public String selectGenderRateStats(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		
		ArrayList<StatsData> list3 = tService.selectGenderRateStats(map);
		
		return new Gson().toJson(list3);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 수강 통계, 수강생 연령대별 비율 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxAgeGroupRateStats.te", produces="application/json; charset=utf-8")
	public String selectAgeGroupRateStats(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		
		ArrayList<StatsData> list4 = tService.selectAgeGroupRateStats(map);
		
		return new Gson().toJson(list4);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 설문 조사 통계 정보 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxSurveyStats.te", produces="application/json; charset=utf-8")
	public String selectSurveyStats(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		
		ArrayList<StatsData> list = tService.selectSurveyStats(map);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * @author: Woojoo Seo
	 * @MethodInfo: 설문 조사 응답수 조회
	 */
	@ResponseBody
	@RequestMapping(value="ajaxRespondentCount.te", produces="application/json; charset=utf-8")
	public String selectRespondentCount(HttpSession session,
			@RequestParam(value="cno", defaultValue="all") String cno) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("cno", cno);
		
		int resCount = tService.selectRespondentCount(map);
		
		return new Gson().toJson(resCount);
	}
	
	
	/**
	 * 강의 입력페이지3 조회
	 * @author HeeRak
	 */
	@ResponseBody
	@RequestMapping(value="ajaxVideoList.te", produces="application/json; charset=utf-8")
	public String ajaxSelectVideoList(HttpSession session, Lecture l) {
		
		l.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		ArrayList<ClassVideo> cvList = tService.ajaxSelectVideoList(l);
		
		return new Gson().toJson(cvList);
	}
	
	/**
	 * 강의 등록|수정 진행도
	 * @author HeeRak
	 */
	@ResponseBody
	@RequestMapping(value="JqAjaxLoadDegree.te", produces="application/json; charset=utf-8")
	public String ajaxLoadDegree(int classNo) {
		
		int degree = tService.ajaxLoadDegree(classNo) * 20;
		
		return new Gson().toJson(degree);
	}
	
	/**
	 * saveFile
	 * @author HeeRak
	 */
	public String saveFile(HttpSession session, MultipartFile upfile, String path) {
		
		String savePath = session.getServletContext().getRealPath(path);
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // java.util.Date
		int ranNum = (int)(Math.random() * 90000 + 10000); //  * 개수 + 시작수
		String ext = originName.substring(originName.lastIndexOf(".")); // 뒤에서부터 . 찾아서 인덱스
		
		String changeName = currentTime + ranNum + ext; // 숫자 + 문자열 => 문자열
		
		// 서버에 파일 업로드(파일이름 바꾸면서)
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
