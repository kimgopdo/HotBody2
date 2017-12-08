package com.hotbody.hotShop.board;

import java.util.List;

public interface HotShopService {
	public int insertProductList(HotShop dto, String pathname);
	public List<HotShop> productList();
	public HotShop productArticle(int pdnum);
	public int productUpdate(HotShop dto, String pathname);
}
