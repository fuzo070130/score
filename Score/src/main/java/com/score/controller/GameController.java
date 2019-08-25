package com.score.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.score.domain.dto.Criteria;
import com.score.domain.dto.PageMaker;
import com.score.domain.dto.ReviewCriteria;
import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.BoardVO;
import com.score.domain.vo.GameVO;
import com.score.service.GameReveiwService;
import com.score.service.GameReviewServiceImpl;
import com.score.service.GameServiceImpl;

@Controller
@RequestMapping("/Game")
public class GameController {
	
	@Inject
	private GameServiceImpl service;
	private GameReviewServiceImpl reviewService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String ListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listSearchCriteria(cri));
		System.out.println(service.listSearchCriteria(cri).get(0).getGameTitle());
		
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    
	    pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "/Game/GameList";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {

		return "/Game/GameInsert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(GameVO vo) throws Exception {

		service.insert(vo);
		
		return "redirect:/Game";
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String readPageGET(@RequestParam("gameNumber") int gameNumber, Model model) throws Exception {
		model.addAttribute("vo", service.readPage(gameNumber));
		
		ReviewCriteria cri = new ReviewCriteria();
		//model.addAttribute("list", reviewService.listSearchCriteria(cri));
		
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    
	    //pageMaker.setTotalCount(ReviewCriteria.listSearchCount(cri));
	    //구문수정해야됨
		model.addAttribute("pageMaker", pageMaker);

		return "/Game/GameReadPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("gameNumber") int gameNumber, Model model) throws Exception {
		model.addAttribute("vo", service.readPage(gameNumber));

		return "/Game/GameModifyPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(GameVO vo,RedirectAttributes rttr) throws Exception {
		service.modify(vo);

		return "redirect:/Game/readPage?gameNumber=" + vo.getGameNumber();
	}

}