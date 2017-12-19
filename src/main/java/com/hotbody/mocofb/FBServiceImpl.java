package com.hotbody.mocofb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("mocofb.FBService")
public class FBServiceImpl implements FBService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertFB(FB dto, String pathname) {
		
		int result=0;
		
		try {
			if(!dto.getUpload().isEmpty()) {
				String moFBFile= fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setMoFBFile(moFBFile);
				
			}
			result=dao.insertData("fb.insertFB",dto);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public List<FB> listFB(Map<String, Object> map) {
		List<FB> list=null;
		
		try {
			list=dao.selectList("fb.listFB", map);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		
		int result=0;
		
		try {
			result=dao.selectOne("fb.dataCount",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public FB readFB(int moFBNum) {
		
		FB dto = null;
		
		try {
			dto=dao.selectOne("fb.readFB", moFBNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}

	@Override
	public int hitCount(int moFBNum) {
		int result=0;
		
		try {
			result=dao.updateData("fb.hitCount", moFBNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public FB preReadFB(Map<String, Object> map) {
		
		FB dto=null;
		
		try {
			dto=dao.selectOne("fb.preReadFB", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}

	@Override
	public FB nextReadFB(Map<String, Object> map) {
		
		FB dto=null;
		
		try {
			dto=dao.selectOne("fb.nextReadFB", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}

	@Override
	public int updateFB(FB dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFB(int moFBNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
