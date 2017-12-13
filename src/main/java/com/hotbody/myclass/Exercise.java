package com.hotbody.myclass;

import org.springframework.web.multipart.MultipartFile;

public class Exercise {
	private int listNum; // 임의로 만드는 번호
	private int exerciseNum, exerciseType; // 운동코드,분류코드
	private String exerciseName, unitTime, lossCal, unit; // 운동이름, 단위시간, 소모칼로리, 단위
	private String video, pic; // 동영상자료, 사진자료
	private MultipartFile upload; // (파일처리하면 넣어줘야된데)

	
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

	public int getExerciseType() {
		return exerciseType;
	}

	public void setExerciseType(int exerciseType) {
		this.exerciseType = exerciseType;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getUnitTime() {
		return unitTime;
	}

	public void setUnitTime(String unitTime) {
		this.unitTime = unitTime;
	}

	public String getLossCal() {
		return lossCal;
	}

	public void setLossCal(String lossCal) {
		this.lossCal = lossCal;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

}
