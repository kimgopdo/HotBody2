package com.hotbody.hotShop.board;



public class HotShop {
	private int pdInCode;//상품코드
	private String bci;//대분류
	private String sci;//소분류
	private String pdName;//상품명
	private String pdSumContent;//상품메인내용
	private int pdPrice;//상품가격
	private String content;//상품하단 내용
	private String pdNutrient;//영양성분표시
	private String pdArea;//생산지
	private String pdStMethod;//보관방법
	private String pdType;//상품유형
	private String pdRawName;//상품원재료명
	private String pdCreated;//상품등록날짜
	private String pdDelRule;//배송정책(이미지로대체)
	private String pdRawPrice;//상품원가
	private String pdExDate;//유통기한

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPdInCode() {
		return pdInCode;
	}
	public void setPdInCode(int pdInCode) {
		this.pdInCode = pdInCode;
	}
	public String getBci() {
		return bci;
	}
	public void setBci(String bci) {
		this.bci = bci;
	}
	public String getSci() {
		return sci;
	}
	public void setSci(String sci) {
		this.sci = sci;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdSumContent() {
		return pdSumContent;
	}
	public void setPdSumContent(String pdSumContent) {
		this.pdSumContent = pdSumContent;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getPdNutrient() {
		return pdNutrient;
	}
	public void setPdNutrient(String pdNutrient) {
		this.pdNutrient = pdNutrient;
	}
	public String getPdArea() {
		return pdArea;
	}
	public void setPdArea(String pdArea) {
		this.pdArea = pdArea;
	}
	public String getPdStMethod() {
		return pdStMethod;
	}
	public void setPdStMethod(String pdStMethod) {
		this.pdStMethod = pdStMethod;
	}
	public String getPdType() {
		return pdType;
	}
	public void setPdType(String pdType) {
		this.pdType = pdType;
	}
	public String getPdRawName() {
		return pdRawName;
	}
	public void setPdRawName(String pdRawName) {
		this.pdRawName = pdRawName;
	}
	public String getPdCreated() {
		return pdCreated;
	}
	public void setPdCreated(String pdCreated) {
		this.pdCreated = pdCreated;
	}
	public String getPdDelRule() {
		return pdDelRule;
	}
	public void setPdDelRule(String pdDelRule) {
		this.pdDelRule = pdDelRule;
	}
	public String getPdRawPrice() {
		return pdRawPrice;
	}
	public void setPdRawPrice(String pdRawPrice) {
		this.pdRawPrice = pdRawPrice;
	}
	public String getPdExDate() {
		return pdExDate;
	}
	public void setPdExDate(String pdExDate) {
		this.pdExDate = pdExDate;
	}
	
}
