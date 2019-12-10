package project.star.b2.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.RetrofitHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Info;
import project.star.b2.model.Room;
import project.star.b2.service.RIPService;


@Controller
public class HostController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** RegexHelper 주입 */
	@Autowired
	RetrofitHelper retrofitHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	RIPService ripService;


	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/********************************************************************
	 * 방주인 메인페이지
	 *******************************************************************/
	@RequestMapping(value = "/host/main.do", method = RequestMethod.GET)
	public ModelAndView main() {

		return new ModelAndView("host/main");
	}

	/********************************************************************
	 * 공실 등록하기
	 *******************************************************************/
	@RequestMapping(value = "/host/rm_add.do", method = RequestMethod.GET)
	public ModelAndView rm_add() {

		return new ModelAndView("host/rm_add");
	}
	
	/********************************************************************
	 * 상세 페이지 보기
	 *******************************************************************/
	@RequestMapping(value = "/host/roominfo/view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model) { 
		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int roomno = webHelper.getInt("roomno");
		
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (roomno == 0) {
			return webHelper.redirect(null, "방번호가 없습니다.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Room input1 = new Room();
		Info input2 = new Info();
		input1.setRoomno(roomno);
		input2.setRoomno(roomno);
		
		// 조회결과를 저장할 객체 선언
		Room output1 = null;
		Info output2 = null;
		
		try {
			//데이터 조회
			output1 = ripService.getRoomItem(input1);
			output2 = ripService.getInfoItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		
		return new ModelAndView("host/roominfo/view"); 
	}

	/********************************************************************
	 * 공실 수정하기
	 *******************************************************************/
	@RequestMapping(value = "/host/rm_edit.do", method = RequestMethod.GET)
	public ModelAndView rm_edit() {

		return new ModelAndView("jsp/host/rm_edit");
	}

	/********************************************************************
	 * 공실관리
	 *******************************************************************/
	@RequestMapping(value = "/host/rmli.do", method = RequestMethod.GET)
	public ModelAndView rmli() {

		return new ModelAndView("host/rmli");
	}
}
