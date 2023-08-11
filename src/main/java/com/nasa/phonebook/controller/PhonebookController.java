package com.nasa.phonebook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nasa.phonebook.dao.PhoneBookDao;
import com.nasa.phonebook.dto.PhoneBookDto;
import com.nasa.phonebook.service.PhoneBookService;

@Controller
@RequestMapping("/phonebook")
public class PhonebookController {
	PhoneBookDao phonebookDao;
	PhoneBookService phonebookService = new PhoneBookService();

	private final Logger logger = LoggerFactory.getLogger(this.getClass()); // 해당 클래스가 빌린다

	@Autowired
	public PhonebookController(PhoneBookDao phonebookDao) {
		this.phonebookDao = phonebookDao;
	}

	@GetMapping("/signup")
	public String signUp() {
		return "phonebooksignup";
	}

	@PostMapping("/signrequest")
	public String signrequest(Model model, @RequestParam("loginid") String loginid,
			@RequestParam("loginpw") String loginpw, @RequestParam("loginph") String loginph) {
		PhoneBookDto phonebookDto = new PhoneBookDto();
		phonebookDto.setLoginid(loginid);
		phonebookDto.setLoginpw(loginpw);
		phonebookDto.setLoginph(loginph);

		try {
			phonebookDao.addloginList(phonebookDto);
			model.addAttribute("login", phonebookDto);

		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("회원가입 실패");
			model.addAttribute("error", "회원가입 실패");
			return "redirect:/phonebook/signup";
		}
		return "redirect:/phonebook/login";
	}

	@GetMapping("/login")
	public String logIn() {
		return "phonebooklogin";
	}

//   로그인후 리스트로 이동 완료 -> 필터 걸어야함~
	@PostMapping("/loginrequest")
	public String loginRequest(Model model, @RequestParam("loginid") String loginid,
			@RequestParam("loginpw") String loginpw, HttpServletRequest request) {
		PhoneBookDto phonebookDto = new PhoneBookDto();
		phonebookDto.setLoginid(loginid);
		phonebookDto.setLoginpw(loginpw);
		try {
			int resultlogin = phonebookDao.logIn(loginid, loginpw);
			if (resultlogin == 0) {
				logger.warn("아이디 및 비밀번호 오류");
				model.addAttribute("error", "아이디 및 비밀번호를 잘못입력하셨습니다.");
				return "alert";
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("회원 로그인 과정에서 문제발생");
			model.addAttribute("error", "로그인 시 문제 발생");
		}
		request.getSession().setAttribute("loginid", loginid);
		request.getSession().setAttribute("loginpw", loginpw);
		model.addAttribute("error", "로그인성공");
		return "redirect:/phonebook/list";
	}// loginIn() end

	@GetMapping("/list")
	public String getList(Model model, HttpServletRequest request) {
		List<PhoneBookDto> list;
		String loginid = (String) request.getSession().getAttribute("loginid");
		try {
			logger.info(loginid + "님의 연락처 불러오기 성공");
			list = phonebookDao.getAll(loginid);
			model.addAttribute("phonebookList", list);
		} catch (Exception e) {
			e.printStackTrace(); // 개발시 필요
			logger.warn("에러"); // 서버쪽 콘솔에 출력
			model.addAttribute("error", "에러");
		}
		return "phonebookList";
	}

	@PostMapping("/add")
	public String addPhonebook(Model model, @RequestParam("username") String username,
			@RequestParam("userph") String userph, @RequestParam("useraddr") String useraddr,
			@RequestParam("groupid") String groupid, HttpServletRequest request) {
		PhoneBookDto phonebookDto = new PhoneBookDto();
		String lognid = (String) request.getSession().getAttribute("loginid");
		phonebookDto.setLoginid(lognid);
		phonebookDto.setUsername(username);
		phonebookDto.setUserph(userph);
		phonebookDto.setUseraddr(useraddr);
		phonebookDto.setGroupid(groupid);
		try {
			phonebookDao.addPhonebook(phonebookDto);
			model.addAttribute("phonebookList", phonebookDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("연락처 추가 실패");
			model.addAttribute("error", "연락처 추가 실패");
			return "redirect:/phonebook/list";
		}
		return "redirect:/phonebook/list";
	}// addPhonebook() end

	@PostMapping("/update")
	public String updatePhonebook(Model model, @RequestParam("username") String username,
			@RequestParam("userph") String userph, @RequestParam("useraddr") String useraddr,
			@RequestParam("groupid") String groupid, HttpServletRequest request) {
		PhoneBookDto phonebookDto = new PhoneBookDto();
		String lognid = (String) request.getSession().getAttribute("loginid");
		phonebookDto.setLoginid(lognid);
		phonebookDto.setUsername(username);
		phonebookDto.setUserph(userph);
		phonebookDto.setUseraddr(useraddr);
		phonebookDto.setGroupid(groupid);
		try {
			phonebookDao.updatePhonebook(phonebookDto);
			model.addAttribute("phonebookList", phonebookDto);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("수정 실패");
			model.addAttribute("error", "수정 실패");
			return "redirect:/phonebook/list";
		}
		return "redirect:/phonebook/list";
	}

	@PostMapping("/delete")
	public String updatePhonebook(Model model, @RequestParam("userph") String userph, HttpServletRequest request) {
		PhoneBookDto phonebookDto = new PhoneBookDto();
		String lognid = (String) request.getSession().getAttribute("loginid");
		phonebookDto.setLoginid(lognid);
		phonebookDto.setUserph(userph);
		try {
			phonebookDao.deletePhonebook(phonebookDto);
			logger.info(lognid + " :id," + userph);
			model.addAttribute("userph", userph);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("삭제 실패");
			model.addAttribute("error", "삭제 실패");
			return "redirect:/phonebook/list";
		}
		return "redirect:/phonebook/list";
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession();

		model.addAttribute("error", "로그아웃 성공");

		session.invalidate();

		return "alert";
	}

	@PostMapping("/idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("loginid") String loginid) throws Exception {
		int cnt = 1;
		cnt = phonebookDao.idCheck(loginid);
		logger.info(loginid);
		return cnt;
	}

	// ph check
	@PostMapping("/checkph")
	@ResponseBody
	public int phCheck(@RequestParam("userph") String userph) throws Exception {
		int cnt = 1;
		cnt = phonebookDao.phCheck(userph);
		logger.info(userph);
		return cnt;
	}
}