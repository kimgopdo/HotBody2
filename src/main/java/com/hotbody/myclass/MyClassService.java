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
	
	//
}
