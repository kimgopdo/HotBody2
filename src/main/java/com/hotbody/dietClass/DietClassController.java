package com.hotbody.dietClass;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("user2.userController")
public class DietClassController {
	@RequestMapping(value="/dietClass/list")
	public String classList() {
		return ".dietClass.list";
	}
	
	
	@RequestMapping(value="/dietClass/article")
	public String classArticle() {
		return ".dietClass.article";
	}
	
	@RequestMapping(value="/dietClass/payment")
	public String classPayment() {
		return ".dietClass.payment";
	}
	
	@RequestMapping(value="dietClass/survey")
	public String classSurvey() {
		return "dietClass/surveyForm";
	}
}
