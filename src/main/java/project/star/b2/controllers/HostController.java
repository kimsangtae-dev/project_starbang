package project.star.b2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostController {
	
	/********************************************************************
	 *  						방주인 메인페이지
	 *******************************************************************/
	@RequestMapping(value = "/jsp/host/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		
		return new ModelAndView("jsp/host/main");
	}
}
