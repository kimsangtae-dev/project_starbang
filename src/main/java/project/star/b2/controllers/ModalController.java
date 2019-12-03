package project.star.b2.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.star.b2.helper.RegexHelper;
import project.star.b2.helper.WebHelper;
import project.star.b2.model.User;
import project.star.b2.service.UserService;

@Controller
public class ModalController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	UserService userService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/********************************************************************
	 * 동의하기
	 *******************************************************************/
	@RequestMapping(value = "/modal/agree.do", method = RequestMethod.GET)
	public ModelAndView agree() {

		return new ModelAndView("modal/agree");
	}

	/********************************************************************
	 * 회원가입 폼
	 *******************************************************************/

	@RequestMapping(value = "/modal/join.do", method = RequestMethod.GET)
	public ModelAndView join() {

		return new ModelAndView("modal/join");
	}

	/********************************************************************
	 * 회원가입 폼에 대한 action
	 *******************************************************************/

	@RequestMapping(value = "/modal/join_ok.do", method = RequestMethod.POST)
	public ModelAndView join_ok(Model model) {

		/** 날짜 시간 포맷 선언 */
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		String teltol = tel + "-" + tel1 + "-" + tel2;

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
		String redirectUrl = contextPath + "/" + input.getUserno();

		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/********************************************************************
	 * 로그인 폼
	 *******************************************************************/

	@RequestMapping(value = "/modal/login.do", method = RequestMethod.GET)
	public ModelAndView login() {

		return new ModelAndView("modal/login");
	}

	/********************************************************************
	 * 로그인
	 *******************************************************************/
	/*
	 * @RequestMapping(value = "/modal/login_ok.do", method = RequestMethod.GET)
	 * public ModelAndView login_ok(Model model, HttpServletRequest request) {
	 * 
	 *//** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
	/*
	 * String email = webHelper.getString("email"); String passwd =
	 * webHelper.getString("passwd"); String name = webHelper.getString("name");
	 * 
	 * // 필수 값의 존재여부 검사 if (email == null || email.contentEquals("")) { return
	 * webHelper.redirect(null, "아이디를 입력하세요."); }
	 * 
	 * if (passwd == null || passwd.contentEquals("")) { return
	 * webHelper.redirect(null, "비밀번호를 입력하세요."); }
	 * 
	 *//** 2) 데이터 조회하기 */
	/*
	 * // 조회에 필요한 조건값(검색어)를 Beans에 담는다. User input = new User();
	 * input.setEmail(email);
	 * 
	 * 
	 * // 조회결과를 저장할 객체 선언 User output = null;
	 * 
	 * try { //데이터 조회 output = userService.getUserLogin(input); } catch (Exception
	 * e) { return webHelper.redirect(null, e.getLocalizedMessage()); }
	 * 
	 * 
	 * // 아이디와 비밀번호가 가입된 정보와 일치하는지 검사 // --> 여기서는 특정 문자열과 동일한 경우 가입된 아이디로 판다. if
	 * (!email.equals(output.getEmail()) || !passwd.equals(output.getPasswd())) {
	 * return webHelper.redirect(null, "아이디나 비밀번호가 잘못되었습니다.");
	 * 
	 * }
	 * 
	 * // WebHelper를 통해서 세션값 가져오기 Member loginInfo = (Member)
	 * webHelper.getSession("login_info");
	 * 
	 * // 저장된 쿠키값 조회하기 String rememberUserId =
	 * webHelper.getCookie("remember_user_id", "");
	 * 
	 *//** 1) request 객체를 사용해서 세션 객체 만들기 */
	/*
	 * // --> import javax.servlet.http.HttpSession; HttpSession session =
	 * request.getSession();
	 * 
	 * 
	 * // 모든 세션값을 삭제 webHelper.removeAllSession();
	 * 
	 *//** 2) 세션 저장, 삭제 */
	/*
	 * // 생성된 세션 객체를 사용하는 방법은 JSP와 동일하다. if (!email.equals("")) { // 입력 내용이 있다면 세션
	 * 저장 처리 session.setAttribute("email", email); } else { // 입력 내용이 없는 경우 세션 삭제
	 * session.removeAttribute("email"); }
	 * 
	 * 
	 *//** 3) View 처리 *//*
						 * model.addAttribute("output", output);
						 * 
						 * return new ModelAndView("index"); }
						 */

	/********************************************************************
	 * 비밀번호 찾기
	 *******************************************************************/
	@RequestMapping(value = "/modal/pwd.do", method = RequestMethod.GET)
	public ModelAndView pwd() {

		return new ModelAndView("modal/pwd");
	}

	/********************************************************************
	 * 찜한방 - 비교하기
	 *******************************************************************/
	@RequestMapping(value = "/modal/compare.do", method = RequestMethod.GET)
	public ModelAndView compare() {

		return new ModelAndView("modal/compare");
	}
}