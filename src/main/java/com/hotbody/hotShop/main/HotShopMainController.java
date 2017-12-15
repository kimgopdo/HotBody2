package com.hotbody.hotShop.main;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller("hotShop.Controller")
public class HotShopMainController {
	
	@Autowired
	HotShopMainService service;
	
	@RequestMapping(value="/hotShop")
	public String hotShopMain(Model model) throws Exception{
		return ".shopLayout";
	}
	@RequestMapping(value="/hotShop/menuCall")
	@ResponseBody
	public Map<String, Object> menuCall(){
		List<HotBodyMenu> bclList=null;
		List<HotBodyMenu> sciList=null;
		bclList=service.bclMenuData();
		sciList=service.sciMenuData();
		Map<String, Object> map=new HashMap<>();
		map.put("bclList", bclList);
		map.put("sciList", sciList);
		return map;
	}
}
