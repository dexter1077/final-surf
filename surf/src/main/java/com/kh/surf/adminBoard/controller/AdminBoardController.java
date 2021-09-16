package com.kh.surf.adminBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.surf.adminBoard.model.service.AdminBoardService;
import com.kh.surf.adminBoard.model.vo.AdminBoard;
import com.kh.surf.common.model.vo.PageInfo;
import com.kh.surf.common.template.Pagination;
import com.kh.surf.teacher.model.vo.Teacher;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminBoardService abService;

	/**
	 * @author 서정연 관리자 공지사항 리스트 페이지
	 */
	@RequestMapping("noticeList.ad")
	public ModelAndView selectList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		int listCount = abService.selectNoticeCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AdminBoard> list = abService.selectNoticeList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("adminBoard/adNoticeList");

		return mv;
	}

	/**
	 * @author 서정연 관리자 공지사항 글등록 페이지
	 */
	@RequestMapping("enrollNotice.ad")
	public String enrollNotice() {
		return "adminBoard/adNoticeEnroll";
	}

	/**
	 * @author 서정연 관리자 공지사항 글작성
	 */
	@RequestMapping("insertNotice.ad")
	public String insertNotice(AdminBoard ab, HttpSession session, Model model) {

		int result = abService.insertAdminNotice(ab);

		if (result > 0) { // 성공 => 게시글 리스트페이지
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:noticeList.ad";
		} else { // 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}

	}

	/**
	 * @author 서정연 관리자 공지사항 상세조회
	 */
	@RequestMapping("detailNotice.ad")
	public ModelAndView selectAdminNotice(int bno, ModelAndView mv) {
		int result = abService.increaseCountNotice(bno);

		if (result > 0) {
			AdminBoard ab = abService.selectAdminNotice(bno);
			mv.addObject("ab", ab).setViewName("adminBoard/adNoticeDetail");
		} else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * @author 서정연 관리자 공지사항 글삭제
	 */
	@RequestMapping("deleteNotice.ad")
	public String deleteAdminNotice(int bno, Model model, HttpSession session) {

		int result = abService.deleteAdminNotice(bno);

		if (result > 0) { // 성공 => 리스트페이지

			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:noticeList.ad";

		} else { // 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}

	}

	/**
	 * @author 서정연 관리자 공지사항 수정페이지
	 */	
	@RequestMapping("updateFormNotice.ad")
	public String updateFormAdminNotice(int bno, Model model) {

		model.addAttribute("ab", abService.selectAdminNotice(bno));
		return "adminBoard/adNoticeModify";

	}

	/**
	 * @author 서정연 관리자 공지사항 글수정
	 */
	@RequestMapping("updateNotice.ad")
	public String updateAdminNotice(AdminBoard ab, Model model, HttpSession session) {
		int result = abService.updateAdminNotice(ab);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detailNotice.ad?bno=" + ab.getBoardNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}


	/**
	 * @author 서정연 관리자 공지사항 검색 기능
	 */
	@RequestMapping("searchNotice.ad")
	public ModelAndView selectSearchNoticeList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String condition,
			String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		

		int listCount = abService.selectSearchNoticeCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AdminBoard> list = abService.selectSearchNoticeList(pi, map);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("condition", condition).addObject("keyword", keyword)
				.setViewName("adminBoard/adNoticeList");

		return mv;

}		



	/**********************************************************************************/

	/**
	 * @author 최서경 사용자 공지사항 목록 조회
	 */
	@RequestMapping("list.no")
	public ModelAndView selectNoticeList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		int listCount = abService.selectNoticeCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AdminBoard> list = abService.selectNoticeList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("adminBoard/noticeBoardList");

		return mv;
	}

	/**
	 * @author 최서경 사용자 공지사항 상세 조회
	 */
	@RequestMapping("detail.no")
	public ModelAndView detailNotice(ModelAndView mv, int nno) {

		int result = abService.increaseCountNotice(nno);

		if (result > 0) {
			AdminBoard notice = abService.selectAdminNotice(nno);
			mv.addObject("notice", notice).setViewName("adminBoard/noticeBoardDetail");
		} else {
			mv.addObject("errorMsg", "공지사항 조회 실패ㅠ").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * @author 최서경 사용자 공지사항 더보기
	 */
	@ResponseBody
	@RequestMapping(value = "more.no", produces = "application/json; charset=utf-8")
	public String moreNotice(int currentPage) {

		int listCount = abService.selectNoticeCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<AdminBoard> list = abService.selectNoticeList(pi);

		return new Gson().toJson(list);
	}

	/**
	 * @author 최서경 사용자 FAQ 목록 조회
	 */
	@RequestMapping("list.faq")
	public ModelAndView selectFaqList(ModelAndView mv) {
		int listCount = abService.selectFaqCount();
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 100, 100);
		ArrayList<AdminBoard> list = abService.selectFaqList(pi);

		mv.addObject("list", list).setViewName("adminBoard/faqBoard");

		return mv;
	}

	/*******************************************************************************************************/

	
	/**
	 * @author 서정연 관리자 FAQ 리스트페이지
	 */
	@RequestMapping("faqList.ad")
	public String selectListFaq(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		int listCount = abService.selectFaqCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AdminBoard> list = abService.selectFaqList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "adminBoard/adFaqList";
	}
	
	
	/**
	 * @author 서정연 관리자 FAQ 글작성
	 */
	@RequestMapping("insertFaq.ad")
	public String enrollFaq(AdminBoard ab, HttpSession session, Model model) {

		int result = abService.insertAdminFaq(ab);

		if (result > 0) { // 성공 => 게시글 리스트페이지
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:faqList.ad";
		} else { // 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}

	}

	/**
	 * @author 서정연 관리자 FAQ 글삭제
	 */
	@RequestMapping("deleteFaq.ad")
	public String deleteAdminFaq(int bno, Model model, HttpSession session) {
		int result = abService.deleteAdminFaq(bno);
		if (result > 0) { // 성공 => 리스트페이지

			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:faqList.ad";

		} else { // 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}

	}
	
	
	/**
	 * @author 서정연 관리자 FAQ 글수정
	 * @author 최서경 - 기능 일부 수정했습니다.
	 */
	@RequestMapping("updateFaq.ad")
	public String updateAdminFaq(AdminBoard ab, Model model, HttpSession session) {
		int result = abService.updateAdminFaq(ab);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:faqList.ad?bno=" + ab.getBoardNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}

	/**********************************************************************************/

	/**
	 * @author 서정연 관리자 강사신청 리스트페이지
	 */
	@RequestMapping("teacherList.ad")
	public ModelAndView selectTeacherList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		int listCount = abService.selectTeacherCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Teacher> list = abService.selectTeacherList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("adminBoard/adTeacherList");

		return mv;
	}
	/**
	 * @author 김은용 관리자 강사관리 검색
	 */
	@RequestMapping("teacherSearch.ad")
	public ModelAndView selectTeacherList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String condition,
			String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = abService.teacherListCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Teacher> list = abService.selectTeacherList(pi, map);

		mv.addObject("pi", pi).addObject("list", list).addObject("condition", condition).addObject("keyword", keyword)
				.setViewName("adminBoard/adTeacherList");

		return mv;

	}
	/**
	 * @author 김은용 관리자 강사관리 검색
	 */
	@RequestMapping("faqSearch.ad")
	public ModelAndView selectFaqList(ModelAndView mv,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String condition,
			String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = abService.faqListCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AdminBoard> list = abService.selectFaqList(pi, map);

		mv.addObject("pi", pi).addObject("list", list).addObject("condition", condition).addObject("keyword", keyword)
				.setViewName("adminBoard/adFaqList");

		return mv;

	}

	/**
	 * @author 서정연 관리자 강사신청 상세조회
	 */
	@RequestMapping("detailTeacher.ad")
	public ModelAndView selectTeacher(int tno, ModelAndView mv) {

		Teacher t = abService.selectTeacher(tno);
		
		mv.addObject("t", t).setViewName("adminBoard/adTeacherDetail");

		return mv;

	}
	
	/**
	 * @author 서정연 관리자 강사신청 승인
	 */
	@RequestMapping("updateYes.ad")
	public String updateYes(Model model, HttpSession session, int tno) {
		int result = abService.updateYes(tno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "강사신청이 승인되었습니다.");
			return "redirect:teacherList.ad";
		} else {
			model.addAttribute("errorMsg", "승인 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * @author 서정연 관리자 강사신청 반려
	 */
	@RequestMapping("updateNo.ad")
	public String updateNo(Model model, HttpSession session, int tno) {
		int result = abService.updateNo(tno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "강사신청이 반려되었습니다.");
			return"redirect:teacherList.ad";
		} else {
			model.addAttribute("errorMsg", "반려 실패");
			return "common/errorPage";
		}
	}
	

	

	
	
	
	public String saveFile(HttpSession session, MultipartFile upfile) {

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/profile_image/");

		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // java.util.Date
		int ranNum = (int) (Math.random() * 90000 + 10000); // * 개수 + 시작수
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
