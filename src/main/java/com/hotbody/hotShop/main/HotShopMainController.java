package com.hotbody.hotShop.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("hotShop.Controller")
public class HotShopMainController {
	@RequestMapping(value="/hotShop")
	public String hotShopMain() throws Exception{
		return ".shopLayout";
	}
}
