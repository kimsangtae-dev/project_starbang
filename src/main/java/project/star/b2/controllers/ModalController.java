package project.star.b2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ModalController {
	
	/********************************************************************
	 *  							동의하기
	 *******************************************************************/
	@RequestMapping(value = "/modal/agree.do", method = RequestMethod.GET)
	public ModelAndView agree() {
		
		return new ModelAndView("modal/agree");
	}
	
	/********************************************************************
	 *  							회원가입 폼
	 *******************************************************************/
	
	@RequestMapping(value = "/modal/join.do", method = RequestMethod.GET)
	public ModelAndView join() {
		
		return new ModelAndView("modal/join");
	}
	
	/********************************************************************
	 *  							회원가입 폼에 대한 action
	 *******************************************************************/
	
	@RequestMapping(value = "/modal/join_ok.do", method = RequestMethod.POST)
	public ModelAndView join_ok(Model model) { 
		
		/** 날짜 시간 포맷 선언 */
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();

		
		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String name = webHelper.getString("name");
		String email = webHelper.getString("email");
		String email1 = webHelper.getString("email1");
		String passwd = webHelper.getString("passwd");
		String tel = webHelper.getString("tel");
		String tel1 = webHelper.getString("tel1");
		String tel2 = webHelper.getString("tel2");
		String format_time1 = format1.format(time.getTime());
		/* String regdate = webHelper.getString("regdate"); */
		String editdate = webHelper.getString("editdate");
		String profile_img = webHelper.getString("profile_img");
		String emailtol = email + "@" + email1;
		String teltol = tel+"-"+tel1+"-"+tel2; 
		
		// 학과 이 름름은 필수 항목이므로 입력여부를 검사
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (name == null) {
			return webHelper.redirect(null, "회원이름을 입력하세요.");
		}
		
		if (!regexHelper.isKor(name)) {
			return webHelper.redirect(null, "회원이름은 한글만 가능합니다.");
		}
		
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		User input = new User();
		input.setName(name);
		input.setEmail(emailtol);
		input.setPasswd(passwd);
		input.setTel(teltol);
		input.setRegdate(format_time1);
		input.setEditdate(editdate);
		input.setProfile_img(profile_img);
		
		
		try {
			
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			userService.addUser(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/"+ input.getUserno();
		
		return webHelper.redirect(redirectUrl, "저장되었습니다."); 
	}
	
	/********************************************************************
	 *  							로그인
	 *******************************************************************/
	@RequestMapping(value = "/modal/login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		
		return new ModelAndView("modal/login");
	}
	
	/********************************************************************
	 *  							비밀번호 찾기
	 *******************************************************************/
	@RequestMapping(value = "/modal/pwd.do", method = RequestMethod.GET)
	public ModelAndView pwd() {
		
		return new ModelAndView("modal/pwd");
	}
	
	/********************************************************************
	 *  							찜한방 - 비교하기
	 *******************************************************************/
	@RequestMapping(value = "/modal/compare.do", method = RequestMethod.GET)
	public ModelAndView compare() {
		
		return new ModelAndView("modal/compare");
	}
}