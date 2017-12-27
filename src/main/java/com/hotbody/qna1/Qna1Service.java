package com.hotbody.qna1;

import java.util.List;
import java.util.Map;

public interface Qna1Service {
	public int insertQna1(Qna1 dto);
	public int dataCount(Map<String, Object> map);	
	public List<Qna1> listQna1(Map<String, Object> map);
	
	public Qna1 readQna1(int qna1Code);
	
	public Qna1 preReadQna1(Map<String, Object> map);
	public Qna1 nextReadQna1(Map<String, Object> map);
	
	public int updateHitCount(int qna1Code);
	
	public int updateQna1(Qna1 dto);
	
	public int deleteQna1(int qna1Code);
	
	
	
}
