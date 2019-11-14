package project.star.b2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	
	/********************************************************************
	 *  							메인
	 *******************************************************************/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() {
		
		return new ModelAndView("index");
	}
	
	/********************************************************************
	 *  							자주묻는질문
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/faq.do", method = RequestMethod.GET)
	public ModelAndView faq() {
		
		return new ModelAndView("jsp/main/faq");
	}
	
	/********************************************************************
	 *  							마이페이지
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage() {
		
		return new ModelAndView("jsp/main/mypage");
	}
	
	/********************************************************************
	 *  							공지사항
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/notice.do", method = RequestMethod.GET)
	public ModelAndView notice() {
		
		return new ModelAndView("jsp/main/notice");
	}
	
	/********************************************************************
	 *  							인기매물
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/pprm.do", method = RequestMethod.GET)
	public ModelAndView pprm() {
		
		return new ModelAndView("jsp/main/pprm");
	}
	
	/********************************************************************
	 *  							상세페이지
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/rmdt.do", method = RequestMethod.GET)
	public ModelAndView rmdt() {
		
		return new ModelAndView("jsp/main/rmdt");
	}
	
	/********************************************************************
	 *  							최근 본 방
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/rtrm.do", method = RequestMethod.GET)
	public ModelAndView rtrm() {
		
		return new ModelAndView("jsp/main/rtrm");
	}
	
	/********************************************************************
	 *  							방찾기
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/search.do", method = RequestMethod.GET)
	public ModelAndView search() {
		
		return new ModelAndView("jsp/main/search");
	}
	
	/********************************************************************
	 *  							찜한방
	 *******************************************************************/
	@RequestMapping(value = "/jsp/main/wish.do", method = RequestMethod.GET)
	public ModelAndView wish() {
		
		return new ModelAndView("jsp/main/wish");
	}


	
}