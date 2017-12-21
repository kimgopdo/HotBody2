package com.hotbody.hotShop.disuse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotbody.member.SessionInfo;

@Controller("hotShop.disuse")
public class DisuseController {
	
	@Autowired
	private DisuseService service;
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.GET)
	public String insertForm() {
		
		return ".hotShop.productDisuse";
	}
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.POST)
	public String insertSubmit(
			Disuse dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUseriId(info.getUserId());
		dto.setPdNum(61);
		
		service.insertDisuse(dto);
		
		return ".hotShop.productDisuse";
	}
}
