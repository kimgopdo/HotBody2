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
	public Map<String, Object> surveySubmit(@RequestParam Map<String, String> dataMap,
											@RequestParam int count) {
		
		Survey dto = new Survey();
		
		int qOrder=0;
		int exOrder=0;
		
		for(int a=1;a<=count;a++) {
			for(Map.Entry<String, String> entry : dataMap.entrySet()) {
				if(entry.getKey().contains("qOrder")) {
					System.out.println("오다"+entry.getValue());
					qOrder = Integer.parseInt(entry.getValue());
					dto.setqOrder(qOrder);
				} else if(entry.getKey().contains("qContent"+qOrder+".")) {
					dto.setqContent(entry.getValue());
					System.out.println("확인 !!!!!!!!!!!!!!!"+dto.getqContent()+":"+dto.getqOrder());
				} else if(entry.getKey().contains("sOrO"+qOrder+".")) {
					dto.setsOrO(Integer.parseInt(entry.getValue()));
					System.out.println("주?객?"+dto.getsOrO());
				} else if(entry.getKey().contains("qType"+qOrder+".")) {
					dto.setqType(entry.getValue());
					System.out.println("질문유형"+dto.getqType());
				}
				
				//주관식이면 바로 insert
				if(dto.getqContent() != null && dto.getsOrO()==1) {
					System.out.println(a+" : insert할꺼임(주ㅅ관식)");
					dto.setqContent(null);
					//service.insertSurvey(dto);
				}
				
				//객관식인경우 보기도 가져와야한다.
				else if(dto.getqContent() != null && dto.getsOrO()==0) {	
					if (entry.getKey().contains("exOrder"+qOrder+".")) {
						exOrder = Integer.parseInt(entry.getValue());
						dto.setExOrder(exOrder);
						System.out.println("보기번호"+exOrder);
					} else if (entry.getKey().contains("exContent"+qOrder+"."+exOrder)) {
						dto.setExContent(entry.getValue());
						System.out.println("보기내용"+dto.getExContent());
					} else if (entry.getKey().contains("exScore"+qOrder+"."+exOrder)) {
						dto.setExScore(Integer.parseInt(entry.getValue()));
						System.out.println("보기점수"+dto.getExScore());
					}
					
					if(dto.getExContent() !=null && dto.getExScore() != 0) {
						//service.insertSurvey(dto);
						System.out.println(a+" : insert할꺼임(객ㅅ관식)");
						dto.setExContent(null);
						dto.setExScore(0);
					}
					//service.insertSurvey(dto);
				}
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("state", "true");
		return map;
	}

}
