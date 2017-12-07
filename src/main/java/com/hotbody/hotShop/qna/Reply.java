package com.hotbody.hotShop.qna;

public class Reply {
	private int replyNum, pdQCode;
	private String userId, userName;
	private String pdQContent, pdQCreated;
	private int answer;
	private int answerCount;
	
	public int getPdQCode() {
		return pdQCode;
	}
	public void setPdQCode(int pdQCode) {
		this.pdQCode = pdQCode;
	}
	public String getPdQContent() {
		return pdQContent;
	}
	public void setPdQContent(String pdQContent) {
		this.pdQContent = pdQContent;
	}
	public String getPdQCreated() {
		return pdQCreated;
	}
	public void setPdQCreated(String pdQCreated) {
		this.pdQCreated = pdQCreated;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setRelplyNum(int replyNum) {
		this.replyNum = replyNum;
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
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	
}
