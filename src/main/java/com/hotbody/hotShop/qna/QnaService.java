package com.hotbody.hotShop.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public int insertQna(Qna dto, String mode);
	public List<Qna> listQna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Qna readQna(int pdQCode);
	public int updateQna(Qna dto);
	public int deleteQna(int pdQCode, String userId);
	public List<Qna> listQnaArticle(Map<String, Object> map);
}