package com.hotbody.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;
@Service("survey.surveyService")
public class SurveyServiceImpl implements SurveyService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertSurvey(Survey dto) {
		int result = 0;
		try {
			int qSeq = dao.selectOne("survey.qSeq");
			dto.setqCode(qSeq);
			result = dao.insertData("survey.insertSurvey", dto);
			if(dto.getsOrO()==0) {
				int exSeq = dao.selectOne("survey.exSeq");
				dto.setExNum(exSeq);
				dao.insertData("survey.insertEx", dto);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
