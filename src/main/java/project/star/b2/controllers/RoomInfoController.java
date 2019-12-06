package project.star.b2.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.PageData;
import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Info;
import project.star.b2.model.Room;
import project.star.b2.service.InfoService;
import project.star.b2.service.RoomInfoService;
import project.star.b2.service.RoomService;





@Controller
public class RoomInfoController {

	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.helper.RoomInfoService;
	@Autowired RoomInfoService roomInfoService;
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.helper.RoomInfoService;
	@Autowired RoomService roomService;
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.helper.RoomInfoService;
	@Autowired InfoService infoService;
	
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	
	/** 
	 * 목록페이지
	 */
	@RequestMapping(value = "/roominfo/list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); 	// 검색어
		int nowPage = webHelper.getInt("page", 1); 			// 페이지번호 (기본값 1)
		int totalCount = 0;										// 전체 게시글 수 
		int listCount = 10;										// 한 페이지당 표시할 목록 수
		int pageCount = 10;										// 한 그룹당 표시할 페이지 번호 수
		
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Room input = new Room();

		List<Room> room_output = null; // 조회결과가 저장될 객체
		List<Info> info_output = null;
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = roomService.getRoomCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Room.setOffset(pageData.getOffset());
			Room.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			room_output = roomService.getRoomList(null);
			info_output = infoService.getInfoList(null);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("room", room_output);
		model.addAttribute("info", info_output);
		model.addAttribute("pageData", pageData);
		
		String viewPath = "roominfo/list";
		return new ModelAndView(viewPath);
	}
	
	
	/**
	 * 상세 페이지 
	 */
	@RequestMapping(value = "/roominfo/view.do", method = RequestMethod.GET)
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
			output1 = roomService.getRoomItem(input1);
			output2 = infoService.getInfoItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		
		return new ModelAndView("roominfo/view"); 
	}
	
	
	/** 
	 * 작성 폼 페이지 
	 */
	@RequestMapping(value = "/roominfo/add.do", method = RequestMethod.GET)
	public ModelAndView super_add(Model model) { 
		
		return new ModelAndView("roominfo/add"); 
	}
	
	
}
