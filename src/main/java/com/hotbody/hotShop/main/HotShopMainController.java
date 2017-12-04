package com.hotbody.hotShop.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("orderMainController")
public class HotShopMainController {
	@RequestMapping(value="/hotShop")
	public String orderMain() throws Exception{
		return ".shopLayout";
	}
}
