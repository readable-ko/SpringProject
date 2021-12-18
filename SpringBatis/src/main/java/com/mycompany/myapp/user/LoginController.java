package com.mycompany.myapp.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	UserServiceImpl service;
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping(value="/loginOK", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, UserVO vo) {
		String returnURL = "";
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		UserVO loginvo = service.getUser(vo);
		if(loginvo != null) {
			System.out.println("�α��� ����!");
			session.setAttribute("login", loginvo);
			session.setAttribute("loginId", loginvo.getUserid());
			//returnURL = "redirect:/board/posts";
			returnURL = "redirect:/board/list";
		} else {
			System.out.println("�α��� ����!");
			returnURL = "redirect:/login/login";
		}
		return returnURL;
	}
	
	@RequestMapping(value="/signuppage", method= RequestMethod.GET)
	public String signup() {
		return "/login/makeid";
	}
	
	@RequestMapping(value="/signupOK", method= RequestMethod.POST)
	public String signupCheck(UserVO vo) {
		int i = service.insertUser(vo);
		if(i == 0)
			System.out.println("�߰� ����!");
		else
			System.out.println("�߰� ����!!");
		return "redirect:login";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpSession session) {
		//�α��� ���� ��� ������ �ִ� Session TEST
		System.out.println((String)session.getAttribute("loginId"));
		return "redirect:/board0";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/login";
	}
	
	
}
