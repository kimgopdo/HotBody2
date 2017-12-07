package com.hotbody.dietClass;

import org.springframework.web.multipart.MultipartFile;

public class CProgram {
	private int programNum;
	private String programName, programContent, saveFileName, originalFileName;
	
	private MultipartFile upload;
	
	private int classNum;
	
	public int getProgramNum() {
		return programNum;
	}
	public void setProgramNum(int programNum) {
		this.programNum = programNum;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getProgramContent() {
		return programContent;
	}
	public void setProgramContent(String programContent) {
		this.programContent = programContent;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
}
