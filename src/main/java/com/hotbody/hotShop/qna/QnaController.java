package com.hotbody.hotShop.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller("hotShop.Qna")
public class QnaController {
	@Autowired
	private  QnaService service;
	
	@RequestMapping(value="/hotShop/Qna_created", method=RequestMethod.GET)
	public String CreatedForm() {
		return "/hotShop/Qna_created";
	}
	
	@RequestMapping(value="/hotShop/Qna_created.ok", method=RequestMethod.POST)
	public String CreatedSubmit(
			Qna dto,
			Model model,
			MultipartHttpServletRequest multipartRequest
			) {
		
		service.insertQnA(dto);
		
		return "redirect:/";
	}
	
}
