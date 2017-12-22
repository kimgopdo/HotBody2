package com.hotbody.hotShop.disuse;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;
import com.hotbody.hotShop.board.HotShop;

@Service("hotShop.disuseService")
public class DisuseServiceImpl implements DisuseService{

	@Autowired
	private CommonDAO dao; 
	
	@Override
	public int insertDisuse(Disuse dto) {
		int result = 0;
		try {
			result = dao.insertData("disuse.insertDisuse", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Disuse readDisuse(String pdName) {
		Disuse dto = null;
		try {
			dto = dao.selectOne("disuse.readDisuse", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<HotShop> productList(Map<String, Object> map) {
		List<HotShop> list=null;
		try {
				list=dao.selectList("product.productList",map);				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int dataCount() {
		int result=0;
		try {
			result=dao.selectOne("product.pdInDataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
