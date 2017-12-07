package com.hotbody.mocoboard;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mocoboard.mocoBoardController")
public class MocoBoardController {
	
	@Autowired
		private BoardService service;
	
	
	@RequestMapping(value="/moco_board/article")
	public String mocoArticle() {
		
		return ".moco_board.article";	
	}
	
	@RequestMapping(value="/moco_board/c_notice")
	public String noticeForm() {
		
		return ".moco_board.c_notice";
		
	}
	
	@RequestMapping(value="/moco_board/c_free", method=RequestMethod.GET)
	public String cfreeForm(
			Model model)throws Exception {
			model.addAttribute("mode", "created");
			
		return ".moco_board.c_free";
		
	}
	
	@RequestMapping(value="/moco_board/c_free", method=RequestMethod.POST)
	public String cfreeFormSubmit(
			Model model,
			Board dto) throws Exception {
		
		service.insertBoard(dto);
		
		model.addAttribute("mode", "created");
		
		return ".main.main";
		
	}
	
}
