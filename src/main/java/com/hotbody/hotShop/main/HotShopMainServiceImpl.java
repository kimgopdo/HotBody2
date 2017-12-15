package com.hotbody.hotShop.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;
@Service("hotShop.main")
public class HotShopMainServiceImpl implements HotShopMainService{
	
	@Autowired
	CommonDAO dao;
	
	@Override
	public List<HotBodyMenu> bclMenuData() {
		List<HotBodyMenu> bclList=null;
		try {
			bclList=dao.selectList("product.bclSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bclList;
	}

	@Override
	public List<HotBodyMenu> sciMenuData() {
		List<HotBodyMenu> sciList=null;
		try {
			sciList=dao.selectList("product.sciSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sciList;
	}
	
	
	
}
