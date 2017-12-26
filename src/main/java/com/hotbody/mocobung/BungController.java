package com.hotbody.mocobung;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.member.SessionInfo;

@Controller("mocobung.BungController")
public class BungController {
	
	@Autowired
	private BungService service;
	

	
	@RequestMapping(value="/mocobung/{mocoNum}/b_created" , method=RequestMethod.GET)
	public String bungCreated(Model model, 
			@PathVariable int mocoNum,
			@RequestParam int num ) throws Exception {
		model.addAttribute("mode","created");
		model.addAttribute("geNum", num);
		model.addAttribute("mocoNum", mocoNum);
		
		return ".mocobung.b_created";
	}
	
	@RequestMapping(value="/mocobung/{mocoNum}/b_created")
	@ResponseBody
	public Map<String,Object> b_submit (
			@PathVariable int mocoNum,
			Bung dto, HttpSession session){
		System.out.println(dto.getMosubName()+"===========================");
		
		dto.setGeNum(mocoNum);
		
		service.insertBung(dto);
		
		Map<String,Object> model = new HashMap<>();
		model.put("state", "true");
			
		return model;	
	}
	
	@RequestMapping(value="/mocobung/{mocoNum}/list")
	public String list(
			HttpServletRequest req, 
			@RequestParam (value="page", defaultValue="1") int current_page,
			@PathVariable int mocoNum, 			
			@RequestParam int mosubNum,
			Model model) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mocoNum", mocoNum);		
		
		List<Bung> list=service.listBung(map);
		
		
		model.addAttribute("list",list);
		model.addAttribute("mosubNum", mosubNum);		
		req.setAttribute("mocoNum", mocoNum);
				
		return ".mocojee.article";			
		
	} 
	
////벙개 보기 Article
	@RequestMapping(value="/mocobung/{mocoNum}/b_article", method=RequestMethod.GET)
	public String BungArticle(
			@PathVariable int mocoNum,			
			HttpServletRequest req,  
			@RequestParam(value="num") int mosubNum,
			Model model) throws Exception{
		
		System.out.println("hello");
		Bung dto=service.readBung(mosubNum);	
		System.out.println(mosubNum);
		
		if (dto==null)
			return "redirect:/mocobung/{mocoNum}/b_article";
		
		model.addAttribute("dto", dto);
		model.addAttribute("mocoNum", mocoNum);
		model.addAttribute("mosubNum", mosubNum);
		
		return ".mocobung.b_article";	
	}
	
	//수정	
	@RequestMapping(value="/mocobung/{mocoNum}/u_bung", method=RequestMethod.GET)
	public String updateFom(
			@PathVariable int mocoNum, 
			@RequestParam (value="num") int mosubNum,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		Bung dto=service.readBung(mosubNum);
		if(dto==null) {
			return "redirect:/mocobung/{mocoNum}/b_created";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/mocojee/{mocoNum}/main";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode","u_bung");
		
		return ".mocobung.b_created";
			
	}
	
	@RequestMapping(value="/mocobung/{mocoNum}/u_bung", 
			method=RequestMethod.POST)
	public String updateSubmit(
			@PathVariable int mocoNum,
			Bung dto, HttpSession session) throws Exception {
		
		service.updateBung(dto);
		
		return "redirect:/mocojee/{mocoNum}/main";

	}
	
	
}
