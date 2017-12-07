package com.hotbody.dietClass;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("dietClass.dietClassController")
public class DietClassController {
	
	@Autowired
	private DietClassService service;
	
	@RequestMapping(value="/dietClass/list")
	public String classList(HttpServletRequest req) {
		
		List<DietClass> list = service.listOnClass();
		//List<CProgram> clist = new ArrayList<>();

		/*
		for(DietClass dto : list) {
			clist = service.readcProgram(dto.getClassNum());
			map.put("onList", clist);
		}
		*/
		req.setAttribute("onClass", list);
		
		return ".dietClass.list";
	}
	
	@RequestMapping(value="dietClass/created")
	public String classCreated(HttpServletRequest req) {
		
		List<CProgram> list = service.listcProgram();
		req.setAttribute("program", list);
		
		return ".dietClass.created";
	}
	
	@RequestMapping(value="/dietClass/insert")
	@ResponseBody
	public Map<String, Object> insertdietClass(DietClass dto,
										HttpSession session){
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"dietClass";
		
		service.insertDietClass(dto,pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
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
	
	
	/*
	 * 클래스 프로그램 관련
	 */
	
	@RequestMapping(value="/cprogram/created")
	public String cprogramCreated() {
		return ".dietClass.classProgram.created";
	}
	
	@RequestMapping(value="/cprogram/insert")
	@ResponseBody
	public Map<String, Object> insertcProgram(CProgram dto,
										HttpSession session,
										HttpServletRequest req){
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"cProgram";
		
		service.insertcProgram(dto, pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
}
