package com.hotbody.hotShop.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public int insertReview(Review dto, String pathName);
	public List<Review> listReview(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Review readReview(int reviewCode);
	public int deleteReview(int reviewCode, String pathname, String userId);
	
	public int insertReply(Reply dto);
	public Reply listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
}
