package com.hotbody.survey;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("survey.surveyController")
public class SurveyController {
	
	@Autowired
	private SurveyService service;
	
	@RequestMapping(value="/survey/surveyForm")
	public String surveyForm() {
		return ".survey.surveyForm";
	}
	
	@RequestMapping(value="/survey/created")
	public String surveycreated() {
		return ".survey.created";
	}
	
	@RequestMapping(value="/survey/submit")
	@ResponseBody
	public Map<String, Object> surveySubmit(@RequestParam Map<String, String> dataMap) {
		Survey dto = new Survey();
		Map<String, Object> map = new HashMap<>();
		return map;
	}

}
