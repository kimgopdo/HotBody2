package com.hotbody.dietClass;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DietClassController {
	@RequestMapping(value="/dietClass/list")
	public String classList() {
		return ".dietClass.list";
	}
	
	@RequestMapping(value="/dietClass/article")
	public String classArticle() {
		return ".dietClass.article";
	}
}
