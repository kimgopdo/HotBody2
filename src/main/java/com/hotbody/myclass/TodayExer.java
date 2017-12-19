package com.hotbody.myclass;

public class TodayExer {
	private int listNum; // 가짜번호
	private int exerciseNum, infoNum; // 운동코드, 정보코드
	private String edate; // 날짜
	private String userId; // 유저아이디
	private String exerciseName,subject; //운동이름, 유용한정보제목
	

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getExerciseNum() {
		return exerciseNum;
	}

	public void setExerciseNum(int exerciseNum) {
		this.exerciseNum = exerciseNum;
	}

	public int getInfoNum() {
		return infoNum;
	}

	public void setInfoNum(int infoNum) {
		this.infoNum = infoNum;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
