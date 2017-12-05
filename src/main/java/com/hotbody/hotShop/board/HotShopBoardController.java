package com.hotbody.hotShop.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller("hotShop.board")
public class HotShopBoardController {
	
	@RequestMapping("/hotShop/productList")
	public String productList(
			@RequestParam String state
			) {
		
		
		
		
		
		return ".hotShop.productList";
	}
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList() {
		return ".hotShop.shopReviewList";
	}
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	@RequestMapping(value="/hotShop/shopArticle")
	public String shopArticle() {
		return ".hotShop.shopArticle";
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
