package project.star.b2.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.PageData;
import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Room;
import project.star.b2.service.RoomService;
import project.star.b2.service.UserService;

@RestController
public class AdminRestController {
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
	
	@RequestMapping(value = "/professor3", method = RequestMethod.GET)
	public Map<String, Object> rmli() {
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
			output = roomService.getRoomList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3)View 처리 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item", output);
		data.put("pageData", pageData);

		return webHelper.getJsonData(data);
	}
}
