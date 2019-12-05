package project.star.b2.controllers;

import java.util.List;

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
import project.star.b2.model.Address;
import project.star.b2.model.RoomInfo;
import project.star.b2.model.Address.Documents;
import project.star.b2.model.Price;
import project.star.b2.service.ApiKakaoSearchService;
import project.star.b2.service.InfoService;
import project.star.b2.service.PriceService;
import project.star.b2.service.RoomInfoService;
import project.star.b2.service.RoomService;
import retrofit2.Call;
import retrofit2.Retrofit;

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
	RoomInfoService roomInfoService;

	/** Service 패턴 구현체 주입 */
	@Autowired
	RoomService roomService;

	/** Service 패턴 구현체 주입 */
	@Autowired
	InfoService infoService;
	
	@Autowired
	PriceService priceService;

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
	 * 공실 등록하기_ok
	 *******************************************************************/
	@RequestMapping(value = "/host/rm_add_ok.do", method = RequestMethod.POST)
	public ModelAndView rm_add_ok(Model model) {

		/** * * 1) 사용자가 입력한 파라미터 수신 * * */
		
		/***
		 *  Room DB TABLE (15 Columns)
		 *     Column name (param)		description				info
		 *  1.  roomno  				방번호  					(Auto Increment)
		 *  2.  roomtype - o			매물종류
		 *  3.  title - o				매물에 대한 제목
		 *  4.  floor - o 				매물 해당 층
		 *  5.  area - o 				전용면적
		 *  6.  fee - o 				관리비
		 *  7.  confirmdate  			확인날짜  					(초기 데이터 없음)
		 *  8.  address					API에서 받아온 주소 		(Kakao API)
		 *  9.  dong - o				사용자가 입력한 동
		 *  10. ho - o					사용자가 입력한 호
		 *  11. latitude  				API에서 받아온 경도-y축  	(Kakao API)
		 *  12. longitude  				API에서 받아온 위도-x축  	(Kakao API)
		 *  13. region_2depth_name		지도사용 2depth info   	(Kakao API)
		 *  14. region_3depth_name  	지도사용 3depth info   	(Kakao API)
		 *  15. userno 					세션에서 가져올 회원번호	 	(Session에서 값 주입)
		 */
		
		/** room ** parameter 수신 (8 / 15) except(7) - roomno(1), confirmdate(1), address API(5) */
		String roomtype = webHelper.getString("roomtype");			
		String title = webHelper.getString("title");				
		String floor = webHelper.getString("floor");
		int area = webHelper.getInt("area");
		int fee = webHelper.getInt("fee");
		String dong = webHelper.getString("dong");
		String ho = webHelper.getString("ho");
		int userno = 1;	// * 세션이 없기 때문에 임시로 1번 넣기*
		
		
		/***
		 *  Info DB TABLE (15 Columns)
		 *  	Column name(params)		Description			info
		 *  1.  feeitem - o				관리비 항목 			8개 - 2진법 SUM 저장 및 인수분해로 추출
		 *  2.  parking - o				주차 및 주차비 여부 		불가능 - -1 ; 가능 무료 - 0 ; 가능 가격o - int 
		 *  3.  pet - o					애완동물 가능 여부
		 *  4.  elevator - o 			엘리베이터 여부
		 *  5.  veranda - o 			베란다 여부			
		 *  6.  builtin - o 			빌트인 여부				
		 *  7.  optionitem - o			옵션 항목 선택 	 		13개 - 2진법 SUM 저장 및 인수분해로 추출
		 *  8.  loan - o				대출 가능 여부 	
		 *  9.  supplyarea - o			공급면적
		 *  10. maxfloor - o			매물의 전체 층수
		 *  11. heater - o				난방 종류				
		 *  12. commingday - o 			입주가능일				
		 *  13. buildtype - o			건물유형				
		 *  14. content - o				상세 설명
		 *  15. roomno					방 번호				참조키 - room DB 입력시 생성될 PRI값 주입
		 */
		
		/** info ** parameter 수신 (14 / 15) - except(1) roomno(mul) */
		/** 관리비 항목 2진법 계산해서 DB 넣기 */
		String[] feeitem = webHelper.getStringArray("feeitem", null); 		// 관리비항목 계산해서 넣기
		int sum_fee = 0;
		if (feeitem != null) {
			for (String item : feeitem) {
				int bin_fee = Integer.parseInt(item);
					sum_fee += bin_fee;
			}
		} // 끝

		int parking = webHelper.getInt("parking"); 
		String pet = webHelper.getString("pet");
		String elevator = webHelper.getString("elevator");
		String veranda = webHelper.getString("veranda");
		String builtin = webHelper.getString("builtin");
		
		/** 옵션항목 2진법 계산해서 DB 넣기 */
		String[] optionitem = webHelper.getStringArray("optionitem", null);
		int sum_option = 0;
		if (optionitem != null) {
			for (String item : optionitem) {
				int bin_option = Integer.parseInt(item);
					sum_option += bin_option;
			}
		} // 끝
		
		String loan = webHelper.getString("loan");
		int supplyarea = webHelper.getInt("supplyarea");
		int maxfloor = webHelper.getInt("maxfloor");
		String heater = webHelper.getString("heater");
		String commingday = webHelper.getString("commingday");
		String buildtype = webHelper.getString("buildtype");
		String content = webHelper.getString("content");

		/***
		 *  Price DB TABLE (6 Columns)
		 *  	Column name(params)		Description			info
		 *  1.  priceno					가격정보 번호			(Auto Increment)
		 *  3.  dealingtype - o			매물종류				월세-o, 전세-o, 매매-o
		 *  2.  deposit - o				보증금				월세-o, 전세-x, 매매-x  
		 *  4.  price - o 				금액					월세-o, 전세-o, 매매-o
		 *  5.  short_room - o 			단기가능 여부
		 *  6.  roomno 					방번호				참조키 - room DB 입력시 생성될 PRI값 주입
		 */
		/** price ** parameter 수신 */
		String[] dealingtype =  webHelper.getStringArray("dealingtype");
		String[] deposit = webHelper.getStringArray("deposit");
		String[] price = webHelper.getStringArray("price");
		String short_room = webHelper.getString("short_room");
		
		
		
		/** * * 2) 유효성 검사 * * */
		
		/** (1) Room DB 유효성검사 */
		if (title == null) 		{ return webHelper.redirect(null, "매물에대한 제목을 입력해주세요."); } 	// title 검사
		if (floor == null)		{ return webHelper.redirect(null, "해당층을 입력해주세요."); }			// floor 검사
		if (area == 0) 			{ return webHelper.redirect(null, "공급면적을 입력해주세요."); } 			// area 검사
		
		//if (fee == null) { return webHelper.redirect(null, "설명을 입력하세요."); } 					// fee 검사
		
		if (dong == null) 		{ return webHelper.redirect(null, "동을 입력해주세요."); } 				// dong 검사
		if (ho == null)			{ return webHelper.redirect(null, "호를 입력해주세요."); } 				// ho 검사
		
		/** (2) Info DB 유효성검사 */
		
		//if (feeitem == null) { return webHelper.redirect(null, "feeitem을 입력하세요.");} 			// feeitem 검사
		//if (parking == 0) { return webHelper.redirect(null, "설명을 입력하세요."); } 					// parking 검사
		//if (optionitem == null) { return webHelper.redirect(null, "설명을 입력하세요."); } 			// optionitem 검사
		
		if (supplyarea == 0) 	{ return webHelper.redirect(null, "공급면적을 입력해주세요."); } 			// supplyarea 검사
		if (maxfloor == 0) 		{ return webHelper.redirect(null, "전체층 수를 선택해주세요."); }			// maxfloor 검사
		if (commingday == null) { return webHelper.redirect(null, "입주일을 선택해주세요."); } 			// commingday 검사
		if (content == null)	{ return webHelper.redirect(null, "상세설명을 입력해주세요."); } 			// content 검사
		
		/** (3) Price DB 유효성검사 */
		if (dealingtype == null){ return webHelper.redirect(null, "매물종류를 선택해주세요."); } 			// 매물종류 검사
		if (deposit == null) 	{ return webHelper.redirect(null, "보증금을 입력해주세요."); }			// 보증금 검사
		if (price == null) 		{ return webHelper.redirect(null, "가격을 입력해주세요."); } 				// 가격 검사
		


		/** * * 3) 데이터 저장하기 * * */
		RoomInfo input = new RoomInfo();
		
		/** (1) room 정보 받아오기 */
		input.setRoomtype(roomtype);
		input.setTitle(title);
		input.setFloor(floor);
		input.setArea(area);
		input.setFee(fee);
		input.setDong(dong);
		input.setHo(ho);
		input.setUserno(userno);
		
		/*** 
		 * KakaoSearch API 통해 주소정보 5가지 - (위도, 경도, 2depth, 3depth, road_address) 수신 및 쓰기
		 */
		
		/** 1. API 연동 객체 생성 */
		Retrofit retrofit = retrofitHelper.getRetrofit(ApiKakaoSearchService.BASE_URL);
		ApiKakaoSearchService apiKakaoSearchService = retrofit.create(ApiKakaoSearchService.class);

		/** 2. 파라미터 처리 */
		String query = webHelper.getString("address", "");

		/** 3. KAKAO API 요청 */
		Address kakaoAddress = null;
		if (!query.equals("")) {
			Call<Address> call = apiKakaoSearchService.getAddress(query);
			try {
				kakaoAddress = call.execute().body();
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<Documents> list = kakaoAddress.getDocuments();

			for (Documents item : list) {
				input.setAddress(item.getRoad_address().getAddress_name());
				input.setRegion_2depth_name(item.getRoad_address().region_2depth_name);
				input.setRegion_3depth_name(item.getRoad_address().region_3depth_name);
				input.setLongitude(Double.parseDouble(item.getRoad_address().x));
				input.setLatitude(Double.parseDouble(item.getRoad_address().y));
			}
		}
		/***
		 * KakaoSearch API End
		 */
		
		
		/** (2) info정보 받아오기 */
		input.setFeeitem(sum_fee);
		
		// 주차가능 체크박스에 체크되어 있다면? 금액정보를 가져와 인풋
		if(parking == 1) {
			parking = webHelper.getInt("parking_val");
		}
		
		input.setParking(parking);
		input.setPet(pet);
		input.setElevator(elevator);
		input.setVeranda(veranda);
		input.setBuiltin(builtin);
		input.setOptionitem(sum_option);
		input.setLoan(loan);
		input.setSupplyarea(supplyarea);
		input.setMaxfloor(maxfloor);
		input.setHeater(heater);
		input.setCommingday(commingday);
		input.setBuildtype(buildtype);
		input.setContent(content);
		
		
		/** * * 4) DB 저장하기 * * */
			
			
		/** 1. room DB, info DB 데이터 저장 */
		try {
			roomInfoService.addRoomInfo(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 2. price DB 데이터 저장 */
		try {
			
			Price input_p = new Price();
				
			int deposit_temp = 0;
			int price_temp = 0;
			
			for (int i = 0; i < deposit.length; i++) {
				deposit_temp = 0;
				price_temp = Integer.parseInt(price[i]);

				if (deposit[i] != null || deposit[i] != "") {
					deposit_temp = Integer.parseInt(deposit[i]);
				}

				input_p.setDeposit(deposit_temp);
				input_p.setDealingtype(dealingtype[i]);
				input_p.setPrice(price_temp);
				input_p.setShort_room(short_room);
				input_p.setRoomno(1);

				priceService.addPrice(input_p);
			}
				
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		
		/** * * 5) 결과를 확인하기 위한 페이지 이동 * * */
		String redirectUrl = contextPath + "/roominfo/view.do?roomno=" + input.getRoomno();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
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
