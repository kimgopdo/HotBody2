package com.hotbody.hotShop.disuse;

import java.util.List;
import java.util.Map;

import com.hotbody.hotShop.board.HotShop;

public interface DisuseService {
	public int insertDisuse(Disuse dto);
	public Disuse readDisuse(String pdName);
	public List<HotShop> productList(Map<String, Object> map);
	public int dataCount();
}
