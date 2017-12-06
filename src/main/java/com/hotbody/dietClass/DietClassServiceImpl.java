package com.hotbody.dietClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("dietClass.dietClassService")
public class DietClassServiceImpl implements DietClassService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertDietClass(DietClass dto, String pathname) {
		System.out.println("Hello");
		int result = 0;
		try{
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				System.out.println("hello");
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
			}
			System.out.println(dto.getSaveFileName());
			System.out.println(dto.getOriginalFileName());
			
			result=dao.insertData("dietClass.insertDietClass", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
