package com.hotbody.milelage;

import java.util.List;
import java.util.Map;

public interface MilelageService {

	public Milelage selectMilelage(String userId);
	public List<Milelage> listMilelage(Map<String, Object> map);
	public List<Message> listMessage(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
