package com.hotbody.hotShop.disuse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotbody.hotShop.board.HotShop;
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.member.SessionInfo;

@Controller("hotShop.disuse")
public class DisuseController {
	
	@Autowired
	private DisuseService service;
	private HotShopService service2;
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.GET)
	public String insertForm() {
		
		return ".hotShop.productDisuse";
	}
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.POST)
	public String insertSubmit(
			@RequestParam Disuse dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUseriId(info.getUserId());
		dto.setPdNum(81);
		
		service.insertDisuse(dto);
		
		return ".hotShop.productDisuse";
	}

	@RequestMapping(value="/hotShop/disuse")
	public String readDisuse(
			@RequestParam String pdName,
			Model model
			) {
		Map<String, Object> map=new HashMap<>();
		List<HotShop> productList=null;
		productList=service2.productList(map);
		Disuse dto = service.readDisuse(pdName);
		
		model.addAttribute("productList", productList);
		model.addAttribute("dto", dto);
		
		return ".hotShop.productDisuse";
	}
	
}

