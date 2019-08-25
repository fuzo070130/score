package com.score.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.score.domain.vo.GameReviewVO;
import com.score.domain.vo.ReplyVO;
import com.score.service.GameReviewServiceImpl;

@Controller
@RequestMapping("/GameReview")
public class GameReviewController {

	@Inject
	private GameReviewServiceImpl service;
	
	@RequestMapping(value = "/list/{gameNumber}" , method = RequestMethod.GET)
	public ResponseEntity<List<GameReviewVO>> list(@PathVariable("gameNumber") Integer gameNumber) {
		ResponseEntity<List<GameReviewVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.select(gameNumber), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insertPOST(@RequestBody GameReviewVO vo, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(@RequestBody GameReviewVO vo, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			service.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(@PathVariable("gameNumber") Integer gameNumber) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			service.delete(gameNumber);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}



}