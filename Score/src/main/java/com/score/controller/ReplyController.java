package com.score.controller;

import java.util.ArrayList;
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

import com.score.domain.vo.ReplyVO;
import com.score.service.ReplyService;

@Controller
@RequestMapping("/Reply")
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	@RequestMapping(value = "/list/{boradNumber}/{replyPoint}" , method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("boradNumber") Integer boardNumber,@PathVariable("replyPoint") Integer replyPoint) {
		System.out.println(boardNumber);
		System.out.println(replyPoint);
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.replyList(boardNumber, replyPoint), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//댓글작성
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insertPOST(@RequestBody ReplyVO vo, HttpServletRequest request) throws Exception {

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

}
