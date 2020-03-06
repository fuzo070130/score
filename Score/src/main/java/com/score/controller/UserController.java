package com.score.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.score.domain.vo.UserVO;
import com.score.service.UserServiceImpl;
import com.score.utils.CodeCreate;
import com.score.utils.MailSendThred;

@Controller
@RequestMapping("/User")
public class UserController {
	
	@Inject
 	private UserServiceImpl service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String user()throws Exception{
		
		return "/User/UserMyPage";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET()throws Exception{
		
		return "/User/UserRegister";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO vo)throws Exception{
		vo.setUserEmailCheck("yes");
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
			System.out.println("틀림");
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
	
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	public ResponseEntity<String> MailCheck(@RequestBody UserVO vo, HttpServletRequest request)throws Exception{

		ResponseEntity<String> entity = null;
		try {
			String code = CodeCreate.getCodeCreate();
			HttpSession session = request.getSession();
			session.setAttribute("code", code);
			session.setMaxInactiveInterval(60*5);
			
			MailSendThred.MailSend("fuzo070130@naver.com", vo.getUserEmail() , "제목입니다.", code);
			entity = new ResponseEntity<String>("succ", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/codeCheck", method = RequestMethod.GET)
	public ResponseEntity<String> codeCheck(String code, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		String sessionCode = (String) session.getAttribute("code");
		if(sessionCode != null && code != null){
			if(sessionCode.equals(code)){
				session.invalidate();
				return new ResponseEntity<String>("succ", HttpStatus.OK);
			}
		}
		return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(String userID, HttpServletRequest request)throws Exception{
		System.out.println(userID);
		try {
			System.out.println(service.idCheck(userID));
			if(service.idCheck(userID) == 0){
				return new ResponseEntity<String>("succ", HttpStatus.OK);
			}else {
				return new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickNameCheck", method = RequestMethod.GET)
	public ResponseEntity<String> nickNameCheck(String userNickName, HttpServletRequest request)throws Exception{
		System.out.println(userNickName);
		try {
			System.out.println(service.nickNameCheck(userNickName) + "abc");
			if(service.nickNameCheck(userNickName) == 0){
				return new ResponseEntity<String>("succ", HttpStatus.OK);
			}else {
				return new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		}
	}

}