package project.star.b2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostController {
	
	/********************************************************************
<<<<<<< HEAD
	 *  						방주인 메인페이지
=======
	 *  							메인
>>>>>>> a01bd25dd591251707bc0184525283de753e7209
	 *******************************************************************/
	@RequestMapping(value = "/jsp/host/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		
		return new ModelAndView("jsp/host/main");
	}
<<<<<<< HEAD
=======
	
	/********************************************************************
	 *  							공실 등록하기
	 *******************************************************************/
	@RequestMapping(value = "/jsp/host/rm_add.do", method = RequestMethod.GET)
	public ModelAndView rm_add() {
		
		return new ModelAndView("jsp/host/rm_add");
	}
	
	/********************************************************************
	 *  							공실관리
	 *******************************************************************/
	@RequestMapping(value = "/jsp/host/rmli.do", method = RequestMethod.GET)
	public ModelAndView rmli() {
		
		return new ModelAndView("jsp/host/rmli");
	}
>>>>>>> a01bd25dd591251707bc0184525283de753e7209
}
