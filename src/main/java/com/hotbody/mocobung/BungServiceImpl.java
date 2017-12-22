package com.hotbody.mocobung;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("mocobung.BungService")
public class BungServiceImpl implements BungService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int insertBung(Bung dto) {
		
		int result=0;
		
		try {
			result=dao.insertData("mocobung.insertBung",dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
				
		return result;
	}

	@Override
	public List<Bung> listBung(Map<String, Object> map) {
		
		List<Bung> list=null;
		
		try {
			list=dao.selectList("mocobung.listBung",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("mocobung.dataCount",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public Bung readBung(int mosubNum) {
		
		Bung dto=null;
		
		try {
			dto=dao.selectOne("mocobung.readBung",mosubNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}

	@Override
	public int updateBung(Bung dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBung(int mosubNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
