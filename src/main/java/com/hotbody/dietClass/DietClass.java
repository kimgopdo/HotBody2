package com.hotbody.dietClass;

import org.springframework.web.multipart.MultipartFile;

public class DietClass {
	private int classNum, cllevel, tuition, classType;
	private String className, classGoal, classGoalD, saveFileName, originalFileName;
	
	private MultipartFile upload;
	
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getCllevel() {
		return cllevel;
	}
	public void setCllevel(int cllevel) {
		this.cllevel = cllevel;
	}
	public int getTuition() {
		return tuition;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public int getClassType() {
		return classType;
	}
	public void setClassType(int classType) {
		this.classType = classType;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassGoal() {
		return classGoal;
	}
	public void setClassGoal(String classGoal) {
		this.classGoal = classGoal;
	}
	public String getClassGoalD() {
		return classGoalD;
	}
	public void setClassGoalD(String classGoalD) {
		this.classGoalD = classGoalD;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
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
}
