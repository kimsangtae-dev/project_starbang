package project.star.b2.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.DownloadHelper;
import project.star.b2.helper.PageData;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Gallery;
import project.star.b2.model.Heart;
import project.star.b2.model.Popular;
import project.star.b2.model.Room;
import project.star.b2.service.GalleryService;
import project.star.b2.service.HeartService;
import project.star.b2.service.RoomService;

@Controller
public class MainController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import project.star.b2.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	// --> import project.star.b2.service.RoomService;
	@Autowired
	RoomService roomService;
	@Autowired
	GalleryService galleryService;
	@Autowired
	GalleryService gallerypopularService;
	@Autowired
	HeartService heartService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/********************************************************************
	 * 메인
	 *******************************************************************/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Model model) {
		/** 1)필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한 페이지당 표시할 목록 수
		int pageCount = 1; // 한 그룹당 표시할 페이지 번호 수

		/** 2)데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Popular input = new Popular();

		List<Popular> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Popular.setOffset(pageData.getOffset());
			Popular.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = galleryService.getPopularGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);

		return new ModelAndView("index");
	}

	/********************************************************************
	 * 자주묻는질문
	 *******************************************************************/
	@RequestMapping(value = "/main/faq.do", method = RequestMethod.GET)
	public ModelAndView faq() {

		return new ModelAndView("main/faq");
	}

	/********************************************************************
	 * 마이페이지
	 *******************************************************************/
	@RequestMapping(value = "/main/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage() {

		return new ModelAndView("main/mypage");
	}

	/********************************************************************
	 * 공지사항
	 *******************************************************************/
	@RequestMapping(value = "/main/notice.do", method = RequestMethod.GET)
	public ModelAndView notice() {

		return new ModelAndView("main/notice");
	}

	/********************************************************************
	 * 인기매물
	 *******************************************************************/
	@RequestMapping(value = "/main/pprm.do", method = RequestMethod.GET)
	public ModelAndView pprm(Model model) {
		/** 1)필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 50; // 한 페이지당 표시할 목록 수
		int pageCount = 1; // 한 그룹당 표시할 페이지 번호 수

		/** 2)데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Popular input = new Popular();

		List<Popular> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Popular.setOffset(pageData.getOffset());
			Popular.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = galleryService.getPopularGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("output", output);
		
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);

		return new ModelAndView("main/pprm");
	}

	/********************************************************************
	 * 상세페이지 (rmdt 파라미터 읽기)
	 *******************************************************************/
	@RequestMapping(value = "/main/rmdt.do", method = RequestMethod.GET)
	public String rmdt() {

		return "main/rmdt";
	}

	/********************************************************************
	 * 상세페이지 (rmdt 쿠키 단일 저장)
	 *******************************************************************/
	@RequestMapping(value = "/main/rmdtsave.do", method = RequestMethod.GET)

	public String rmdtsave(HttpServletResponse response,
			@RequestParam(value = "roomno", defaultValue = "") String roomno) {

		if (!roomno.equals("")) {
			try {
				roomno = URLEncoder.encode(roomno, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		Cookie cookie = new Cookie("roomno", roomno); // 저장할 쿠키 생성
		cookie.setPath("/"); // 쿠키의 유효 경로
		cookie.setDomain("localhost"); // 쿠키의 유효 도메인

		if (roomno.equals("")) { // 쿠키 시간을 설정하지 않으면 브라우저가 동작하는 동안 유효
			cookie.setMaxAge(0); // 쿠키 설정시간이 0이면 즉시 삭제
		} else {
			cookie.setMaxAge(60); // 값이 있다면 60초 동안 쿠키 저장
		}

		response.addCookie(cookie);

		/** 2) Spring방식의 페이지 이동. */
		// Servlet의 response.sendRedirect(url)과 동일
		// --> "/"부터 시작할 경우 ContextPath는 자동으로 앞에 추가된다.
		return "redirect:/main/rmdt.do?roomno=" + cookie;
	}

	/********************************************************************
	 * 최근 본 방
	 *******************************************************************/
	/** 쿠키 저장을 위한 작성 페이지 */
	@RequestMapping(value = "/main/rtrm.do", method = RequestMethod.GET)
	public ModelAndView rtrm(Model model, @CookieValue(value = "my_cookie", defaultValue = "") String myCookie) {
		try {
			myCookie = URLDecoder.decode(myCookie, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		/** 1) 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수

		/** 2)데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Gallery input = new Gallery();

		List<Gallery> output = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 데이터 조회하기
			output = galleryService.getGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("my_cookie", myCookie);

		return new ModelAndView("main/rtrm");
	}

	/********************************************************************
	 * 방찾기
	 *******************************************************************/
	@RequestMapping(value = "/main/search.do", method = RequestMethod.GET)
	public ModelAndView search(Model model) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", "");// 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 24; // 한 페이지당 표시할 목록 수
		int pageCount = 7; // 한 그룹당 표시할 페이지 번호 수

		String room = webHelper.getString("roomtype");

		int feeFrom = webHelper.getInt("feeFrom");
		int feeTo = webHelper.getInt("feeTo");

		int sizeFrom = webHelper.getInt("sizeFrom");
		int sizeTo = webHelper.getInt("sizeTo");

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Gallery input = new Gallery();
		input.setRoomtype(room);

		List<Gallery> output = null;
		PageData pageData = null;

		try {
			Gallery.setFromRoom(feeFrom);
			Gallery.setToRoom(feeTo);

			Gallery.setSizeFrom(sizeFrom);
			Gallery.setSizeTo(sizeTo);

			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Gallery.setOffset(pageData.getOffset());
			Gallery.setListCount(pageData.getListCount());

			output = galleryService.getGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("roomtype", room);

//		String param = "?roomtype=" + room + "&feeFrom=" + feeFrom + "&feeTo=" + feeTo;

		return new ModelAndView("main/search");
	}

	/********************************************************************
	 * 찜한방
	 *******************************************************************/
	@RequestMapping(value = "/main/wish.do", method = RequestMethod.GET)
	public ModelAndView wish(Model model) {
		/** 1) 필요한 변수값 생성 */
		int keyword = webHelper.getInt("roomno");// 검색어
		String keyword2 = webHelper.getString("roomtype");// 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Heart input = new Heart();
		Gallery input2 = new Gallery();
		input.setRoomno(keyword);
		input.setRoomtype(keyword2);

		List<Heart> output = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input2);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Room.setOffset(pageData.getOffset());
			Room.setListCount(pageData.getListCount());

			output = heartService.getHeartGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);

		return new ModelAndView("main/wish");
	}

	/********************************************************************
	 * 쉬운방찾기
	 *******************************************************************/
	@RequestMapping(value = "/main/search2.do", method = RequestMethod.GET)
	public ModelAndView search2(Model model) {
		/** 1) 필요한 변수값 생성 */
		int keyword = webHelper.getInt("roomno");// 검색어
		String keyword2 = webHelper.getString("roomtype");// 검색어
		int keyword3 = webHelper.getInt("price");// 검색어
		int keyword4 = webHelper.getInt("deposit");// 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Gallery input = new Gallery();
		input.setRoomno(keyword);
		input.setRoomtype(keyword2);
		input.setPrice(keyword3);
		input.setDeposit(keyword4);

		List<Gallery> output = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Room.setOffset(pageData.getOffset());
			Room.setListCount(pageData.getListCount());

			output = galleryService.getGalleryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);

		return new ModelAndView("main/search");
	}
}