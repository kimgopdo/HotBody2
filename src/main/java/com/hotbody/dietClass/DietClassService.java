package com.hotbody.dietClass;

import java.util.List;
import java.util.Map;

public interface DietClassService {
	public int insertDietClass(DietClass dto,String pathname);
	public List<DietClass> listClass(Map<String, Object> map);
	public DietClass readClass(Map<String, Object> map);
	public int updateClass(DietClass dto, String pathname);
	public int deleteClass(Map<String, Object> map, String pathname);
	
	/*
	 * 클래스 프로그램 관련
	 */
	public int insertcProgram(CProgram dto, String pathname);
	public List<CProgram> listcProgram();
	public List<CProgram> listcProgram(Map<String, Object> map);
	public List<CProgram> readcProgram(int classNum);
	public CProgram readProgramInfo(int programNum);
	public int programCount();
	public int deletecProgram(int programNum, String pathname);
	public int updatecProgram(CProgram dto, String pathname);
	
	/*
	 * 미션 관련
	 */
	public int insertMission(Mission dto);
	public List<Mission> readMission(Map<String, Object> map);
	public int updateMission(Mission dto);
	public int deleteMission(Map<String, Object> map);
	public int haveMission(Mission dto);
}
