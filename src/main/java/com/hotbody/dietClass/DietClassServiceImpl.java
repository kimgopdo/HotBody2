package com.hotbody.dietClass;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
			list = dao.selectList("dietClass.listcAllProgram");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DietClass> listClass(Map<String, Object> map) {
		List<DietClass> list = new ArrayList<>();
		try {
			list = dao.selectList("dietClass.listClass",map);
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
	public DietClass readClass(Map<String, Object> map) {
		DietClass dto = null;
		try {
			dto = dao.selectOne("dietClass.readClass", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateClass(DietClass dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				
				if(newFilename != null) {
					if(dto.getSaveFileName().length()!=0 && dto.getSaveFileName()!=null) {
						fileManager.doFileDelete(dto.getSaveFileName(), pathname);
					}
					
					dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
					dto.setSaveFileName(newFilename);
				}
			}
			
			result = dao.updateData("dietClass.updateClass", dto);
			dao.deleteData("dietClass.deletepInClass", dto.getClassNum());
			
			for(int a : dto.getProSelect()) {
				dto.setProgramNum(a);
				dao.insertData("dietClass.proToClass", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteClass(Map<String, Object> map, String pathname) {
		int result=0;
		try {
			DietClass dto=readClass(map);
			if(dto!=null) {
				if(dto.getSaveFileName()!=null&&dto.getSaveFileName().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
			}
			dao.deleteData("dietClass.deletepInClass", dto.getClassNum());
			
			//////////////////////////////////////////////////////////////
			if(dto.getClassType()==0) 
				dao.deleteData("dietClass.deleteOn", dto.getClassNum());
			
			else if(dto.getClassType()==1)
				dao.deleteData("dietClass.deleteOff", dto.getClassNum());
			//////////////////////////////////////////////////////////////
			
			result = dao.deleteData("dietClass.deleteClass", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int programCount() {
		int dataCount=0;
		try {
			dataCount = dao.selectOne("dietClass.programCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

	@Override
	public List<CProgram> listcProgram(Map<String, Object> map) {
		List<CProgram> list = null;
		try {
			list = dao.selectList("dietClass.listcProgram", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deletecProgram(int programNum, String pathname) {
		int result=0;
		
		try {
			CProgram dto=readProgramInfo(programNum);
			if(dto!=null) {
				if(dto.getSaveFileName()!=null&&dto.getSaveFileName().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
			}
			result = dao.deleteData("dietClass.deletepInClassByP", programNum);
			dao.deleteData("dietClass.deletecProgram", programNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CProgram readProgramInfo(int programNum) {
		CProgram dto = null;
		try {
			dto = dao.selectOne("dietClass.readProgramInfo", programNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updatecProgram(CProgram dto,String pathname) {
		System.out.println("들어옴");
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				
				if(newFilename != null) {
					if(dto.getSaveFileName().length()!=0 && dto.getSaveFileName()!=null) {
						fileManager.doFileDelete(dto.getSaveFileName(), pathname);
					}
					
					dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
					dto.setSaveFileName(newFilename);
				}
			}
			result = dao.updateData("dietClass.updatecProgram", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
