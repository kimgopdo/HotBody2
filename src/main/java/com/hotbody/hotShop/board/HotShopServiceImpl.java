package com.hotbody.hotShop.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("hotShop.hotShopService")
public class HotShopServiceImpl implements HotShopService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertProductList(HotShop dto) {
		int result=0;
		try {
			result=dao.insertData("product.insertProductList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
