package com.hotbody.qna2;

import java.util.List;
import java.util.Map;

public interface Qna2Service {
	public int insertQna2(Qna2 dto);
	public int dataCount(Map<String, Object> map);
	public List<Qna2> listQna2(Map<String, Object> map);
	//게시물보기
	public Qna2 readQna2(int qna2Code);
	
	public Qna2 preReadQna2(Map<String, Object> map);
	public Qna2 nextReadQna2(Map<String, Object> map);
	
	public int updateHitCount(int qna2Code);
	
	public int updateQna2(Qna2 dto);
	public int deleteQna2(int qna2Code);


	
	
	
}
