package com.score.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.score.domain.dto.PageMaker;
import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.BoardVO;
import com.score.service.BoardServiceImpl;

@Controller
@RequestMapping("/Board")
public class BoardController {
	
	//github Test

	@Inject
	private BoardServiceImpl service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String ListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listSearchCriteria(cri));
		
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    
	    pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

		return "/Board/BoardList";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {

		return "/Board/BoardInsert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(BoardVO vo) throws Exception {

		service.insert(vo);

		return "redirect:/Board";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String readPageGET(@RequestParam("boardNumber") int boardNumber, Model model) throws Exception {
		model.addAttribute("vo", service.readPage(boardNumber));

		return "/Board/BoardReadPage";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("boardNumber") int boardNumber, Model model) throws Exception {
		model.addAttribute("vo", service.readPage(boardNumber));

		return "/Board/BoardModifyPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO vo,RedirectAttributes rttr) throws Exception {
		service.modify(vo);

		return "redirect:/Board/readPage?boardNumber=" + vo.getBoardNumber();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("boardNumber") int boardNumber, Model model) throws Exception {

		service.delete(boardNumber);
		
		return "redirect:/Board";
	}
	

}
