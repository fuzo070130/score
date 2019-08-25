package com.score.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.score.domain.vo.UserVO;
import com.score.service.UserServiceImpl;

@Controller
@RequestMapping("/User")
public class UserController {
	
	@Inject
 	private UserServiceImpl service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String user()throws Exception{
		
		System.out.println("UserInfo");
		
		return "/User/UserInfo";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET()throws Exception{
		
		System.out.println("UserRegister");
		
		return "/User/UserRegister";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo)throws Exception{
		
		if(service.registerCheck(vo) != null) {
			return "/User/UserRegisterFinFail";
		} else {
			if(service.register(vo) == 1){
				return "/User/UserRegisterFin";
			} else {
				return "/User/UserRegisterFinFail";
			}
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET()throws Exception{
		
		return "/User/UserLogin";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(UserVO vo, HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession(true);
		
		UserVO Uvo = service.login(vo);
		if(Uvo == null){
			System.out.println("아이디 틀림");
		}else{
			session.setAttribute("vo", Uvo);
			System.out.println(Uvo.getUserID());
		}
		
		return "/home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession(true);
		
		session.invalidate();
		
		return "/home";
	}

}