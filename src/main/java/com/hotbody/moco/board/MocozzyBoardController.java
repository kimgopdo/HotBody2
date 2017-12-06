package com.hotbody.moco.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("moco.board")
public class MocozzyBoardController {
	
	@RequestMapping(value="/moco_board/article")
	public String mocoArticle() {
		
		return ".moco_board.article";	
	}
	
	@RequestMapping(value="/moco_board/c_notice")
	public String noticeForm() {
		
		return ".moco_board.c_notice";
		
	}
	
	@RequestMapping(value="/moco_board/c_free")
	public String freeForm() {
		
		return ".moco_board.c_free";
		
	}
	
}
