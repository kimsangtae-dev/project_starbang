package project.star.b2.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.star.b2.helper.PageData;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Filter;
import project.star.b2.model.Gallery;
import project.star.b2.model.Gu;
import project.star.b2.model.Heart;
import project.star.b2.model.User;
import project.star.b2.service.GalleryService;
import project.star.b2.service.RoomService;

@RestController
public class GalleryRestController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	@Autowired
	GalleryService galleryService;
	@Autowired
	RoomService roomService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** --------구 별 이름,위경도,매물개수에 대한 json을 위한 페이지-------- */
	@RequestMapping(value = "/assets/guposition", method = RequestMethod.GET)
	public Map<String, Object> get_list() {
		String[] name = { "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
				"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" };
		double[] lat = { 37.4959854, 37.5492077, 37.6469954, 37.5657617, 37.4653993, 37.5481445, 37.4954856, 37.4600969,
				37.655264, 37.6658609, 37.5838012, 37.4965037, 37.5622906, 37.5820369, 37.4769528, 37.5506753,
				37.606991, 37.5048534, 37.5270616, 37.520641, 37.5311008, 37.6176125, 37.5990998, 37.5579452,
				37.5953795 };
		double[] lng = { 127.0664091, 127.1464824, 127.0147158, 126.8226561, 126.9438071, 127.0857528, 126.858121,
				126.9001546, 127.0771201, 127.0317674, 127.0507003, 126.9443073, 126.9087803, 126.9356665, 127.0378103,
				127.0409622, 127.0232185, 127.1144822, 126.8561534, 126.9139242, 126.9810742, 126.9227004, 126.9861493,
				126.9941904, 127.0939669 };

		List<Gu> guPositions = new ArrayList<Gu>();
		int output = 0;

		for (int i = 0; i < name.length; i++) {
			try {
				output = galleryService.getGalleryGuCount(name[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
			guPositions.add(new Gu(name[i], lat[i], lng[i], output));
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("guPositions", guPositions);

		return webHelper.getJsonData(data);
	}

	/** --------지도에 매물을 보여주기 위한 json-------- */
	@RequestMapping(value = "/assets/roomposition", method = RequestMethod.GET)
	public Map<String, Object> getPositionlist() {
		List<Gallery> output = null;

		try {
			output = galleryService.getRoomPositionList(null);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("output", output);

		return webHelper.getJsonData(data);
	}

	/********************************************************************
	 * 방찾기
	 *******************************************************************/
	@RequestMapping(value = "/main/search", method = RequestMethod.GET)
	public Map<String, Object> search(HttpServletRequest request) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", "");// 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 24; // 한 페이지당 표시할 목록 수
		int pageCount = 7; // 한 그룹당 표시할 페이지 번호 수
		
		/*---세션 불러오기 ----*/
        HttpSession session = request.getSession();
        User loginInfo = (User) session.getAttribute("loginInfo");
        int userno = 0;
        if (loginInfo != null) {
            userno = loginInfo.getUserno();
        }

		/******** 필터 ********/
		/** 방 종류(roomtype) */
		String room = webHelper.getString("roomtype");
		/** 거래 종류(dealingtype) */
		String dealingtype = webHelper.getString("dealingtype");
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

		String region_2depth_name = webHelper.getString("region_2depth_name");

		/** 방 종류(roomtype) list */
		 List<String> roomtypepate = new ArrayList<String>(); 
		 String[] roomto = room.split("m"); 
		 for (int i = 0; i < roomto.length ; i++) {
		 roomtypepate.add(roomto[i]); }
		 
		/** 거래 종류(dealingtype) list */
		List<String> dealingtypepate = new ArrayList<String>(); String[]
		dealingtypeto = dealingtype.split("m"); 
		for (int i = 0; i < dealingtypeto.length ; i++) { dealingtypepate.add(dealingtypeto[i]); }

		/** 지도 매물위치 필터링 */
		double west = webHelper.getDouble("west");
		double east = webHelper.getDouble("east");
		double south = webHelper.getDouble("south");
		double north = webHelper.getDouble("north");
		
		Heart input_heart = new Heart();
		input_heart.setUserno(userno);
		List<Heart> heartlist = null;

		Filter filter = new Filter();
		// 방종류 
		filter.setRoomtype(roomtypepate);
		// 거래종류 
		filter.setDealingtype(dealingtypepate);
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
			Gallery.setRoomTypePate(roomtypepate);
			Gallery.setDealingTypePate(dealingtypepate);

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

			Gallery.setWest(west);
			Gallery.setEast(east);
			Gallery.setSouth(south);
			Gallery.setNorth(north);

			// 전체 게시글 수 조회
			totalCount = galleryService.getGalleryCount(input);
			// 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Gallery.setOffset(pageData.getOffset());
			Gallery.setListCount(pageData.getListCount());

			if (userno != 0) { heartlist = galleryService.getHeartList(input_heart); }
			
			output = galleryService.getGalleryList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** View 처리 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("output", output);
		data.put("pageData", pageData);
		data.put("totalCount", totalCount);
		data.put("param", filter);
		data.put("heart", heartlist);

		return webHelper.getJsonData(data);
	}
}
