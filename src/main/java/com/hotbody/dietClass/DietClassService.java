package com.hotbody.dietClass;

import java.util.List;

public interface DietClassService {
	public int insertDietClass(DietClass dto,String pathname);
	public List<DietClass> listOnClass();
	public List<DietClass> listOffClass();
	public DietClass readClass(int classNum);
	public DietClass readOnClass(int classNum);
	public DietClass readOffClass(int classNum);
	public int updateClass(DietClass dto, String pathname);
	public int deleteClass(int classNum, String pathname);
	
	/*
	 * 클래스 프로그램 관련
	 */
	public int insertcProgram(CProgram dto, String pathname);
	public List<CProgram> listcProgram();
	public List<CProgram> readcProgram(int classNum);
}
