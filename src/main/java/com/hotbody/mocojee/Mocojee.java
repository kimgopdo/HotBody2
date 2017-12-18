package com.hotbody.mocojee;

import org.springframework.web.multipart.MultipartFile;

public class Mocojee {
	private int geNum;
	private String moName;
	private String moIntro;
	private String moContent;
	private String moImage;
	private String soGae;
	private String userId;
	private int listNum;
	
	private MultipartFile upload;
	

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public int getGeNum() {
		return geNum;
	}

	public void setGeNum(int geNum) {
		this.geNum = geNum;
	}

	public String getMoName() {
		return moName;
	}

	public void setMoName(String moName) {
		this.moName = moName;
	}

	public String getMoIntro() {
		return moIntro;
	}

	public void setMoIntro(String moIntro) {
		this.moIntro = moIntro;
	}

	public String getMoContent() {
		return moContent;
	}

	public void setMoContent(String moContent) {
		this.moContent = moContent;
	}

	public String getMoImage() {
		return moImage;
	}

	public void setMoImage(String moImage) {
		this.moImage = moImage;
	}

	public String getSoGae() {
		return soGae;
	}

	public void setSoGae(String soGae) {
		this.soGae = soGae;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
}
