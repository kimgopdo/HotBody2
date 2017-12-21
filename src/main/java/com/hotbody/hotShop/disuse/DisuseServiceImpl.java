package com.hotbody.hotShop.disuse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

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

}
