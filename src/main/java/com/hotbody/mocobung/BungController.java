package com.hotbody.mocobung;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotbody.common.MyUtil;

@Controller("mocobung.BungController")
public class BungController {
	
	@Autowired
	private BungService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="mocobung/created" , method=RequestMethod.GET)
	public String bungCreated(Model model) throws Exception {
		model.addAttribute("mode","c_bung");
		
		return ".mocojee.ccbung";
	}
	
	@RequestMapping(value="mocobung/created" , method=RequestMethod.POST)
	public String bungSubmit(HttpServletRequest req, Bung dto) throws Exception{
		
		service.insertBung(dto);
		
		return "redirect:/mocojee/list_mocojee";
		
	}
}
