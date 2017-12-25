package com.hotbody.survey;

import java.util.List;
import java.util.Map;

public interface SurveyService {
	public int insertSurvey(Survey dto);
	public int insertEx(Survey dto);
	public int surveyCount();
	public int qSeq();
	public List<Survey> listSurvey();
	public List<Survey> readEx();
	public Survey readSurvey(int qorder);
	public int updateOrder(Map<String, Object> map);
	public int deleteSurvey(int questionCode);
	public int insertResult(Survey dto);
	public List<Survey> readResult(String userId);
	public int matchEx(Map<String, Object> map);
	public int deleteResult(String userId);
}
