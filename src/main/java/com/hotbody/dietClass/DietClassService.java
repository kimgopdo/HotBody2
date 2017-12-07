package com.hotbody.dietClass;

import java.util.List;

public interface DietClassService {
	public int insertDietClass(DietClass dto,String pathname);
	public List<DietClass> listOnClass();
	public List<DietClass> listOffClass();
	
	/*
	 * 클래스 프로그램 관련
	 */
	public int insertcProgram(CProgram dto, String pathname);
	public List<CProgram> listcProgram();
	public List<CProgram> readcProgram(int classNum);
}
