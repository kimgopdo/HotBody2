package com.hotbody.hotShop.review;

public class Reply {
	private int CNUM, reviewCode;
	private String userId, userName;
	private String content, created;
	
	public int getCNUM() {
		return CNUM;
	}
	public void setCNUM(int cNUM) {
		CNUM = cNUM;
	}
	public int getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
}
