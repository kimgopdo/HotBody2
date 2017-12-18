package com.hotbody.mocobung;

import java.util.List;
import java.util.Map;

public interface BungService {
	public int insertBung(Bung dto);
	public List<Bung> listBung(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public Bung readBung(int mosubNum);
	public int updateBung(Bung dto);
	public int deleteBung(int mosubNum);
	
}
