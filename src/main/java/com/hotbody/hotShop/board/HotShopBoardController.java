package com.hotbody.hotShop.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.common.FileManager;
@Controller("hotShop.board")
public class HotShopBoardController {
	@Autowired
	private HotShopService service;
	@Autowired
	FileManager file;
	//상품분류에따른 list 
	//main list는 따로 드래그엔 드롭으로 순서 변경 가능하게 만들꺼임.
	@RequestMapping("/hotShop/productList")
	public String productList(
			@RequestParam String cl
			,@RequestParam String name
			,HttpServletRequest req
			,HttpSession session
			,Model model
			) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			name = URLDecoder.decode(name, "UTF-8");
		}
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"shopProduct";
		List<HotShop> list=null;
		Map<String, Object> map=new HashMap<>();
		map.put("listOrArticle", 0);
		list=service.productList(map);
		
		Iterator<HotShop> it=list.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("state", name);
		return ".hotShop.productList";
	}
	
	//쇼핑몰 전체후기 리스트
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList() throws Exception {
		return ".hotShop.shopReviewList";
	}
	
	//구입 페이지
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	
	//상품 아티클
	@RequestMapping(value="/hotShop/shopArticle")
	public String shopArticle(
			@RequestParam int pdnum
			,Model model
			) {
		System.out.println(pdnum);
		Map<String, Object> map=new HashMap<>();
		HotShop dto=null;
		map.put("listOrArticle", 1);
		map.put("pdnum", pdnum);
		dto=service.productArticle(map);
		model.addAttribute("dto", dto);
		return ".hotShop.shopArticle";
	}
	
	//INSERT UPDATE 폼 이동
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="pdnum", defaultValue="0") int pdnum
			,@RequestParam(value="mode" ,defaultValue="created") String mode
			,Model model
			) {
		Map<String, Object> map=new HashMap<>();
		if(mode.equalsIgnoreCase("update")) {
			HotShop dto=null;
			map.put("listOrArticle", 1);
			map.put("pdnum", pdnum);
			dto=service.productArticle(map);
			model.addAttribute("mode", mode);
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("mode", mode);
		}
		return ".hotShop.created";
	}
	
	
	//created submit
	@RequestMapping(value="/hotShop/created.ok",  method=RequestMethod.POST)
	public String createdSubmit(
			HotShop dto
			,@RequestParam(defaultValue="created") String mode
			,@RequestParam(defaultValue="") String imgSaveFilename
			,HttpSession session
			,Model model
			) throws Exception {
		System.out.println(dto.getPdnum());
		System.out.println(imgSaveFilename);
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"shopProduct";
		if(mode.equalsIgnoreCase("update")) {
			System.out.println("들어와라");
			file.doFileDelete(imgSaveFilename, pathname);
			service.productUpdate(dto, pathname);
		}else {
			service.insertProductList(dto, pathname);			
		}
		
		return "redirect:/hotShop/productList";
	}
	
	@RequestMapping(value="/hotShop/schedule", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> schedule(
			Schedule dto
			,Model model
			) {
		List<Schedule> scheduleList=null;
		service.insertSchedule(dto);
		scheduleList=service.readSchedules();
		Map<String, Object> map=new HashMap<>();
		map.put("scheduleList", scheduleList);
		return map;
	}
	
	@RequestMapping(value="/hotShop/productInlist")
	public String productInListForm() {
		List<Schedule> scheduleList=null;
		scheduleList=service.readSchedules();
		
		return ".hotShop.productIn";
	}
}
