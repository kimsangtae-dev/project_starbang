/*
 * package project.star.b2.controllers;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.beans.factory.annotation.Value; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import project.star.b2.helper.RegexHelper; import
 * project.star.b2.helper.RetrofitHelper; import
 * project.star.b2.helper.WebHelper; import project.star.b2.model.Address;
 * import project.star.b2.model.RoomInfo; import
 * project.star.b2.model.Address.Documents; import project.star.b2.model.Price;
 * import project.star.b2.service.ApiKakaoSearchService; import
 * project.star.b2.service.InfoService; import
 * project.star.b2.service.PriceService; import
 * project.star.b2.service.RoomInfoService; import
 * project.star.b2.service.RoomService; import retrofit2.Call; import
 * retrofit2.Retrofit;
 * 
 * @Controller public class HostController {
 * 
 *//** WebHelper 주입 */
/*
 * @Autowired WebHelper webHelper;
 * 
 *//** RegexHelper 주입 */
/*
 * @Autowired RegexHelper regexHelper;
 * 
 *//** RegexHelper 주입 */
/*
 * @Autowired RetrofitHelper retrofitHelper;
 * 
 *//** Service 패턴 구현체 주입 */
/*
 * @Autowired RoomInfoService roomInfoService;
 * 
 *//** Service 패턴 구현체 주입 */
/*
 * @Autowired RoomService roomService;
 * 
 *//** Service 패턴 구현체 주입 */
/*
 * @Autowired InfoService infoService;
 * 
 * @Autowired PriceService priceService;
 * 
 *//** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
/*
 * @Value("#{servletContext.contextPath}") String contextPath;
 * 
 *//********************************************************************
	 * 방주인 메인페이지
	 *******************************************************************/
/*
 * @RequestMapping(value = "/host/main.do", method = RequestMethod.GET) public
 * ModelAndView main() {
 * 
 * return new ModelAndView("host/main"); }
 * 
 *//********************************************************************
	 * 공실 등록하기
	 *******************************************************************/
/*
 * @RequestMapping(value = "/host/rm_add.do", method = RequestMethod.GET) public
 * ModelAndView rm_add() {
 * 
 * return new ModelAndView("host/rm_add"); }
 * 
 *//********************************************************************
	 * 공실 등록하기_ok
	 *******************************************************************/
/*
 * @RequestMapping(value = "/host/rm_add_ok.do", method = RequestMethod.POST)
 * public ModelAndView rm_add_ok(Model model) {
 * 
 *//**
	 * 1) 사용자가 입력한 파라미터 수신 및 유효성 검사
	 */
/*

*//** room ** parameter 받아오기 */
/*
 * //room 정보 받아오기 String roomtype = webHelper.getString("roomtype"); String
 * title = webHelper.getString("title"); String floor =
 * webHelper.getString("floor"); int area = webHelper.getInt("area"); int fee =
 * webHelper.getInt("fee"); String confirmdate =
 * webHelper.getString("confirmdate"); // String address =
 * webHelper.getString("address"); String dong = webHelper.getString("dong");
 * String ho = webHelper.getString("ho"); // int latitude =
 * webHelper.getInt("latitude"); // int longitude =
 * webHelper.getInt("longitude"); // String region_2depth_name =
 * webHelper.getString("region_2depth_name"); // String region_3depth_name =
 * webHelper.getString("region_3depth_name"); int userno = 1;
 * 
 *//** info ** parameter 받아오기 */
/*
 * // 관리비항목 계산해서 넣기 String[] feeitem = webHelper.getStringArray("feeitem",
 * null); int sum_fee = 0;
 * 
 * if (feeitem != null) { for (String item : feeitem) { int bin_fee =
 * Integer.parseInt(item); sum_fee += bin_fee; } }
 * 
 * int parking = webHelper.getInt("parking"); String pet =
 * webHelper.getString("pet"); String elevator =
 * webHelper.getString("elevator"); String veranda =
 * webHelper.getString("veranda"); String builtin =
 * webHelper.getString("builtin");
 * 
 *//** 옵션 계산해서 db 넣기 */
/*
 * String[] optionitem = webHelper.getStringArray("optionitem", null);
 * 
 * int sum_option = 0;
 * 
 * if (optionitem != null) {
 * 
 * for (String item : optionitem) { int bin_option = Integer.parseInt(item);
 * sum_option += bin_option; }
 * 
 * } String loan = webHelper.getString("loan"); int supplyarea =
 * webHelper.getInt("supplyarea"); int maxfloor = webHelper.getInt("maxfloor");
 * String heater = webHelper.getString("heater"); String commingday =
 * webHelper.getString("commingday"); String buildtype =
 * webHelper.getString("buildtype"); String content =
 * webHelper.getString("content");
 * 
 * 
 *//** (3) price 정보 받아오기 */
/*
 * String[] deposit = webHelper.getStringArray("deposit"); String[] dealingtype
 * = webHelper.getStringArray("dealingtype"); String[] price =
 * webHelper.getStringArray("price"); String short_room =
 * webHelper.getString("short_room");
 * 
 * 
 *//**
	 * 2) 유효성 검사
	 */
/*
 * 
 * if (title == null) { return webHelper.redirect(null, "설명을 입력하세요."); } //
 * title 검사
 * 
 *//** 2) 데이터 저장하기 */
/*
 * 
 * RoomInfo input = new RoomInfo();
 * 
 *//** (1) room 정보 받아오기 */
/*
 * input.setRoomtype(roomtype); input.setTitle(title); input.setFloor(floor);
 * input.setArea(area); input.setFee(fee); input.setConfirmdate(confirmdate); //
 * 어드레스 input.setAddress(address); input.setDong(dong); input.setHo(ho); // 위도 y
 * input.setLatitude(latitude); // 경도 x input.setLongitude(longitude); // 동
 * input.setRegion_2depth_name(region_2depth_name); // 호
 * input.setRegion_3depth_name(region_3depth_name); input.setUserno(userno);
 * 
 * 
 *//** (2) info정보 받아오기 */
/*
 * input.setFeeitem(sum_fee);
 * 
 * // parking 값이 있다면? 넣어주기 if(parking == 1) { parking =
 * webHelper.getInt("parking_val"); }
 * 
 * input.setParking(parking); input.setPet(pet); input.setElevator(elevator);
 * input.setVeranda(veranda); input.setBuiltin(builtin);
 * input.setOptionitem(sum_option); input.setLoan(loan);
 * input.setSupplyarea(supplyarea); input.setMaxfloor(maxfloor);
 * input.setHeater(heater); input.setCommingday(commingday);
 * input.setBuildtype(buildtype); input.setContent(content);
 * 
 * 
 *//** 1) API 연동 객체 생성 */
/*
 * // Retrofit 객체 생성 Retrofit retrofit =
 * retrofitHelper.getRetrofit(ApiKakaoSearchService.BASE_URL); // Service 객체를
 * 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다. ApiKakaoSearchService apiKakaoSearchService
 * = retrofit.create(ApiKakaoSearchService.class);
 * 
 *//** 2) 파라미터 처리 */
/*
 * String query = webHelper.getString("address", "");
 * 
 *//** 3) KAKAO API 요청 */
/*
 * // 검색결과를 저장할 Beans 객체 선언 Address kakaoAddress = null;
 * 
 * // 검색어가 존재할 경우 KakaoOpenAPI를 통해 검색 결과 받아옴 if (!query.equals("")) {
 * Call<Address> call = apiKakaoSearchService.getAddress(query); try {
 * kakaoAddress = call.execute().body(); } catch (Exception e) {
 * e.printStackTrace(); }
 * 
 * List<Documents> list = kakaoAddress.getDocuments();
 * 
 * for (Documents item : list) {
 * input.setAddress(item.getRoad_address().getRoad_name());
 * input.setRegion_2depth_name(item.getRoad_address().region_2depth_name);
 * input.setRegion_3depth_name(item.getRoad_address().region_3depth_name);
 * input.setLongitude(item.getRoad_address().x);
 * input.setLatitude(item.getRoad_address().y); }
 * 
 * try { // 데이터 저장 // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
 * roomInfoService.addRoomInfo(input);
 * 
 *//** (3) price 정보 받아오기 */
/*
 * Price input_p = new Price();
 * 
 * int deposit_temp = 0; int price_temp = 0;
 * 
 * for (int i = 0; i < deposit.length; i++) {
 * 
 * deposit_temp = 0;
 * 
 * price_temp = Integer.parseInt(price[i]);
 * 
 * if (deposit[i] != null || deposit[i] != "") { deposit_temp =
 * Integer.parseInt(deposit[i]); }
 * 
 * input_p.setDeposit(deposit_temp); input_p.setDealingtype(dealingtype[i]);
 * input_p.setPrice(price_temp); input_p.setShort_room(short_room);
 * input_p.setRoomno(1);
 * 
 * try { priceService.addPrice(input_p); } catch (Exception e) { return
 * webHelper.redirect(null, e.getLocalizedMessage()); } // end try
 * 
 * } // end for
 * 
 * } catch (Exception e) { return webHelper.redirect(null,
 * e.getLocalizedMessage()); }
 * 
 * }
 * 
 *//** 3) 결과를 확인하기 위한 페이지 이동 */
/*
 * // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다. String redirectUrl =
 * contextPath + "/roominfo/view.do?roomno=" + input.getRoomno();
 * 
 * return webHelper.redirect(redirectUrl, "저장되었습니다."); }
 * 
 *//********************************************************************
	 * 공실 수정하기
	 *******************************************************************/
/*
 * @RequestMapping(value = "/host/rm_edit.do", method = RequestMethod.GET)
 * public ModelAndView rm_edit() {
 * 
 * return new ModelAndView("jsp/host/rm_edit"); }
 * 
 *//********************************************************************
	 * 공실관리
	 *******************************************************************//*
																			 * @RequestMapping(value = "/host/rmli.do",
																			 * method = RequestMethod.GET) public
																			 * ModelAndView rmli() {
																			 * 
																			 * return new ModelAndView("host/rmli"); } }
																			 */