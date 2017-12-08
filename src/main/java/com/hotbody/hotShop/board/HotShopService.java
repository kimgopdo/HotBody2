package com.hotbody.hotShop.board;

import java.util.List;
import java.util.Map;

public interface HotShopService {
	public int insertProductList(HotShop dto, String pathname);
	public List<HotShop> productList(Map<String, Object> map);
	public HotShop productArticle(Map<String, Object> map);
	public int productUpdate(HotShop dto, String pathname);
}
