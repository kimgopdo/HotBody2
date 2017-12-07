package com.hotbody.dietClass;

import java.util.ArrayList;
import java.util.List;

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
		int result = 0;
		try{
			int seq = dao.selectOne("dietClass.seq");
			dto.setClassNum(seq);
			
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("dietClass.insertDietClass", dto);
			
			for(int a : dto.getProSelect()) {
				dto.setProgramNum(a);
				dao.insertData("dietClass.proToClass", dto);
			}
			
			if(dto.getClassType()==0)
				dao.insertData("dietClass.insertOn", dto);
			else
				dao.insertData("dietClass.insertOff", dto);
			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertcProgram(CProgram dto, String pathname) {
		int result = 0;
		try {
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("dietClass.insertcProgram", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CProgram> listcProgram() {
		List<CProgram> list = new ArrayList<>();
		try {
			list = dao.selectList("dietClass.listcProgram");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DietClass> listOnClass() {
		List<DietClass> list = new ArrayList<>();
		try {
			list = dao.selectList("dietClass.listOnClass");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DietClass> listOffClass() {
		List<DietClass> list = new ArrayList<>();
		try {
			list = dao.selectList("dietClass.listOffClass");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CProgram> readcProgram(int classNum) {
		List<CProgram> list = new ArrayList<>();
		try {
			list = dao.selectList("dietClass.readcProgram", classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public DietClass readOnClass(int classNum) {
		DietClass dto = null;
		try {
			dto = dao.selectOne("dietClass.readOnClass", classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public DietClass readOffClass(int classNum) {
		DietClass dto = null;
		try {
			dto = dao.selectOne("dietClass.readOffClass", classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public DietClass readClass(int classNum) {
		DietClass dto = null;
		try {
			dto = dao.selectOne("dietClass.readClass", classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateClass(DietClass dto, String pathname) {
		int result=0;
		try {
			result = dao.updateData("dietClass.updateClass", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteClass(int classNum, String pathname) {
		int result=0;
		try {
			result = dao.deleteData("dietClass.deleteClass", classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
