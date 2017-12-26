package com.hotbody.hotShop.disuse;

public class Disuse {
	private int pdDisCode; //폐기코드(시퀀스)
	private int pdDisNum; // 폐기수량
	private String pdDisDate; // 폐기날짜
	private String pdDisReason; // 폐기사유
	private int pdnum; // 상품번호
	private String pdName; // 상품명
	private String useriId; // 아이디
	private int pdRawPrice; // 원가
	private int pdDisAmt = pdDisNum * pdRawPrice; // 폐기금액(소비자가)
	private int pdStCount;
	
	public int getPdRawPrice() {
		return pdRawPrice;
	}
	public void setPdRawPrice(int pdRawPrice) {
		this.pdRawPrice = pdRawPrice;
	}
	public int getPdStCount() {
		return pdStCount;
	}
	public void setPdStCount(int pdStCount) {
		this.pdStCount = pdStCount;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getUseriId() {
		return useriId;
	}
	public void setUseriId(String useriId) {
		this.useriId = useriId;
	}
	public int getPdDisCode() {
		return pdDisCode;
	}
	public void setPdDisCode(int pdDisCode) {
		this.pdDisCode = pdDisCode;
	}
	public int getPdDisNum() {
		return pdDisNum;
	}
	public void setPdDisNum(int pdDisNum) {
		this.pdDisNum = pdDisNum;
	}
	public String getPdDisDate() {
		return pdDisDate;
	}
	public void setPdDisDate(String pdDisDate) {
		this.pdDisDate = pdDisDate;
	}
	public String getPdDisReason() {
		return pdDisReason;
	}
	public void setPdDisReason(String pdDisReason) {
		this.pdDisReason = pdDisReason;
	}
	public int getPdDisAmt() {
		return pdDisAmt;
	}
	public void setPdDisAmt(int pdDisAmt) {
		this.pdDisAmt = pdDisAmt;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
}
