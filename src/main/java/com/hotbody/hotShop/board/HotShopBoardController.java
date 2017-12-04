package com.hotbody.hotShop.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("hotShop.board")
public class HotShopBoardController {
	
	@RequestMapping("/hotShop/list")
	public String productList() {
		return "";
	}
	@RequestMapping("/hotShop/list/article")
	public String productArticleForm() {
		return "";
	}
}
