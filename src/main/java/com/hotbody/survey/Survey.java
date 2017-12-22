package com.hotbody.survey;

public class Survey {
	private int questionCode, questionOrder, soro;
	private String questionContent, userId, questionType;
	
	private int exNum, exScore, exOrder;
	private String exContent;
	private String questionAnswer;
	
	private int tall, weight, bmi, bbody;
	
	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public int getQuestionOrder() {
		return questionOrder;
	}

	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}

	public int getSoro() {
		return soro;
	}

	public void setSoro(int soro) {
		this.soro = soro;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getExNum() {
		return exNum;
	}

	public void setExNum(int exNum) {
		this.exNum = exNum;
	}

	public int getExScore() {
		return exScore;
	}

	public void setExScore(int exScore) {
		this.exScore = exScore;
	}

	public int getExOrder() {
		return exOrder;
	}

	public void setExOrder(int exOrder) {
		this.exOrder = exOrder;
	}

	public String getExContent() {
		return exContent;
	}

	public void setExContent(String exContent) {
		this.exContent = exContent;
	}

	public int getTall() {
		return tall;
	}

	public void setTall(int tall) {
		this.tall = tall;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getBmi() {
		return bmi;
	}

	public void setBmi(int bmi) {
		this.bmi = bmi;
	}

	public int getBbody() {
		return bbody;
	}

	public void setBbody(int bbody) {
		this.bbody = bbody;
	}

	public String getQuestionAnswer() {
		return questionAnswer;
	}

	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}

}
