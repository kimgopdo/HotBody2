package com.hotbody.mocojee;

import java.util.List;
import java.util.Map;

public interface MocojeeService {
	public int insertMocojee(Mocojee dto, String pathname);
	public List<Mocojee> listMocojee(Map<String, Object> map);
	public int dataCount(Map<String,Object> map);
	public Mocojee readMocojee(int geNum);
	public int updateMocojee(Mocojee dto, String pathname);
	public int deleteMocojee(int geNum, String pathname, String userId);
	
}
