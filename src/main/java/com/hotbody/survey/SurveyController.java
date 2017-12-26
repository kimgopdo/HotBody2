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

import com.hotbody.dietClass.DietClass;
import com.hotbody.dietClass.DietClassService;
import com.hotbody.member.SessionInfo;

@Controller("survey.surveyController")
public class SurveyController {
	
	@Autowired
	private SurveyService service;
	
	@Autowired
	private DietClassService serviceD;
	
	@RequestMapping(value="/survey/surveyForm")
	public String surveyForm(
					@RequestParam(value="num", defaultValue="1") int qorder,
					Model model,
					HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId=null;
		
		if(info!=null)
			userId = info.getUserId();
		
		if(service.readResult(userId)!=null)
			service.deleteResult(userId);
		
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
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = null;
		
		if(info==null) {
			userId = null;
		} else {
			userId = info.getUserId();
		}
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
		
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="survey/result")
	public String surveyResult(HttpSession session,
								Model model) {
		int age=0, score=0;
		double tall=0, weight = 0, bbody=0;
		double bmi=0, standard = 0;
		String gender = null;
		String msg = null;
		int will=0, pro=0, habits=0, afford=0;
		String userId = null;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info!=null)
			userId = info.getUserId();
		List<Survey> list = service.readResult(userId);
		
		for(Survey dto:list) {
			if(dto.getQuestionType().equals("tall"))
				tall=(double)Integer.parseInt(dto.getQuestionAnswer());
			else if(dto.getQuestionType().equals("weight"))
				weight = (double)Integer.parseInt(dto.getQuestionAnswer());
			else if(dto.getQuestionType().equals("age"))
				age = Integer.parseInt(dto.getQuestionAnswer());
			else if(dto.getQuestionType().equals("gender")) 
				gender = dto.getQuestionAnswer();
			
			if(dto.getSoro()==0) {
				Map<String, Object> map = new HashMap<>();
				map.put("questioncode", dto.getQuestionCode());
				map.put("exOrder", Integer.parseInt(dto.getQuestionAnswer()));
				
				score = service.matchEx(map);
				
				if(dto.getQuestionType().equals("will"))
					will+=score;
				else if(dto.getQuestionType().equals("pro"))
					pro+=score;
				else if(dto.getQuestionType().equals("afford"))
					afford+=score;
				else if(dto.getQuestionType().equals("habits"))
					habits+=score;
			}
			
		}
				
		//////////////////////////////////////////////////////////////
		//BMI지수 :  몸무게(kg) ÷ (신장(m) x 신장(m))
		bmi = weight/(tall*tall*0.0001);
		bmi = Math.round(bmi*100d)/100d;
		//표준체중 : 표준체중 =  남자 : 키(m)×키(m)×22
		//여자 : 키(m)×키(m)×21
		if(gender.equals("2"))
			standard = (tall*tall*0.0001)*22;
		else if(gender.equals("1"))
			standard = (tall*tall*0.0001)*21;
		standard = Math.round(standard*100d)/100d;
		//기초대사량 : 655 + {9.6*체중(kg)} + {1.8*신장(cm)} - (4.7*나이) 
		bbody = 655 + (9.6*weight)+(1.8*tall)-(4.7*age);
		bbody = Math.round(bbody*100d)/100d;
		weight = Math.round(weight*100d)/100d;
		//////////////////////////////////////////////////////////////
		
		//////////////////////////////////////////////////////////////
		if(bmi<18.5)
			msg = "저체중";
		else if(18.5<=bmi && bmi<23)
			msg = "정상체중";
		else if(23<=bmi && bmi<25)
			msg = "과체중";
		else if(25<=bmi && bmi<40)
			msg = "비만";
		else if(bmi>=40)
			msg = "심각한 비만";
		//////////////////////////////////////////////////////////////
		
		int level=0;
		if(msg.equals("저체중")||msg.equals("정상체중"))
			level=3;
		else if(msg.equals("비만")||msg.equals("심각한 비만"))
			level=1;
		else
			level=2;
		
		List<DietClass> recommandList = serviceD.listByLevel(level);
		
		model.addAttribute("recommandList", recommandList);
		model.addAttribute("bmi", bmi);
		model.addAttribute("bbody", bbody);
		model.addAttribute("standard", standard);
		model.addAttribute("will", will);
		model.addAttribute("habits", habits);
		model.addAttribute("pro", pro);
		model.addAttribute("afford", afford);
		model.addAttribute("weight", weight);
		model.addAttribute("msg", msg);
		
		return ".survey.surveyResult";
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
				else if(dto.getQuestionType().equals("tall"))
					dto.setQuestionType("키");
				else if(dto.getQuestionType().equals("weight"))
					dto.setQuestionType("몸무게");
				else if(dto.getQuestionType().equals("age"))
					dto.setQuestionType("나이");
				else if(dto.getQuestionType().equals("gender"))
					dto.setQuestionType("성별");
				else
					dto.setQuestionType("없음");
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









