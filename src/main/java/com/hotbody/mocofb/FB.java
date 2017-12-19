package com.hotbody.mocofb;

import org.springframework.web.multipart.MultipartFile;

public class FB {
	private int moFBNum;
	private String moFBSubject;
	private String userId;
	private String moFBCreated;
	private String moFBContent;
	private String moFBFile;
	private int geNum;
	private int moFBHit;
	private int listNum;
	

	public int getMoFBHit() {
		return moFBHit;
	}
	public void setMoFBHit(int moFBHit) {
		this.moFBHit = moFBHit;
	}
	private MultipartFile upload;
	
	public int getMoFBNum() {
		return moFBNum;
	}
	public void setMoFBNum(int moFBNum) {
		this.moFBNum = moFBNum;
	}
	public String getMoFBSubject() {
		return moFBSubject;
	}
	public void setMoFBSubject(String moFBSubject) {
		this.moFBSubject = moFBSubject;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMoFBCreated() {
		return moFBCreated;
	}
	public void setMoFBCreated(String moFBCreated) {
		this.moFBCreated = moFBCreated;
	}
	public String getMoFBContent() {
		return moFBContent;
	}
	public void setMoFBContent(String moFBContent) {
		this.moFBContent = moFBContent;
	}
	public String getMoFBFile() {
		return moFBFile;
	}
	public void setMoFBFile(String moFBFile) {
		this.moFBFile = moFBFile;
	}
	public int getGeNum() {
		return geNum;
	}
	public void setGeNum(int geNum) {
		this.geNum = geNum;
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
	
	
	
}
