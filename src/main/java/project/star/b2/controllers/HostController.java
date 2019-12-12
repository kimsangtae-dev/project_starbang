package project.star.b2.controllers;


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
import project.star.b2.model.Info;
import project.star.b2.model.Room;
import project.star.b2.service.RIPService;


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
		
		/**
		 * UPLOAD 
		 */
		log.info("업로드 전");
		// 조회결과의 Beans에 추가 후 로그를 통해 내역 확인
		
		List<UploadItem> fileList = webHelper.getFileList();
		
		for (UploadItem item : fileList) {
			
			item.setFieldName(item.getFieldName());
			item.setOriginName(item.getOriginName());
			item.setFilePath(item.getFilePath());
			item.setContentType(item.getContentType());
			item.setFileSize(item.getFileSize());
			item.setFileName(item.getFileName());
			item.setRegDate(item.getRegDate());
			item.setEditDate(item.getEditDate());
			item.setRoomno(item.getRoomno());
			
			log.debug("업로드 될 항목" + item.toString());

			// DB에 저장하기
			try {
				log.info("upload"+fileList);
				uploadservice.addUploadItem(item);
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				e.printStackTrace();
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
		}	//end for	
		log.info("업로드 후");
		
		Map<String, String> paramMap = webHelper.getParamMap();
		
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
