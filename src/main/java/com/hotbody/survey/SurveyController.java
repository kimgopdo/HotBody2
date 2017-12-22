package com.hotbody.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.member.SessionInfo;

@Controller("survey.surveyController")
public class SurveyController {
	
	@Autowired
	private SurveyService service;
	
	@RequestMapping(value="/survey/surveyForm")
	public String surveyForm(
					@RequestParam(value="num", defaultValue="1") int qorder,
					Model model) {
		List<Survey> list = service.listSurvey();
		List<Survey> exList = service.readEx();
		int count = service.surveyCount();
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("exList", exList);
		return ".survey.surveyForm";
	}
	
	@RequestMapping(value="/survey/submit")
	@ResponseBody
	public Map<String, Object> surveySubmit(@RequestParam Map<String, String> dataMap,
									HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		int count = service.surveyCount();
		
		for(int a=1;a<=count;a++) {
			for(Map.Entry<String, String> entry : dataMap.entrySet()) {
				if(entry.getKey().contains("questionAnswer."+a+".")) {
					Survey dto = service.readSurvey(a);
					dto.setQuestionCode(dto.getQuestionCode());
					dto.setQuestionAnswer(entry.getValue());
					dto.setUserId(userId);
					service.insertResult(dto);
				}
			}
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="survey/result")
	public String surveyResult() {
		return "";
	}
	
	@RequestMapping(value="/survey/created")
	public String surveycreated(Model model) {
		int count = service.surveyCount();
		List<Survey> list = service.listSurvey();
		List<Survey> exList = service.readEx();
		
		for(Survey dto : list) {
			if(dto.getQuestionType()!=null) {
				if(dto.getQuestionType().equals("pro"))
					dto.setQuestionType("전문성");
				else if(dto.getQuestionType().equals("afford"))
					dto.setQuestionType("시간적여유");
				else if(dto.getQuestionType().equals("habits"))
					dto.setQuestionType("식습관");
				else if(dto.getQuestionType().equals("will"))
					dto.setQuestionType("의지");
			}
		}
		model.addAttribute("surveyList", list);
		model.addAttribute("count", count+1);
		model.addAttribute("exList", exList);
		return ".survey.created";
	}
	
	@RequestMapping(value="/survey/createdSubmit")
	@ResponseBody
	public Map<String, Object> surveyCreatedSubmit(Survey dto,
											String[] exContent,
											int[] exOrder,
											int[] exScore) {
		int qSeq = service.qSeq();
		dto.setQuestionCode(qSeq);
		service.insertSurvey(dto);
		
		if(dto.getSoro()==0) {
			for(int a=0;a<exOrder.length;a++) {
				dto.setExContent(exContent[a]);
				dto.setExOrder(exOrder[a]);
				dto.setExScore(exScore[a]);
				service.insertEx(dto);
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		List<Survey> list = service.listSurvey();
		map.put("surveyList", list);
		map.put("state", "true");
		return map;
	}
	
	@RequestMapping(value="/survey/updateOrder")
	@ResponseBody
	public Map<String, Object> updateOrder(@RequestParam int questionOrder,
											@RequestParam int type){
		Map<String, Object> model = new HashMap<>();
		Map<String, Object> updateMap = new HashMap<>();
		
		Survey dto = service.readSurvey(questionOrder);
		int last = service.surveyCount();
		
		if(type==1) {
			//제일마지막으로
			if(questionOrder==last) {
				model.put("state", "last");
				return model;
			}
			for(int a=questionOrder+1;a<=last;a++) {
				Survey sdto = service.readSurvey(a);
				updateMap.put("questionCode", sdto.getQuestionCode());
				updateMap.put("questionOrder", a-1);
				service.updateOrder(updateMap);
			}
			updateMap.put("questionCode", dto.getQuestionCode());
			updateMap.put("questionOrder", last);
			service.updateOrder(updateMap);
		} else if(type==2){
			//한칸아래로
			if(questionOrder==last) {
				model.put("state", "last");
				return model;
			}
			Survey sdto = service.readSurvey(questionOrder+1);
			updateMap.put("questionCode", sdto.getQuestionCode());
			updateMap.put("questionOrder", questionOrder);
			service.updateOrder(updateMap);
			
			updateMap.put("questionCode", dto.getQuestionCode());
			updateMap.put("questionOrder", questionOrder+1);
			service.updateOrder(updateMap);
		} else if (type==3) {
			//한칸위로
			if(questionOrder==1) {
				model.put("state", "first");
				return model;
			}
			Survey sdto = service.readSurvey(questionOrder-1);
			updateMap.put("questionCode", sdto.getQuestionCode());
			updateMap.put("questionOrder", questionOrder);
			service.updateOrder(updateMap);
			
			updateMap.put("questionCode", dto.getQuestionCode());
			updateMap.put("questionOrder", questionOrder-1);
			service.updateOrder(updateMap);
			
		} else if (type==4) {
			//제일 위로
			if(questionOrder==1) {
				model.put("state", "first");
				return model;
			}
			for(int a=questionOrder-1;a>=1;a--) {
				Survey sdto = service.readSurvey(a);
				updateMap.put("questionCode", sdto.getQuestionCode());
				updateMap.put("questionOrder", a+1);
				service.updateOrder(updateMap);
			}
			updateMap.put("questionCode", dto.getQuestionCode());
			updateMap.put("questionOrder", 1);
			service.updateOrder(updateMap);
		}
		
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/survey/delete")
	@ResponseBody
	public Map<String, Object> deleteSurvey(@RequestParam int questionOrder){
		Survey dto = service.readSurvey(questionOrder);
		int last = service.surveyCount();
		Map<String, Object> updateMap = new HashMap<>();
		
		service.deleteSurvey(dto.getQuestionCode());
		
		for(int a=last;a>questionOrder;a--) {
			Survey sdto = service.readSurvey(a);
			updateMap.put("questionCode", sdto.getQuestionCode());
			updateMap.put("questionOrder", a-1);
			service.updateOrder(updateMap);
		}
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("state", "true");
		return model;
	}

}









