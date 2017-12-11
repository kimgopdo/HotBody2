package com.hotbody.dietClass;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DietClass {
	private int classNum, cllevel, tuition, classType;
	private String className, classGoal, classGoalD, saveFileName, originalFileName;
	
	private MultipartFile upload;
	
	//온라인
	private String mento;
	private int onperiod;
	
	//오프라인
	private String location1, location2, startTime, endTime, coach, startDate, endDate;
	private int offLimit;
	
	private List<Integer> proSelect;
	private int programNum;
	
	private String showTuition;
	
	private int point;
	
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
	public String getMento() {
		return mento;
	}
	public void setMento(String mento) {
		this.mento = mento;
	}
	public int getOnperiod() {
		return onperiod;
	}
	public void setOnperiod(int onperiod) {
		this.onperiod = onperiod;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getCoach() {
		return coach;
	}
	public void setCoach(String coach) {
		this.coach = coach;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getOffLimit() {
		return offLimit;
	}
	public void setOffLimit(int offLimit) {
		this.offLimit = offLimit;
	}
	public List<Integer> getProSelect() {
		return proSelect;
	}
	public void setProSelect(List<Integer> proSelect) {
		this.proSelect = proSelect;
	}
	public int getProgramNum() {
		return programNum;
	}
	public void setProgramNum(int programNum) {
		this.programNum = programNum;
	}
	public String getShowTuition() {
		return showTuition;
	}
	public void setShowTuition(String showTuition) {
		this.showTuition = showTuition;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
