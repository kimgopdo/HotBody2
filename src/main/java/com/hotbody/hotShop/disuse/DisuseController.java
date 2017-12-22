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

import com.hotbody.common.MyUtil;
import com.hotbody.hotShop.board.HotShop;
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.member.SessionInfo;

@Controller("hotShop.disuse")
public class DisuseController {
	
	@Autowired
	private DisuseService service;
	@Autowired
	private HotShopService service2;
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.GET)
	public String insertForm(
			Model model
			) {
		Map<String, Object> map=new HashMap<>();
		List<HotShop> productList=null;
		map.put("listOrArticle", 0);
		productList=service2.productList(map);
		
		
		model.addAttribute("productList", productList);
		return ".hotShop.productDisuse";
	}
	
	@RequestMapping(value="/hotShop/disuse", method=RequestMethod.POST)
	public String insertSubmit(
			Disuse dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUseriId(info.getUserId());
		
		service.insertDisuse(dto);
		
		return ".hotShop.productDisuse";
	}

	@RequestMapping(value="/hotShop/disuse")
	public String readDisuse(
			@RequestParam String pdName,
			@RequestParam(defaultValue="10") int rows,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model
			) {
		Map<String, Object> map=new HashMap<>();
		List<HotShop> productList=null;
		int row=5;
		int dataCount=service2.dataCount();
		int total_page=dataCount/row;
		map.put("listOrArticle", 0);
		
		total_page = util.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		productList=service2.productList(map);
		Disuse dto = service.readDisuse(pdName);
		
		model.addAttribute("productList", productList);
		model.addAttribute("dto", dto);
		model.addAttribute("total_page", total_page);
		
		return ".hotShop.productDisuse";
	}
	
}

