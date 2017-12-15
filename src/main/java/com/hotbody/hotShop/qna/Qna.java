package com.hotbody.hotShop.qna;

public class Qna {
	private int pdQCode; // 시퀀스
	private String pdQSubject;
	private String userName;
	private int pdQDepth;
	private String pdQCreated;
	private String pdQContent;
	private int pdNum;
	private String userId;
	private int listNum;
	private int answerNum;
	private int groupNum;
	
	public int getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getPdQCode() {
		return pdQCode;
	}
	public void setPdQCode(int pdQCode) {
		this.pdQCode = pdQCode;
	}
	public String getPdQSubject() {
		return pdQSubject;
	}
	public void setPdQSubject(String pdQSubject) {
		this.pdQSubject = pdQSubject;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPdQDepth() {
		return pdQDepth;
	}
	public void setPdQDepth(int pdQDepth) {
		this.pdQDepth = pdQDepth;
	}
	public String getPdQCreated() {
		return pdQCreated;
	}
	public void setPdQCreated(String pdQCreated) {
		this.pdQCreated = pdQCreated;
	}
	public String getPdQContent() {
		return pdQContent;
	}
	public void setPdQContent(String pdQContent) {
		this.pdQContent = pdQContent;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
}
