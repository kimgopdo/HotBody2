package com.hotbody.hotShop.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller("hotShop.board")
public class HotShopBoardController {
	
	@RequestMapping("/hotShop/reviewList")
	public String productList() {
		
		
		
		
		
		return ".hotShop.shopList";
	}
	@RequestMapping("/hotShop/shopArticle")
	public String shopArticleForm() {
		return ".hotShop.shopArticle";
	}
	@RequestMapping("/hotShop/productList")
	public String productArticleForm() {
		return "";
	}
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.GET)
	public String createdForm() {
		return ".hotShop.created";
	}
	@RequestMapping(value="/hotShop/created.ok",  method=RequestMethod.POST)
	public String createdSubmit() {
		return "redirect:/hotShop/shopList";
	}
}
