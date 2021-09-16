package com.kh.surf.studyBoard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.common.template.Pagination;
import com.kh.surf.studyBoard.model.service.StudyBoardService;
import com.kh.surf.studyBoard.model.vo.Reply;
import com.kh.surf.studyBoard.model.vo.Report;
import com.kh.surf.studyBoard.model.vo.Study;

@Controller
public class StudyBoardController {
	
	@Autowired
	private StudyBoardService sbService;
	
	
	/** @author 최서경
	 * 스터디게시판 목록 조회
	 */
	@RequestMapping("list.sb")
	public ModelAndView studyList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage
												 , @RequestParam(value="recruit", defaultValue="")String recruit
												 , @RequestParam(value="keyword", defaultValue="")String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("recruit", recruit);
		map.put("keyword", keyword);
		// 게시물 총 개수
		int listCount = sbService.selectListCount(map);
		// 페이징처리 정보
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		// 게시물 조회
		ArrayList<Study> list = sbService.selectList(map, pi);
		
		System.out.println(recruit);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("studyBoard/studyBoardList");
		return mv;
	}
	
	/** @author 최서경
	 * 스터디 목록 - 글 더보기
	 */
	@ResponseBody
	@RequestMapping(value="more.sb", produces="application/json; charset=utf-8")
	public String moreStudyList(int currentPage, @RequestParam(value="recruit", defaultValue="")String recruit
											   , @RequestParam(value="keyword", defaultValue="")String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("recruit", recruit);
		map.put("keyword", keyword);
		
		int listCount = sbService.selectListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Study> list = sbService.selectList(map, pi);
		return new Gson().toJson(list);
	}
	
	
	/** @author 최서경
	 * 스터디게시판 상세조회
	 */
	@RequestMapping("detail.sb")
	public ModelAndView studyDetail(ModelAndView mv, int sno) {
		
		int result = sbService.increaseCount(sno);
		
		if(result > 0) {
			Study s = sbService.selectStudy(sno);
			mv.addObject("s", s).setViewName("studyBoard/studyBoardDetail");
			
		} else {
			mv.addObject("errorMsg", "조회수 증가 실패ㅠ").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** @author 최서경
	 * 게시물 댓글 조회
	 */
	@ResponseBody
	@RequestMapping(value="rlist.sb", produces="application/json; charset=utf-8")
	public String selectReplyList(@RequestParam(value="sno") int studyNo) {
		
		ArrayList<Reply> list = sbService.selectReplyList(studyNo);
		return new Gson().toJson(list);
	}
	
	/** @author 최서경
	 * 게시물 댓글 작성
	 */
	@ResponseBody
	@RequestMapping("rinsert.sb")
	public String insertReply(Reply r) {
		int result = sbService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
	}
	
	/** @author 최서경
	 * 글 또는 댓글 신고하기
	 */
	@RequestMapping("report.sb")
	public ModelAndView insertReport(ModelAndView mv, HttpSession session, Report r) {
		
		int result = sbService.insertReport(r);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "신고되었습니다.");
			
			if(r.getRefType().equals("게시글")) {
				mv.setViewName("redirect:list.sb");
			} else {
				mv.setViewName("redirect:detail.sb?sno=" + r.getRsno());
			}
		} else {
			mv.addObject("errorMsg", "신고하기 실패ㅠ");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/** @author 최서경
	 * 스터디 모집 글 작성 화면 포워딩
	 */
	@RequestMapping("enrollForm.sb")
	public String studyBoardEnrollForm() {
		return "studyBoard/studyBoardEnrollForm";
	}
	
	/** @author 최서경
	 * 스터디 모집 글 작성
	 */
	@RequestMapping("insert.sb")
	public String insertStudy(HttpSession session, Model m, Study s) {
		
		int result = sbService.insertStudy(s);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "스터디 등록이 완료되었습니다.");
			return "redirect:list.sb";
		} else {
			m.addAttribute("errorMsg", "스터디 등록 실패ㅠ");
			return "common/errorPage";
		}
	}
	
	/** @author 최서경
	 * 스터디 글 삭제
	 */
	public String deleteStudy() {
		return "";
	}
	
	/** @author 최서경
	 * 스터디 글 수정 화면
	 */
	@RequestMapping("updateForm.sb")
	public ModelAndView updateStudyForm(ModelAndView mv, int studyNo) {
		
		Study s = sbService.selectStudy(studyNo);
		if(s == null) {
			mv.addObject("errorMsg", "스터디 글 수정화면을 불러오지 못했습니다.").setViewName("common/errorPage");
		} else {
			mv.addObject("s", s).setViewName("studyBoard/studyBoardUpdate");
		}
		return mv;
	}

	/** @author 최서경
	 * 스터디 글 수정
	 */
	@RequestMapping("update.sb")
	public ModelAndView updateStudy(ModelAndView mv, HttpSession session, Study s) {
		
		int result = sbService.updateStudy(s);
		if(result > 0) {
			session.setAttribute("alertMsg", "스터디 글이 정상적으로 수정되었습니다.");
			mv.setViewName("redirect:detail.sb?sno=" + s.getStudyNo());
		} else {
			mv.addObject("errorMsg", "스터디 글 수정 실패ㅠ").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** @author 최서경
	 * 스터디 글 삭제
	 */
	@RequestMapping("delete.sb")
	public ModelAndView deleteStudy(ModelAndView mv, HttpSession session, int studyNo) {
		int result = sbService.deleteStudy(studyNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선택한 스터디 글이 삭제되었습니다.");
			mv.setViewName("redirect:list.sb");
		} else {
			mv.addObject("errorMsg", "스터디 글 삭제 실패ㅠ").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** @author 최서경
	 * 댓글 삭제
	 */
	@ResponseBody
	@RequestMapping("delete.re")
	public String deleteReply(int rno) {
		
		int result = sbService.deleteReply(rno);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	/** @author 최서경
	 * 댓글 수정
	 */
	@ResponseBody
	@RequestMapping("update.re")
	public String updateReply(Reply r) {

		int result = sbService.updateReply(r);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}		
	}
	
	/** @author 서정연 
	 * 관리자 신고관리 리스트페이지
	 */
	@RequestMapping("reportList.ad")
	public ModelAndView selectReportList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		int listCount = sbService.selectReportCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> list = sbService.selectReportList(pi);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("adminBoard/adReportList");

		return mv;
		
	}
	
	/** @author 서정연
	 * 관리자 신고관리 블라인드 처리
	 */
	@RequestMapping("updateB.ad")
	public ModelAndView updateB(ModelAndView mv, HttpSession session, int reportNo) {
		
		int result = sbService.updateB(reportNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "선택한 신고 글이 블라인드되었습니다.");
			mv.setViewName("redirect:reportList.ad");
		} else {
			mv.addObject("errorMsg", "블라인드 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** @author 서정연
	 * 관리자 신고관리 기각 처리
	 */
	@RequestMapping("updateR.ad")
	public ModelAndView updateR(ModelAndView mv, HttpSession session, int reportNo) {
		int result = sbService.updateR(reportNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선택한 신고 글이 기각되었습니다.");
			mv.setViewName("redirect:reportList.ad");
		} else {
			mv.addObject("errorMsg", "기각 실패").setViewName("common/errorPage");
		}
		return mv;
	}	
	
	/**
	 * @author 김은용 관리자 강사관리 검색
	 */
	@RequestMapping("reportSearch.ad")
	public ModelAndView selectReportList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String condition,
			String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = sbService.reportListCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> list = sbService.selectReportList(pi, map);

		mv.addObject("pi", pi).addObject("list", list).addObject("condition", condition).addObject("keyword", keyword)
				.setViewName("adminBoard/adReportList");

		return mv;

	}

	
	
}

