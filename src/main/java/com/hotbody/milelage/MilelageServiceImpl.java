package com.hotbody.milelage;

import java.util.List;
import java.util.Map;

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


	@Override
	public List<Milelage> listMilelage(Map<String, Object> map) {
		List<Milelage> list=null;
		try {
			list= dao.selectList("milelage.listMilelage",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
				
		}
		
		return list;
	}

}