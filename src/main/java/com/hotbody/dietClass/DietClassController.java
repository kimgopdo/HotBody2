package com.hotbody.dietClass;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("dietClass.dietClassController")
public class DietClassController {
	@Autowired
	private DietClassService service;
	
	@RequestMapping(value="/dietClass/insert")
	public String insertdietClass(DietClass dto,
										HttpSession session){
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"dietClass";
		
		System.out.println(dto.getClassName());
		System.out.println(dto.getCllevel());
		System.out.println(pathname);
		
		service.insertDietClass(dto,pathname);
		return ".dietClass.list";
	}
	
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
	
	@RequestMapping(value="dietClass/created")
	public String classCreated() {
		return ".dietClass.created";
	}
	
}
