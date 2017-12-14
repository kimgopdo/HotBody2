package com.hotbody.myclass;

import java.util.List;
import java.util.Map;

public interface MyClassService {

	//재료관련서비스
	public int insertIng(Ing dto, String pathname);
	public List<Ing> listIng(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Ing readIng(int num);
	public int updateIng(Ing dto, String pathname);
	public int deleteIng(int num, String pathname);
	public Ing preReadIng(Map<String, Object> map);
	public Ing nextReadIng(Map<String, Object> map);
	
	//운동관련서비스
	public int insertExercise(Exercise dto, String pathname);
	public List<Exercise> listExercise(Map<String, Object> map);
	public int dataCount2(Map<String, Object> map);
	public Exercise readExercise(int num);
	public int updateExercise(Exercise dto, String pathname);
	public int deleteExercise(int num, String pathname);
	public Exercise preReadExercise(Map<String, Object> map);
	public Exercise nextReadExercise(Map<String, Object> map);
	public List<ExerciseType> readExerciseType(); // 운동분류 보여주기
	
	
	//유용한정보관련 서비스
	public int insertInfo(Information dto);
	public List<Information> listInfo(Map<String, Object> map);
	public int dataCount3(Map<String, Object> map);
	public Information readInfo(int num);
	public int updateInfo(Information dto);
	public int deleteInfo(int num);
	public Information preReadInfo(Map<String, Object> map);
	public Information nextReadInfo(Map<String, Object> map);
	
}
