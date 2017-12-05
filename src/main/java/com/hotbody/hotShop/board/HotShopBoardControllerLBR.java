package com.hotbody.hotShop.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("hotShop.board2")
public class HotShopBoardControllerLBR {
	
	@RequestMapping("/hotShop/productList")
	public String productArticleForm() {
		return ".hotShop.productList";
	}
}
