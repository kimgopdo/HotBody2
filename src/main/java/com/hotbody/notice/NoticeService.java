package com.hotbody.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public int dataCount(Map<String, Object> map);
	
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public int updateHitCount(int noticeCode);
 	
	public Notice readNotice(int noticeCode);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(int noticeCode, String pathname);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<Reply> listReplyAnswer(	int answer);
	public int replyCountAnswer(int answer);
	
}
