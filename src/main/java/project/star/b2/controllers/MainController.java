package project.star.b2.controllers;

import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import project.star.b2.helper.CookieUtils;
import project.star.b2.helper.DownloadHelper;
import project.star.b2.helper.PageData;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Filter;
import project.star.b2.model.Gallery;
import project.star.b2.model.Heart;
import project.star.b2.model.Info;
import project.star.b2.model.Popular;
import project.star.b2.model.Price;
import project.star.b2.model.Room;
import project.star.b2.model.UploadItem;
import project.star.b2.model.User;
import project.star.b2.service.GalleryService;
import project.star.b2.service.HeartService;
import project.star.b2.service.InfoService;
import project.star.b2.service.PriceService;
import project.star.b2.service.RoomService;
import project.star.b2.service.UploadService;
import project.star.b2.service.UserService;

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
	InfoService infoService;
	@Autowired
	PriceService priceService;
	@Autowired
	UploadService uploadService;
	@Autowired
	GalleryService galleryService;
	@Autowired
	GalleryService gallerypopularService;
	@Autowired
	HeartService heartService;
	@Autowired
    UserService userService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/********************************************************************
	 * 메인
	 *******************************************************************/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Model model,HttpServletRequest request) {
		/*---세션 불러오기 ----*/
		HttpSession session = request.getSession();
        User loginInfo = (User) session.getAttribute("loginInfo");
        /*----------------------*/
		/** 1)필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한 페이지당 표시할 목록 수
		int pageCount = 1; // 한 그룹당 표시할 페이지 번호 수

		/** 2)데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Popular input = new Popular();
		Heart input2 = new Heart();

		List<Popular> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;
		List<Heart> output2 = null;

		try {
			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Popular.setOffset(pageData.getOffset());
			Popular.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = galleryService.getPopularGalleryList(input); //인기있는 방
			output2 = heartService.getHeartGalleryList(input2); //찜한방
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("logininfo", loginInfo);

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
	public ModelAndView rmdt(Model model, 
			@RequestParam(value = "roomno", defaultValue = "") int roomno) {
		
		Room input_room = new Room();
		input_room.setRoomno(roomno);
		
		Info input_info = new Info();
		input_info.setRoomno(roomno);
		
		Price input_price = new Price();
		input_price.setRoomno(roomno);
		
		UploadItem input_image = new UploadItem();
		input_image.setRoomno(roomno);
		
		Room output_room = null;
		Info output_info = null;
		List<Price> output_price = null;
		List<UploadItem> output_image = null;
		
		try {
			
			output_room = roomService.getRoomItem(input_room);
			log.info("성공 roomService");
			
			output_info = infoService.getInfoItem(input_info);
			log.info("성공 infoService");
			
			output_price = priceService.getPriceList_by_roomno(input_price);
			log.info("성공 priceService");
			
			output_image = uploadService.getImageList_by_roomno(input_image);
			log.info("성공 uploadService");
			
		} catch(Exception e) {
			
			log.debug("방 조회에 실패하였습니다.");
			log.error(e.getLocalizedMessage());
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		/** view 화면으로 보여주기 */
		model.addAttribute("room", output_room);
		model.addAttribute("info", output_info);
		model.addAttribute("price", output_price);
		model.addAttribute("img", output_image);
		
		
		return new ModelAndView("main/rmdt");
	}

	/********************************************************************
	 * 상세페이지 (rmdt 쿠키 다중 저장)
	 *******************************************************************/
	@RequestMapping(value = "/main/rmdtsave.do", method = RequestMethod.GET)
	public String rmdtsave(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "roomno", defaultValue = "") String roomno) {

		if (!roomno.equals("")) {
			try {
				roomno = URLEncoder.encode(roomno, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		try {
			CookieUtils.setYummy("cookieName", roomno, 1, request, response);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/main/rmdt.do?roomno=" + roomno;
	}

	/********************************************************************
	 * 최근 본 방 (쿠키불러와서 view로 보여줌)
	 *******************************************************************/
	@RequestMapping(value = "/main/rtrm.do", method = RequestMethod.GET)
	public ModelAndView rtrm(Model model, HttpServletRequest request) {
		/*---세션 불러오기 ----*/
		HttpSession session = request.getSession();
        User loginInfo = (User) session.getAttribute("loginInfo");
        /*----------------------*/

		List<String> list = null;

		try {
			list=CookieUtils.getValueList("cookieName", request);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		/** 2)데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		List<Gallery> output = null;

		try {
			// 쿠키로 저장된 방번호로 조회
			output = galleryService.getCookieList(list);
		} catch (Exception e) {
			return new ModelAndView("main/rtrm");
		}

		/** view 화면으로 보여주기 */
		model.addAttribute("output", output);
		model.addAttribute("loginInfo", loginInfo);
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
		int buyingTo = webHelper.getInt("buyingTo", 999999);
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
		if (sizeTo == 999999) {
			filter.setSizeTo(115);
		} else {
			filter.setSizeTo(sizeTo);			
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
	 * 비밀번호 찾기
	 *******************************************************************/
	@RequestMapping(value = "main/repwd.do")
	public String repwd(Model model, HttpServletRequest request) {
	    
	    /** pwd에서 입력한 이메일 세션 생성*/
	    HttpSession session = request.getSession();
	    String email = (String) session.getAttribute("fullemail");
	    System.out.println("-------------------------" + email + "------------------------");
	     
	    model.addAttribute("fullemail", email);
	    session.invalidate();
	      
	    return "main/repwd";
	}
	   
	/********************************************************************
	 * 비밀번호 찾기 ok
	 *******************************************************************/
	   
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "main/repwd_ok.do", method = RequestMethod.POST)
	public ModelAndView edit(Model model) {

	/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
	String passwd = webHelper.getString("passwd");
	String email = webHelper.getString("email");

	if (passwd == null) {
	   return webHelper.redirect(null, "비밀번호를 입력하세요.");
	}

	/** 2) 데이터 수정하기 */
	// 수정할 값들을 Beans에 담는다.
	User input = new User();
	input.setPasswd(passwd);
	input.setEmail(email);

	try {
		try {
	    	// 일반회원 데이터 수정
	    	userService.getPassword(input);

	    	/** 3) 결과를 확인하기 위한 페이지 이동 */
	        return webHelper.redirect("/b2", "수정되었습니다.");
	    } catch (Exception e) {
	        e.getLocalizedMessage();
	            return webHelper.redirect(null, e.getLocalizedMessage());
	        }
	} catch (Exception e) {
	        return webHelper.redirect(null, e.getLocalizedMessage());
	     	}
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