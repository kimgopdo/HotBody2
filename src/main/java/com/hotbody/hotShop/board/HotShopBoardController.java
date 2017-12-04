package com.hotbody.hotShop.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("hotShop.board")
public class HotShopBoardController {
	
	@RequestMapping("/hotShop/reviewList")
	public String productList() {
		
		
		
		
		
		return ".hotShop.shopList";
	}
	@RequestMapping("/hotShop/productList")
	public String productArticleForm() {
		return "";
	}
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
}
