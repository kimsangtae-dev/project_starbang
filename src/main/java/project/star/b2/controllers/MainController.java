package project.star.b2.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import project.star.b2.helper.DownloadHelper;
import project.star.b2.helper.PageData;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Filter;
import project.star.b2.model.Gallery;
import project.star.b2.model.Heart;
import project.star.b2.model.Popular;
import project.star.b2.model.Room;
import project.star.b2.model.User;
import project.star.b2.service.GalleryService;
import project.star.b2.service.HeartService;
import project.star.b2.service.RoomService;

@Slf4j
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
	 * 상세페이지 (rmdt 쿠키 다중 저장)
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

		for (int i = 0; i < 50; i++) {
			String result = webHelper.getCookie("cookiesName" + i, "0");

			if (result.equals("0")) {

				Cookie cookie = new Cookie("cookiesName" + i, roomno); // 저장할 쿠키 생성
				cookie.setPath("/"); // 쿠키의 유효 경로
				cookie.setDomain("localhost"); // 쿠키의 유효 도메인

				if (roomno.equals("")) { // 쿠키 시간을 설정하지 않으면 브라우저가 동작하는 동안 유효
					cookie.setMaxAge(0); // 쿠키 설정시간이 0이면 즉시 삭제
				} else {
					cookie.setMaxAge(1800); // 값이 있다면 60초 동안 쿠키 저장
				}

				response.addCookie(cookie);

				/** 2) Spring방식의 페이지 이동. */
				// Servlet의 response.sendRedirect(url)과 동일
				// --> "/"부터 시작할 경우 ContextPath는 자동으로 앞에 추가된다.
				return "redirect:/main/rmdt.do?roomno=" + roomno;
			}
		}
		return "redirect:/main/rmdt.do?roomno=" + roomno;
	}

	/********************************************************************
	 * 최근 본 방
	 *******************************************************************/
	@RequestMapping(value = "/main/rtrm.do", method = RequestMethod.GET)
	public ModelAndView rtrm(Model model, HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();
		String result = "";
		int [] ar = new int[50];

		// 쿠키가 있는 만큼 반복문을 돌려서 조회한다.
		for (int i = 0; i < cookies.length; i++) {
			// i번째 쿠키의 이름을 취득한다.
			String cookieName = cookies[i].getName();

			if (cookieName.equals("cookiesName" + i)) {
				// 쿠키값을 취득한다.
				String value = cookies[i].getValue();
				// 저장된 값의 문자열 길이가 0보다 크다면?
				if (value.length() > 0) {
					// 인코딩된 값이므로 디코딩 처리하여 원래값으로 복원한다.
					try {
						result = URLDecoder.decode(value, "utf-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				int newRoomNo = Integer.parseInt(result);
				ar[i] = newRoomNo;
				log.debug("쿠키배열:" + ar[i]);
				
				/** 2)데이터 조회하기 */
				// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
				Gallery input = new Gallery();
				input.setRoomno(ar[i]);

				List<Gallery> output = null;

				try {
					// 쿠키로 저장된 방번호로 조회
					output = galleryService.getCookieList(input);
				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			}
		} // end for
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

		/******** 필터 ********/
		/** 방 종류(roomtype) */
		String room = webHelper.getString("roomtype");
		/** 매물 종류(dealingtype) */
		/** 보증금/전세가(deposit/price) */
		int depositFrom = webHelper.getInt("depositFrom");
		int depositTo = webHelper.getInt("depositTo", 999999);
		/** 월세(price) */
		int monthFrom = webHelper.getInt("monthFrom");
		int monthTo = webHelper.getInt("monthTo", 999999);
		/** 매매 (price) */
		int buyingFrom = webHelper.getInt("buyingFrom");
		int buyingTo = webHelper.getInt("buyingTo");
		/** 관리비(fee) */
		int feeFrom = webHelper.getInt("feeFrom");
		int feeTo = webHelper.getInt("feeTo", 999999);
		/** 방 크기(area) */
		int sizeFrom = webHelper.getInt("sizeFrom");
		int sizeTo = webHelper.getInt("sizeTo", 999999);

		String dealingtype = webHelper.getString("dealingtype");
		String region_2depth_name = webHelper.getString("region_2depth_name");

		Filter filter = new Filter();
		// 보증금/전세
		filter.setDepositFrom(depositFrom);
		filter.setDepositTo(depositTo);
		// 월세
		filter.setMonthFrom(monthFrom);
		filter.setMonthTo(monthTo);
		// 매매
		filter.setBuyingFrom(buyingFrom);
		filter.setBuyingTo(buyingTo);
		// 관리비
		filter.setFeeFrom(feeFrom);
		filter.setFeeTo(feeTo);
		// 방크기
		filter.setSizeFrom(sizeFrom);
		filter.setSizeTo(sizeTo);
		if (sizeTo == 99999) {
			filter.setSizeTo(115);
		}

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Gallery input = new Gallery();
		input.setRoomtype(room);
		input.setDealingtype(dealingtype);
		input.setRegion_2depth_name(region_2depth_name);

		List<Gallery> output = null;
		PageData pageData = null;

		try {
			Gallery.setDepositFrom(depositFrom);
			Gallery.setDepositTo(depositTo);

			Gallery.setMonthFrom(monthFrom);
			Gallery.setMonthTo(monthTo);

			Gallery.setBuyingFrom(buyingFrom);
			Gallery.setBuyingTo(buyingTo);

			Gallery.setFeeFrom(feeFrom);
			Gallery.setFeeTo(feeTo);

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
		model.addAttribute("param", filter);

		return new ModelAndView("main/search");
	}

	/********************************************************************
	 * 찜한방
	 *******************************************************************/
	@RequestMapping(value = "/main/wish.do", method = RequestMethod.GET)
	public ModelAndView wish(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
        User loginInfo = (User) session.getAttribute("loginInfo");

		/** 1) 필요한 변수값 생성 */
        int userno = loginInfo.getUserno();
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
		input.setUserno(userno);
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

	/********************************************************************
	 * 테스트
	 *******************************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/test_check", method = RequestMethod.POST)
	public List<String> post(Model model, @RequestParam(value = "valueArrTest[]") List<String> valueArr) {
		// 파라미터값을 View에게 전달한다.
		model.addAttribute("valueArr", valueArr);

		return (List<String>) new ModelAndView("main/search");
	}

}