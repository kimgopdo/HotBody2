package com.hotbody.hotShop.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotbody.common.FileManager;
@Controller("hotShop.board")
public class HotShopBoardController {
	@Autowired
	private HotShopService service;
	@Autowired
	FileManager file;
	
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
		list=service.productList();
		
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
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList() throws Exception {
		return ".hotShop.shopReviewList";
	}
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	@RequestMapping(value="/hotShop/shopArticle")
	public String shopArticle(
			@RequestParam int pdnum
			,Model model
			) {
		System.out.println(pdnum);
		HotShop dto=null;
		dto=service.productArticle(pdnum);
		model.addAttribute("dto", dto);
		return ".hotShop.shopArticle";
	}
	
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="pdnum", defaultValue="0") int pdnum
			,@RequestParam(value="mode" ,defaultValue="created") String mode
			,Model model
			) {
		if(mode.equalsIgnoreCase("update")) {
			HotShop dto=null;
			dto=service.productArticle(pdnum);
			model.addAttribute("mode", mode);
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("mode", mode);
		}
		return ".hotShop.created";
	}
	
	
	
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
		
		return "redirect:/hotShop";
	}
}
