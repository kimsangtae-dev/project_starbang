package project.star.b2.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.CookieUtils;
import project.star.b2.helper.PageData;
import project.star.b2.helper.WebHelper;
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

@RestController
public class MainRestController {
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
	UserService	userService;
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
	
	/** 상세 페이지*/
	@RequestMapping(value ="/professor", method = RequestMethod.GET)
	public Map<String, Object>get_list(HttpServletRequest request){
	HttpSession session = request.getSession();
    User loginInfo = (User) session.getAttribute("loginInfo");
	/** 1)필요한 변수값 생성 */
	int userno = loginInfo.getUserno();
	String keyword = webHelper.getString("keyword", ""); // 검색어
	int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
	int totalCount = 0; // 전체 게시글 수
	int listCount = 4; // 한 페이지당 표시할 목록 수
	int pageCount = 1; // 한 그룹당 표시할 페이지 번호 수

	
	/** 2)데이터 조회하기 */
	// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
	Heart input = new Heart();
	input.setUserno(userno);

	List<Heart> output = null; // 조회결과가 저장될 객체
	PageData pageData = null;

	try {
		// 전체 게시글 수 조회
		totalCount = heartService.getHeartGalleryCount(input);
		// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
		pageData = new PageData(nowPage, totalCount, listCount, pageCount);

		// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
		Heart.setOffset(pageData.getOffset());
		Heart.setListCount(pageData.getListCount());
		// 데이터 조회하기
		output = heartService.getHeartGalleryList(input);
	} catch (Exception e) {
		return webHelper.getJsonError(e.getLocalizedMessage());
	}

	/** 3)Json 출력 하기  */
	Map<String, Object>data = new HashMap<String, Object>();
	data.put("keyword",keyword);
	data.put("item",output);
	data.put("meta",pageData);
	
	return webHelper.getJsonData(data);
}
	/********************************************************************
	 * 쿠키로 보는 최근 본방
	 *******************************************************************/
	@RequestMapping(value ="/professor2", method = RequestMethod.GET)
	public Map<String, Object>get_list2(HttpServletRequest request){
	int totalCount = 0; // 전체 게시글 수
	int listCount = 4; // 한 페이지당 표시할 목록 수
	int pageCount = 1; // 한 그룹당 표시할 페이지 번호 수
	int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
	
	List<String> list = null;
	PageData pageData = null;

	try {
				// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);

				// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
				Heart.setOffset(pageData.getOffset());
				Heart.setListCount(pageData.getListCount());
				// 데이터 조회하기
		list=CookieUtils.getValueList("cookieName", request);
	} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
	}
	/** 2)데이터 조회하기 */
	// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
	List<Gallery> output = null;

	try {
		// 쿠키로 저장된 방번호로 조회
		Collections.reverse(list);
		output = galleryService.getCookieMainList(list);
	} catch (Exception e) {
		return webHelper.getJsonError(e.getLocalizedMessage());
	}

	/** view 화면으로 보여주기 */
	Map<String, Object>data = new HashMap<String, Object>();
	data.put("item",output);
	data.put("meta",pageData);
	
	return webHelper.getJsonData(data);
}
	/********************************************************************
	 * AJAX로 보는 인기있는 방
	 *******************************************************************/
	@RequestMapping(value ="/famous", method = RequestMethod.GET)
	public Map<String, Object>get_list3(HttpServletRequest request){
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
			totalCount = galleryService.getGalleryCount2(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Popular.setOffset(pageData.getOffset());
			Popular.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = galleryService.getPopularGalleryList(input);
	} catch (Exception e) {
		return webHelper.getJsonError(e.getLocalizedMessage());
	}

	/** 3)Json 출력 하기  */
	Map<String, Object>data = new HashMap<String, Object>();
	data.put("keyword",keyword);
	data.put("item",output);
	data.put("meta",pageData);
	
	return webHelper.getJsonData(data);
}
	/********************************************************************
	 * AJAX로 차트값 가져오기
	 *******************************************************************/
	@RequestMapping(value ="/chart", method = RequestMethod.GET)
	public Map<String, Object>get_chart(HttpServletRequest request){
		int newRoomno = webHelper.getInt("chartdata");

		Info input_info = new Info();
		input_info.setRoomno(newRoomno);

		Info output_info = null;


		try {
			output_info = infoService.getInfoItem(input_info);


		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());

		}


	/** 3)Json 출력 하기  */
	Map<String, Object>data = new HashMap<String, Object>();
	data.put("item",output_info);
	
	return webHelper.getJsonData(data);
}
}
