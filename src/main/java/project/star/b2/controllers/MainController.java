package project.star.b2.controllers;

import java.io.PrintStream;
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
	 * @throws UnsupportedEncodingException
	 *******************************************************************/
	@RequestMapping(value = "/main/rmdtsave.do", method = RequestMethod.GET)
	public void rmdtsave(HttpServletResponse response,HttpServletRequest request,
	@RequestParam(value = "roomno", defaultValue = "") String roomno) throws UnsupportedEncodingException {

		List<String> list = getValueList(roomno, request);
		String sumValue = "";
		int equalsValueCnt = 0;

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				sumValue += list.get(i) + ",";
				if (list.get(i).equals(roomno)) {
					equalsValueCnt++;
				}
			}
			if (equalsValueCnt != 0) { // 같은 값을 넣으려고 할 때의 처리
				if (sumValue.substring(sumValue.length() - 1).equals(",")) {
					sumValue = sumValue.substring(0, sumValue.length() - 1);
				}
			} else {
				sumValue += roomno;
			}
		} else {
			sumValue = roomno;
		}

		if (!sumValue.equals("")) {
			Cookie cookie = new Cookie("cookiesName", URLEncoder.encode(sumValue, "utf-8"));
			cookie.setMaxAge(60 * 60 * 24 * 1);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	}

	/********************************************************************
	 * 최근 본 방
	 *******************************************************************/
	@RequestMapping(value = "/main/rtrm.do", method = RequestMethod.GET)
	public List<String> getValueList(String roomno, HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();
		String[] cookieValues = null;
		String value = "";
		List<String> list = null;

		// 특정 key의 쿠키값을 ","로 구분하여 String 배열에 담아준다.
		// ex) 쿠키의 key/value ---> key = "clickItems", value = "211, 223, 303"(상품 번호)
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookiesName" + i)) {
					value = cookies[i].getValue();
					try {
						cookieValues = (URLDecoder.decode(value, "utf-8")).split(",");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					break;
				}
			}
		}

		// String 배열에 담겼던 값들을 List로 다시 담는다.
		if (cookieValues != null) {
			list = new ArrayList<String>(Arrays.asList(cookieValues));

			if (list.size() > 50) { // 값이 50개를 초과하면, 최근 것 50개만 담는다.
				int start = list.size() - 50;
				List<String> copyList = new ArrayList<String>();
				for (int i = start; i < list.size(); i++) {
					copyList.add(list.get(i));
				}
				list = copyList;
			}
		}
		return list;
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