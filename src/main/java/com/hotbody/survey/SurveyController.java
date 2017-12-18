package com.hotbody.survey;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("survey.surveyController")
public class SurveyController {
	
	@RequestMapping(value="/survey/surveyForm")
	public String surveyForm() {
		return ".survey.surveyForm";
	}
	
	@RequestMapping(value="/survey/created")
	public String surveycreated() {
		return ".survey.created";
	}
	
	@RequestMapping(value="/survey/submit")
	public Map<String, Object> surveySubmit(Survey dto) {
		Map<String, Object> map = new HashMap<>();
		return map;
	}

}
