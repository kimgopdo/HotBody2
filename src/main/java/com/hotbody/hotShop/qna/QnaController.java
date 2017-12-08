package com.hotbody.hotShop.qna;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotbody.member.SessionInfo;

@Controller("hotShop.Qna")
public class QnaController {
	@Autowired
	private  QnaService service;
	
	@RequestMapping(value="/hotShop/pQnA_created", method=RequestMethod.GET)
	public String CreatedForm(Model model) {
		model.addAttribute("mode", "created");
		return ".hotShop_QnA.pQnA_created";
	}
	
	@RequestMapping(value="/hotShop/pQnA_created", method=RequestMethod.POST)
	public String CreatedSubmit(
			Qna dto,
			HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		
		service.insertQnA(dto);
		
		return "redirect:/";
	}
	@RequestMapping(value="/hotShop/pQnA_list")
	public String list(
			) throws Exception {
		
		return "";
	}
	
}
