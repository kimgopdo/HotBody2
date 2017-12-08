package com.hotbody.hotShop.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public int insertQnA(Qna dto);
	public List<Qna> listQna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
