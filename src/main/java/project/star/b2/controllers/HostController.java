package project.star.b2.controllers;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.RetrofitHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.Address;
import project.star.b2.model.Address.Documents;
import project.star.b2.model.Info;
import project.star.b2.model.Price;
import project.star.b2.model.Room;
import project.star.b2.model.UploadItem;
import project.star.b2.model.User;
import project.star.b2.service.ApiKakaoSearchService;
import project.star.b2.service.RIPService;
import project.star.b2.service.UploadService;
import retrofit2.Call;
import retrofit2.Retrofit;

@Slf4j
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
	RIPService ripService;
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	UploadService uploadService;


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
	public ModelAndView rm_add(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
        User loginInfo = (User) session.getAttribute("loginInfo");
        if (loginInfo == null) {
        
        	return webHelper.redirect(null, "로그인 후 방등록이 가능합니다.");
        	
        }

		return new ModelAndView("host/rm_add");
	}
	
	/********************************************************************
	 * 상세 페이지 보기
	 *******************************************************************/
	@RequestMapping(value = "/host/roominfo/view.do", method = RequestMethod.GET)
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
			output1 = ripService.getRoomItem(input1);
			output2 = ripService.getInfoItem(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		
		return new ModelAndView("host/roominfo/view"); 
	}

	/********************************************************************
	 * 공실 등록하기_ok
	 * @return 
	 *******************************************************************/
	@RequestMapping(value = "/host/rm_add_ok.do", method = RequestMethod.POST)
	public ModelAndView put3(HttpServletRequest request) {
		
		
		try {
			webHelper.upload();
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<UploadItem> fileList = webHelper.getFileList();
		Map<String, String> paramMap = webHelper.getParamMap();
		
		
		/** * * 1) 사용자가 입력한 파라미터 수신 * * */
		
		/***
		 *  Room DB TABLE (15 Columns)
		 *     Column name(param)		description				info
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
		
		/** room ** parameter 수신 (8 / 15) except(7) - roomno(1)- PRI, confirmdate(1), address API(5) */
		String roomtype = paramMap.get("roomtype");			
		String title = paramMap.get("title");				
		int floor = Integer.parseInt(paramMap.get("floor"));
		float area = Float.parseFloat(paramMap.get("area"));
		int fee = Integer.parseInt(paramMap.get("fee"));
		String dong = paramMap.get("dong");
		String ho = paramMap.get("ho");

		HttpSession session = request.getSession();
        User loginInfo = (User) session.getAttribute("loginInfo");
        int userno = loginInfo.getUserno();
        
        
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
        
        /** info ** parameter 수신 (14 / 15) - except(1) roomno - mul */
		/** 관리비 항목 2진법 계산해서 DB 넣기 */
		int parking = Integer.parseInt(paramMap.get("parking")); 
		int pet = Integer.parseInt(paramMap.get("pet"));
		int elevator = Integer.parseInt(paramMap.get("elevator"));
		int veranda = Integer.parseInt(paramMap.get("veranda"));
		int builtin = Integer.parseInt(paramMap.get("builtin"));
		
		/** 옵션항목 2진법 계산해서 DB 넣기 */
		// feeitem
		String feeitem = paramMap.get("feeitem"); 		// 관리비항목 계산해서 넣기

		log.debug("로그기록임!!" + feeitem);
		log.error(feeitem);
		log.info(feeitem);
		
		String[] feeitems = null;
		if (feeitem != null) {
			feeitems = feeitem.split(",");
		}
		
		int sum_fee = 0;
		if (feeitems != null) {
			for (String item : feeitems) {
				int bin_fee = Integer.parseInt(item);
					sum_fee += bin_fee;
			}
		}
		
		// optionitem
		String optionitem = paramMap.get("optionitem");

		String[] optionitems = null;
		if (optionitem != null) {
			optionitems = optionitem.split(",");
		}
		
		int sum_option = 0;
		if (optionitems != null) {
			for (String item : optionitems) {
				int bin_option = Integer.parseInt(item);
					sum_option += bin_option;
			}
		}
		
		int loan = Integer.parseInt(paramMap.get("loan"));
		float supplyarea = Float.parseFloat(paramMap.get("supplyarea"));
		int maxfloor = Integer.parseInt(paramMap.get("maxfloor"));
		int heater = Integer.parseInt(paramMap.get("heater"));
		String commingday = paramMap.get("commingday");
		String buildtype = paramMap.get("buildtype");
		String content = paramMap.get("content");
		
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
		String dealingtype = paramMap.get("dealingtype");
		String deposit = paramMap.get("deposit");
		String price = paramMap.get("price");
		String short_room = paramMap.get("short_room");
		
		String[] dealingtypes = null; 
		String[] deposits = null;
		String[] prices = null;
		
		if (dealingtype != null) { dealingtypes = dealingtype.split(","); }
		if (deposit != null) 	 { deposits = deposit.split(","); }
		if (price != null) 		 { prices = price.split(","); }
		
		
		/** * * 3) 데이터 저장하기 * * */
		Room input_R = new Room();
		Info input_I = new Info();
		
		/** (1) room 정보 받아오기 */
		input_R.setRoomtype(roomtype);
		input_R.setTitle(title);
		input_R.setFloor(floor);
		input_R.setArea(area);
		input_R.setFee(fee);
		input_R.setDong(dong);
		input_R.setHo(ho);
		input_R.setUserno(userno);
		
		/*** 
		 * KakaoSearch API 통해 주소정보 5가지 - (위도, 경도, 2depth, 3depth, road_address) 수신 및 쓰기
		 */
		
		/** 1. API 연동 객체 생성 */
		Retrofit retrofit = retrofitHelper.getRetrofit(ApiKakaoSearchService.BASE_URL);
		ApiKakaoSearchService apiKakaoSearchService = retrofit.create(ApiKakaoSearchService.class);

		/** 2. 파라미터 처리 */
		
		String query = paramMap.get("address");

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
				input_R.setAddress(item.getRoad_address().getAddress_name());
				input_R.setRegion_2depth_name(item.getRoad_address().region_2depth_name);
				input_R.setRegion_3depth_name(item.getRoad_address().region_3depth_name);
				input_R.setLongitude(Double.parseDouble(item.getRoad_address().x));
				input_R.setLatitude(Double.parseDouble(item.getRoad_address().y));
			}
		}
		
		/***
		 * KakaoSearch API End
		 */
		
		/** (2) info정보 받아오기 */
		input_I.setFeeitem(sum_fee);
		
		// 주차가능 체크박스에 체크되어 있다면? 금액정보를 가져와 인풋
		if(parking == 1) {
			parking = webHelper.getInt("parking_val");
		}
		
		input_I.setParking(parking);
		input_I.setPet(pet);
		input_I.setElevator(elevator);
		input_I.setVeranda(veranda);
		input_I.setBuiltin(builtin);
		input_I.setOptionitem(sum_option);
		input_I.setLoan(loan);
		input_I.setSupplyarea(supplyarea);
		input_I.setMaxfloor(maxfloor);
		input_I.setHeater(heater);
		input_I.setCommingday(commingday);
		input_I.setBuildtype(buildtype);
		input_I.setContent(content);
		
		
		
		/** * * 4) DB 저장하기 * * */

		/** 1. room DB, info DB 데이터 저장 */
		 
		try {
			ripService.addRoom(input_R);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		try {
			input_I.setRoomno(input_R.getRoomno());
			ripService.addInfo(input_I);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		/** 2. price DB 데이터 저장 */
		try {
			
			Price input_p = new Price();
			int deposit_temp = 0;
			int price_temp = 0;
			
			for (int i = 0; i < deposits.length; i++) {
				price_temp = Integer.parseInt(prices[i]);
				
				if (deposits[i] != null || deposits[i] != "") {
					deposit_temp = Integer.parseInt(deposits[i]);
				}
				
				if (prices[i] != null || prices[i] != "") {
					price_temp = Integer.parseInt(prices[i]);
				}
				
				input_p.setDeposit(deposit_temp);
				input_p.setDealingtype(dealingtypes[i]);
				input_p.setPrice(price_temp);
				input_p.setShort_room(short_room);
				input_p.setRoomno(input_R.getRoomno());

				ripService.addPrice(input_p);
			}
				
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/**
		 * UPLOAD 
		 */

		// 조회결과의 Beans에 추가 후 로그를 통해 내역 확인
		for (UploadItem item : fileList) {
			
			item.setFieldName(item.getFieldName());
			item.setOriginName(item.getOriginName());
			item.setFilePath(item.getFilePath());
			item.setContentType(item.getContentType());
			item.setFileSize(item.getFileSize());
			item.setFileName(item.getFileName());
			item.setRegDate(item.getRegDate());
			item.setEditDate(item.getEditDate());
			item.setRoomno(input_R.getRoomno());
			log.debug("업로드 될 항목" + item.toString());

			// DB에 저장하기
			try {
				uploadService.addUploadItem(item);
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				e.printStackTrace();
				return webHelper.redirect(null, e.getLocalizedMessage());
			}	
		}//end for	
		
		String redirectUrl = contextPath + "/host/roominfo/view.do?roomno=" + input_R.getRoomno();
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
