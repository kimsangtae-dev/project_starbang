package project.star.b2.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import okhttp3.Request;
import project.star.b2.helper.PageData;
import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Room;
import project.star.b2.model.User;
import project.star.b2.service.UserService;
import project.star.b2.service.RoomService;

@Controller
public class AdminController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.helper.UserService;
	@Autowired
	UserService userService;

	@Autowired
	RoomService roomService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/********************************************************************
	 * 글쓰기 수정
	 *******************************************************************/
	@RequestMapping(value = "/admin/edit.do", method = RequestMethod.GET)
	public ModelAndView edit() {

		return new ModelAndView("admin/edit");
	}

	/********************************************************************
	 * 관리자 자주묻는질문
	 *******************************************************************/
	@RequestMapping(value = "/admin/faq.do", method = RequestMethod.GET)
	public ModelAndView faq() {

		return new ModelAndView("admin/faq");
	}

	/********************************************************************
	 * 관리자 로그인
	 *******************************************************************/
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.GET)
	public ModelAndView login() {

		return new ModelAndView("admin/login");
	}

	/********************************************************************
	 * 관리자 메인
	 *******************************************************************/
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public ModelAndView main() {

		return new ModelAndView("admin/main");
	}

	/********************************************************************
	 * 관리자 공지사항
	 *******************************************************************/
	@RequestMapping(value = "/admin/notice.do", method = RequestMethod.GET)
	public ModelAndView notice() {

		return new ModelAndView("admin/notice");
	}

	/********************************************************************
	 * 방 관리
	 *******************************************************************/
	@RequestMapping(value = "/admin/rmli.do", method = RequestMethod.GET)
	public ModelAndView rmli(Model model, HttpServletRequest request) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int keyword2 = webHelper.getInt("keyword", 0); // 검색어
		int raval = webHelper.getInt("check");
//		String val = request.getParameter("check");
//		int radioval = Integer.parseInt(val);
//		String[] values = request.getParameterValues("check");
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호(기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

//		for (int i=0; i < values.length; i++) {
//			values[i] = 
//		}

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Room input = new Room();
		input.setStatus(raval);
		input.setRoomtype(keyword);
		input.setName(keyword);
		input.setDealingtype(keyword);

		List<Room> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체
		String rememberChecked = "";

		try {
			// 전체 게시글 수 조회
			totalCount = roomService.getRoomCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Room.setOffset(pageData.getOffset());
			Room.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = roomService.getRoomList(input);

			if (raval == 1) {
				output = roomService.getRoomCheckList(raval);
				rememberChecked = "1"; // 확인매물
				totalCount = roomService.getRoomCount(input);
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			} else if (raval == 2) {
				output = roomService.getRoomCheckList(raval);
				rememberChecked = "2"; // 허위매물
				totalCount = roomService.getRoomCount(input);
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			} else if (raval == 3) {
				output = roomService.getRoomCheckList(raval);
				rememberChecked = "3"; // 숨김매물
				totalCount = roomService.getRoomCount(input);
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			} else if (raval == 4) {
				output = roomService.getRoomCheckList(raval);
				rememberChecked = "4"; // 숨김매물
				totalCount = roomService.getRoomCount(input);
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			} else {
				output = roomService.getRoomList(input);
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("rememberChecked", rememberChecked);

		String viewPath = "admin/rmli";
		return new ModelAndView(viewPath);
	}

	/****** 방 삭제 페이지 ******/
	@RequestMapping(value = "/admin/delete_ok.do", method = RequestMethod.POST)
	public ModelAndView room_delete_ok(Model model, HttpServletRequest request) {
		/** 1) 필요한 변수값 생성 */
		// 삭제할 대상에 대한 PK값
		String delete = request.getParameter("delete_id");
		int roomno = Integer.valueOf(delete);

		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (roomno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Room input = new Room();
		input.setRoomno(roomno);

		try {
			// 데이터 수
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			roomService.deleteRoom(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String viewPath = "admin/rmli";
		return webHelper.redirect(viewPath, "수정되었습니다");
	}

	/****** 체크박스 페이지 ******/
	/*
	 * @RequestMapping(value = "/admin/rmli2.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public ModelAndView room_check_ok(Model model,
	 * HttpServletRequest request) {
	 * 
	 * String check = request.getParameter("check_id");
	 * 
	 * Room input = new Room(); input.setStatus(check);
	 * 
	 * List<Room> output = null; // 조회결과가 저장될 객체 try { // 데이터 조회 output =
	 * roomService.getRoomCheckConfirmList(input); } catch (Exception e) { return
	 * webHelper.redirect(null, e.getLocalizedMessage()); }
	 * 
	 *//** 3) 페이지 이동 *//*
						 * model.addAttribute("output", output); String viewPath = "/admin/rmli2.do";
						 * return webHelper.redirect(contextPath + viewPath, null); }
						 */

	/**
	 * 작성 폼에 대한 방확인 action 페이지
	 */
	@RequestMapping(value = "/admin/confirm_ok.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView room_edit_ok(Model model, HttpServletRequest request) {

		/** 데이터 받기 */
		String roomno1 = request.getParameter("user_id");
		System.out.println(roomno1);
		int roomno = Integer.valueOf(roomno1);

		/** 2) 데이터 수정하기 */
		// 저장할 값들을 Beans에 담는다.
		Room input = new Room();
		input.setRoomno(roomno);

		try {
			// 데이터 수
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			roomService.editConfirmRoom(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String viewPath = "/admin/rmli.do";
		return webHelper.redirect(contextPath + viewPath, "수정되었습니다");
	}

	/**
	 * hidden 페이지에 대한 방 action 페이지
	 */
	@RequestMapping(value = "/admin/hidden_ok.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView room_hidden_ok(Model model, HttpServletRequest request) {

		/** 데이터 받기 */
		String hidden = request.getParameter("hidden_id");
		int roomno = Integer.valueOf(hidden);

		/** 2) 데이터 수정하기 */
		// 저장할 값들을 Beans에 담는다.
		Room input = new Room();
		input.setRoomno(roomno);

		try {
			// 데이터 수
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			roomService.editHiddenRoom(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String viewPath = "/admin/rmli.do";
		return webHelper.redirect(contextPath + viewPath, "수정되었습니다");
	}

	/********************************************************************
	 * 회원 관리
	 *******************************************************************/

	/****** 목록 페이지 ******/
	@RequestMapping(value = "/admin/userli.do", method = RequestMethod.GET)
	public ModelAndView userli(Model model) {

		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호(기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		User input = new User();
		input.setName(keyword);
		input.setEmail(keyword);
		input.setPasswd(keyword);
		input.setTel(keyword);
		input.setRegdate(keyword);
		input.setEditdate(keyword);

		List<User> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = userService.getUserCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			User.setOffset(pageData.getOffset());
			User.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = userService.getUserList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "/admin/userli";
		return new ModelAndView(viewPath);
	}

	/********************************************************************
	 * 상세 페이지 보기
	 *******************************************************************/
	@RequestMapping(value = "/admin/userlist/view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model) {
		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int userno = webHelper.getInt("userno");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);

		// 조회결과를 저장할 객체 선언
		User output = null;

		try {
			// 데이터 조회
			output = userService.getUserItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);

		return new ModelAndView("/admin/userlist/view");
	}

	/**
	 * 작성 폼 페이지
	 */
	@RequestMapping(value = "/admin/userlist/add.do", method = RequestMethod.POST)
	public ModelAndView add(Model model) {

		return new ModelAndView("admin/userlist/add.do");
	}

	/**
	 * 작성 폼에 대한 action 페이지
	 */
	@RequestMapping(value = "/admin/userlist/add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String name = webHelper.getString("name");
		String email = webHelper.getString("email");
		String passwd = webHelper.getString("passwd");
		String tel = webHelper.getString("tel");
		String regdate = webHelper.getString("regdate");
		String editdate = webHelper.getString("editdate");
		String profile_img = webHelper.getString("profile_img");

		// 학과 이름은 필수 항목이므로 입력여부를 검사
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (name == null) {
			return webHelper.redirect(null, "회원이름을 입력하세요.");
		}

		if (!regexHelper.isKor(name)) {
			return webHelper.redirect(null, "회원이름은 한글만 가능합니다.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setName(name);
		input.setEmail(email);
		input.setPasswd(passwd);
		input.setTel(tel);
		input.setRegdate(regdate);
		input.setEditdate(editdate);
		input.setProfile_img(profile_img);

		try {

			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.addUser(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/admin/userlist/view.do?userno=" + input.getUserno();

		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/****** 회원 삭제 페이지 ******/
	@RequestMapping(value = "/admin/userlist/delete_ok.do", method = RequestMethod.POST)
	public ModelAndView delete_ok(Model model, HttpServletRequest request) {
		/** 1) 필요한 변수값 생성 */
		// 삭제할 대상에 대한 PK값
		String delete = request.getParameter("delete_id");
		int userno = Integer.valueOf(delete);

		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);

		try {
			// 데이터 삭제
			userService.deleteUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		/* return webHelper.redirect(contextPath + "/admin/userli.do", "삭제되었습니다."); */
		
		String viewPath = "admin/userlist";
		return webHelper.redirect(viewPath, "수정되었습니다");
	}

	/****** 회원 수정 폼 페이지 ******/
	@RequestMapping(value = "/admin/userlist/edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model) {
		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int userno = webHelper.getInt("userno");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (userno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User input = new User();
		input.setUserno(userno);

		// 조회결과를 저장할 객체 선언
		User output = null;

		try {
			output = userService.getUserItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("admin/userlist/edit");
	}

	/****** 회원 수정 폼에 대한 action 페이지 ******/
	@RequestMapping(value = "/admin/userlist/edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model) {

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		int userno = webHelper.getInt("userno");
		String name = webHelper.getString("name");
		String email = webHelper.getString("email");
		String passwd = webHelper.getString("passwd");
		String tel = webHelper.getString("tel");
		String regdate = webHelper.getString("regdate");
		String editdate = webHelper.getString("editdate");
		String profile_img = webHelper.getString("profile_img");

		if (userno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		if (name == null) {
			return webHelper.redirect(null, "회원이름을 입력하세요.");
		}

		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		User input = new User();
		input.setUserno(userno);
		input.setName(name);
		input.setEmail(email);
		input.setPasswd(passwd);
		input.setTel(tel);
		input.setRegdate(regdate);
		input.setEditdate(editdate);
		input.setProfile_img(profile_img);

		try {
			// 데이터 수정
			userService.editUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		//String redirectUrl = contextPath + "/admin/userlist/view.do?userno=" + input.getUserno();
		String redirectUrl = contextPath + "/admin/userli.do";
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	/********************************************************************
	 * 글쓰기
	 *******************************************************************/
	@RequestMapping(value = "/admin/write.do", method = RequestMethod.GET)
	public ModelAndView write() {

		return new ModelAndView("admin/write");
	}

	/********************************************************************
	 * 체크된 확인매울!
	 *******************************************************************/
	@RequestMapping(value = "/admin/rmli2.do", method = RequestMethod.GET)
	public ModelAndView rmli2(Model model) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int keyword2 = webHelper.getInt("keyword", 0); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호(기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Room input = new Room();
		input.setRoomtype(keyword);
		input.setTitle(keyword);
		input.setArea(keyword2);
		input.setFee(keyword2);
		input.setConfirmdate(keyword);
		input.setAddress(keyword);
		input.setUserno(keyword2);
		input.setName(keyword);
		/* input.setHidden(keyword); */

		List<Room> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = roomService.getRoomCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Room.setOffset(pageData.getOffset());
			Room.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = roomService.getRoomCheckConfirmList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("admin/rmli");
	}
}