package com.hotbody.mocofb;

import java.util.List;
import java.util.Map;

public interface FBService {
	public int insertFB(FB dto, String pathname);
	public List<FB>listFB(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public FB readFB(int moFBNum);
	public int hitCount(int moFBNum);
	public FB preReadFB(Map<String,Object> map);
	public FB nextReadFB(Map<String,Object> map);
	public int updateFB(FB dto);
	public int deleteFB(int moFBNum);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String,Object> map);
	public int replyDataCount(Map<String,Object>map);
	public int deleteReply(Map<String,Object> map);
	
}
