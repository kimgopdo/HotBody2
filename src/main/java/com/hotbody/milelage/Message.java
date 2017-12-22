package com.hotbody.milelage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Message {
	
	private String userId,userId2,subject,content;
	private String state,box,sCreated;
	private long fileSize,totalFileSize;
	private int fileCode,mCode,fileCount;
	
	
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	private String oFileName,fileName,upDir;
	private List<MultipartFile> uploadFile;
	
	
	
	public String getsCreated() {
		return sCreated;
	}
	public void setsCreated(String sCreated) {
		this.sCreated = sCreated;
	}
	public long getTotalFileSize() {
		return totalFileSize;
	}
	public void setTotalFileSize(long totalFileSize) {
		this.totalFileSize = totalFileSize;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId2() {
		return userId2;
	}
	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getFileCode() {
		return fileCode;
	}
	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	
	public String getoFileName() {
		return oFileName;
	}
	public void setoFileName(String oFileName) {
		this.oFileName = oFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUpDir() {
		return upDir;
	}
	public void setUpDir(String upDir) {
		this.upDir = upDir;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	

}
