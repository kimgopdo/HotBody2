package com.hotbody.myclass;

import org.springframework.web.multipart.MultipartFile;

public class Ing {
	private int listNum; // 임의로 만드는 번호
	private int ingrerdientsNum; // 재료코드
	private String nutrient, ingredientsName, ingredientsUnit; // 영양소정보, 재료명, 재료단위
	private String calory, content, unit; // 칼로리, 설명, 단위
	private String image; // 이미지
	private MultipartFile upload; // (파일처리하면 넣어줘야된데)

	
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getIngrerdientsNum() {
		return ingrerdientsNum;
	}

	public void setIngrerdientsNum(int ingrerdientsNum) {
		this.ingrerdientsNum = ingrerdientsNum;
	}

	public String getNutrient() {
		return nutrient;
	}

	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}

	public String getIngredientsName() {
		return ingredientsName;
	}

	public void setIngredientsName(String ingredientsName) {
		this.ingredientsName = ingredientsName;
	}

	public String getIngredientsUnit() {
		return ingredientsUnit;
	}

	public void setIngredientsUnit(String ingredientsUnit) {
		this.ingredientsUnit = ingredientsUnit;
	}

	public String getCalory() {
		return calory;
	}

	public void setCalory(String calory) {
		this.calory = calory;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
