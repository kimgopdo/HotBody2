package com.hotbody.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int insertEvent(Event dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	public List<Event> listEventTop();
	public int updateHitCount(int eventCode);
 	public Event readEvent(int eventCode);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	public int updateEvent(Event dto, String pathname);
	public int deleteEvent(int eventCode, String pathname);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(	int answer);
	public int replyCountAnswer(int answer);
	
}
