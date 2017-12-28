package com.hotbody.hotShop.board;

import org.springframework.web.multipart.MultipartFile;

public class HotShop {
	private String bclcode;//대분류
	private String scicode;//소분류
	private int pdnum;//상품코드
	private String pdName;//상품명
	private String pdOrder;//게시물순서
	private String pdCreated;//상품등록날짜
	private String content;//상품하단 내용
	private String pdStCount;//재고
	private String pdSumContent;//상품메인내용
	private int pdPrice;//상품가격
	private String pdNutrient;//영양성분표시
	private String pdArea;//생산지
	private String pdStMethod;//보관방법
	private String pdType;//상품유형
	private String pdRawName;//상품원재료명
	private String pdDelRule;//배송정책(이미지로대체)
	private int pdRawPrice;//상품원가
	private String pdExDate;//유통기한
	private String imgSaveFilename;
	private String imgOriginalFilename;
	private MultipartFile upload;
	private String imgPath;
	private String mode;
	private int listOrArticle;
	private int pdInNum;
	private int showandhide;
	private String pCnt;
	private int listNum;
	private int milelage;
	private int starScore;
	
	
	
	public int getPdRawPrice() {
		return pdRawPrice;
	}
	public void setPdRawPrice(int pdRawPrice) {
		this.pdRawPrice = pdRawPrice;
	}
	public int getStarScore() {
		return starScore;
	}
	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}
	public int getMilelage() {
		return milelage;
	}
	public void setMilelage(int milelage) {
		this.milelage = milelage;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getpCnt() {
		return pCnt;
	}
	public void setpCnt(String pCnt) {
		this.pCnt = pCnt;
	}
	public int getShowandhide() {
		return showandhide;
	}
	public void setShowandhide(int showandhide) {
		this.showandhide = showandhide;
	}
	public String getBclcode() {
		return bclcode;
	}
	public void setBclcode(String bclcode) {
		this.bclcode = bclcode;
	}
	public String getScicode() {
		return scicode;
	}
	public void setScicode(String scicode) {
		this.scicode = scicode;
	}
	public int getPdInNum() {
		return pdInNum;
	}
	public void setPdInNum(int pdInNum) {
		this.pdInNum = pdInNum;
	}
	public int getListOrArticle() {
		return listOrArticle;
	}
	public void setListOrArticle(int listOrArticle) {
		this.listOrArticle = listOrArticle;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getImgSaveFilename() {
		return imgSaveFilename;
	}
	public void setImgSaveFilename(String imgSaveFilename) {
		this.imgSaveFilename = imgSaveFilename;
	}
	public String getImgOriginalFilename() {
		return imgOriginalFilename;
	}
	public void setImgOriginalFilename(String imgOriginalFilename) {
		this.imgOriginalFilename = imgOriginalFilename;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPdnum() {
		return pdnum;
	}
	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdOrder() {
		return pdOrder;
	}
	public void setPdOrder(String pdOrder) {
		this.pdOrder = pdOrder;
	}
	public String getPdCreated() {
		return pdCreated;
	}
	public void setPdCreated(String pdCreated) {
		this.pdCreated = pdCreated;
	}
	public String getPdStCount() {
		return pdStCount;
	}
	public void setPdStCount(String pdStCount) {
		this.pdStCount = pdStCount;
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
	public String getPdDelRule() {
		return pdDelRule;
	}
	public void setPdDelRule(String pdDelRule) {
		this.pdDelRule = pdDelRule;
	}
	public String getPdExDate() {
		return pdExDate;
	}
	public void setPdExDate(String pdExDate) {
		this.pdExDate = pdExDate;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	
	
	
	
	
}
