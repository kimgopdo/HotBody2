package com.hotbody.survey;

public class Survey {
	private int qCode;
	private String qContent, userId;
	
	private int exNum, exScore;
	private String exContent;
	
	private int tall, weight, bmi, bbody;

	public int getqCode() {
		return qCode;
	}

	public void setqCode(int qCode) {
		this.qCode = qCode;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
	
}
