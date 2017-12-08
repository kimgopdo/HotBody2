package com.hotbody.milelage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;
@Service("milelage.milelageService")
public class MilelageServiceImpl implements MilelageService{

	@Autowired
	private CommonDAO dao;
	

	@Override
	public Milelage selectMilelage(String userId) {
		Milelage dto=null;
		try {
			dto= dao.selectOne("milelage.selectMilelage",userId);
			
		} catch (Exception e) {
			System.out.println(e.toString());
				
		}
		
		return dto;
	}

}
