package com.hotbody.survey;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("survey.surveyService")
public class SurveyServiceImpl implements SurveyService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int qSeq() {
		int qSeq = 0;
		try {
			qSeq = dao.selectOne("survey.qSeq");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qSeq;
	}
	
	@Override
	public int insertSurvey(Survey dto) {
		try {
			dao.insertData("survey.insertSurvey", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto.getQuestionCode();
	}

	@Override
	public int surveyCount() {
		int count = 0;
		try {
			count = dao.selectOne("survey.surveyCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int insertEx(Survey dto) {
		int result = 0;
		try {
			result = dao.insertData("survey.insertEx", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Survey> listSurvey() {
		List<Survey> list = null;
		try {
			list = dao.selectList("survey.listSurvey");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Survey> readEx() {
		List<Survey> list = null;
		try {
			list = dao.selectList("survey.readEx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Survey readSurvey(int qorder) {
		Survey dto = null;
		try {
			dto = dao.selectOne("survey.readSurvey", qorder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateOrder(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.updateData("survey.updateOrder", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteSurvey(int questionCode) {
		int result = 0;
		try {
			result = dao.deleteData("survey.deleteEx", questionCode);
			dao.deleteData("survey.deleteSurveyResult", questionCode);
			dao.deleteData("survey.deleteSurvey", questionCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertResult(Survey dto) {
		int result=0;
		try {
			result = dao.insertData("survey.insertResult", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
