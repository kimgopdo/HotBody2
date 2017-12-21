package com.hotbody.myclass;

public class Diary {
	// 다이어트일기를 통해서 총 5개의 테이블에 insert 시켜야됨

	// 다이어트 일기
	private int diaryNum, weight; // 일기코드,금일몸무게
	private String dietDate, feedback, userId, subject, content; // 날짜,피드백,아이디,제목,내용

	// 운동일기
	private int exerciseNum; // 운동코드
	private String exerciseTime; // 운동시간

	// 미션성공여부
	private int missionNum; // 미션코드
	private String chSuccess; // 성공여부체크

	// 식단일기
	private String bldCode; // 아,점,저 코드

	// 식단상세
	private int dietNumD, ingrerdientsNum; // 식단상세코드, 재료코드
	private String totalUnit; // 재료섭취단위

	
	
	public int getDiaryNum() {
		return diaryNum;
	}

	public void setDiaryNum(int diaryNum) {
		this.diaryNum = diaryNum;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getDietDate() {
		return dietDate;
	}

	public void setDietDate(String dietDate) {
		this.dietDate = dietDate;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getExerciseNum() {
		return exerciseNum;
	}

	public void setExerciseNum(int exerciseNum) {
		this.exerciseNum = exerciseNum;
	}

	public String getExerciseTime() {
		return exerciseTime;
	}

	public void setExerciseTime(String exerciseTime) {
		this.exerciseTime = exerciseTime;
	}

	public int getMissionNum() {
		return missionNum;
	}

	public void setMissionNum(int missionNum) {
		this.missionNum = missionNum;
	}

	public String getBldCode() {
		return bldCode;
	}

	public void setBldCode(String bldCode) {
		this.bldCode = bldCode;
	}

	public int getDietNumD() {
		return dietNumD;
	}

	public void setDietNumD(int dietNumD) {
		this.dietNumD = dietNumD;
	}

	public int getIngrerdientsNum() {
		return ingrerdientsNum;
	}

	public void setIngrerdientsNum(int ingrerdientsNum) {
		this.ingrerdientsNum = ingrerdientsNum;
	}

	public String getTotalUnit() {
		return totalUnit;
	}

	public void setTotalUnit(String totalUnit) {
		this.totalUnit = totalUnit;
	}

	public String getChSuccess() {
		return chSuccess;
	}

	public void setChSuccess(String chSuccess) {
		this.chSuccess = chSuccess;
	}

}
