package com.hotbody.hotShop.board;

public class Payment {
	private int totalPay;//총금액
	private String userId;
	private int milelagePay;
	private int classNum;
	private int amount;
	private int pdnum;
	private String takerName;
	private String zip;
	private String takerAddr1;
	private String takerAddr2;
	private String takerTel;
	private String takerPhone;
	
	public String getTakerName() {
		return takerName;
	}
	public void setTakerName(String takerName) {
		this.takerName = takerName;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTakerAddr1() {
		return takerAddr1;
	}
	public void setTakerAddr1(String takerAddr1) {
		this.takerAddr1 = takerAddr1;
	}
	public String getTakerAddr2() {
		return takerAddr2;
	}
	public void setTakerAddr2(String takerAddr2) {
		this.takerAddr2 = takerAddr2;
	}
	public String getTakerTel() {
		return takerTel;
	}
	public void setTakerTel(String takerTel) {
		this.takerTel = takerTel;
	}
	public String getTakerPhone() {
		return takerPhone;
	}
	public void setTakerPhone(String takerPhone) {
		this.takerPhone = takerPhone;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMilelagePay() {
		return milelagePay;
	}
	public void setMilelagePay(int milelagePay) {
		this.milelagePay = milelagePay;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
	
	
	
}
