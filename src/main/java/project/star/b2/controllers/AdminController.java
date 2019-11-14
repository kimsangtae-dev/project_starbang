package project.star.b2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	/********************************************************************
	 *  						글쓰기 수정
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/edit.do", method = RequestMethod.GET)
	public ModelAndView edit() {
		
		return new ModelAndView("jsp/admin/edit");
	}
	
	/********************************************************************
	 *  					   관리자 자주묻는질문
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/faq.do", method = RequestMethod.GET)
	public ModelAndView faq() {
		
		return new ModelAndView("jsp/admin/faq");
	}
	
	/********************************************************************
	 *  						관리자 로그인
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		
		return new ModelAndView("jsp/admin/login");
	}
	
	/********************************************************************
	 *  						관리자 메인
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		
		return new ModelAndView("jsp/admin/main");
	}
	
	/********************************************************************
	 *  						관리자 공지사항
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/notice.do", method = RequestMethod.GET)
	public ModelAndView notice() {
		
		return new ModelAndView("jsp/admin/notice");
	}
	
	/********************************************************************
	 *  							방 관리
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/rmli.do", method = RequestMethod.GET)
	public ModelAndView rmli() {
		
		return new ModelAndView("jsp/admin/rmli");
	}
	
	/********************************************************************
	 *  							회원 관리
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/userli.do", method = RequestMethod.GET)
	public ModelAndView userli() {
		
		return new ModelAndView("jsp/admin/userli");
	}
	
	/********************************************************************
	 *  							글쓰기
	 *******************************************************************/
	@RequestMapping(value = "/jsp/admin/write.do", method = RequestMethod.GET)
	public ModelAndView write() {
		
		return new ModelAndView("jsp/admin/write");
	}	
}