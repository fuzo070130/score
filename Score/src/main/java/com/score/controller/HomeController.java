package com.score.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.score.service.MainServiceImpl;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MainServiceImpl service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {

		System.out.println("홈");

		return "home";
	}
	
}
