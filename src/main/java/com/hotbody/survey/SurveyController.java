package com.hotbody.survey;

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
	public String surveySubmit() {
		return "";
	}

}
