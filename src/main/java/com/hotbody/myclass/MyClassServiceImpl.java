package com.hotbody.myclass;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;


@Service("hotbody.myclassService")
public class MyClassServiceImpl implements MyClassService {
	
	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	
	
	// 재료관련서비스
	@Override
	public int insertIng(Ing dto, String pathname) {
		int result = 0;
		
		try {
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImage(saveFilename);
			}
			
			result = dao.insertData("myClass.insertIng",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Ing> listIng(Map<String, Object> map) {
		List<Ing> list = null;
		try {
			list = dao.selectList("myClass.listIng", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("myClass.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Ing readIng(int num) {
		Ing dto = null;
		
		try {
			dto = dao.selectOne("myClass.readIng", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateIng(Ing dto, String pathname) {
		int result = 0;
		
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					
					// 이전 파일 지우기
					if(dto.getImage().length()!=0 && dto.getImage()!=null) {
						fileManager.doFileDelete(dto.getImage(), pathname);
					}
					
					dto.setImage(newFilename);
				}
			}
			
			dao.updateData("myClass.updateIng", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteIng(int num, String pathname) {
		int result=0;

		try{
			Ing dto=readIng(num);
			if(dto!=null) {
				if(dto.getImage()!=null&&dto.getImage().length()!=0) {
					fileManager.doFileDelete(dto.getImage(), pathname);
				}
			}	
			dao.deleteData("myClass.deleteIng", num);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Ing preReadIng(Map<String, Object> map) {
		Ing dto=null;
		
		try{
			dto=dao.selectOne("myClass.preReadIng", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Ing nextReadIng(Map<String, Object> map) {
		Ing dto=null;
		
		try{
			dto=dao.selectOne("myClass.nextReadIng", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	
	// 운동관련서비스
	@Override
	public int insertExercise(Exercise dto, String pathname) {
		int result = 0;
		try {
			if(! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setVideo(saveFilename);
			}
			
			result = dao.insertData("myClass.insertExercise",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Exercise> listExercise(Map<String, Object> map) {
		List<Exercise> list = null;
		try {
			list = dao.selectList("myClass.listExercise",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Exercise readExercise(int num) {
		Exercise dto = null;
		
		try {
			dto=dao.selectOne("myClass.readExercise",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateExercise(Exercise dto, String pathname) {
		int result = 0;
		
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					
					// 이전 파일 지우기
					if(dto.getVideo().length()!=0 && dto.getVideo()!=null) {
						fileManager.doFileDelete(dto.getVideo(), pathname);
					}
					
					dto.setVideo(newFilename);
				}
			}		
			dao.updateData("myClass.updateExercise", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteExercise(int num, String pathname) {
		int result=0;

		try{
			Exercise dto=readExercise(num);
			if(dto!=null) {
				if(dto.getVideo()!=null&&dto.getVideo().length()!=0) {
					fileManager.doFileDelete(dto.getVideo(), pathname);
				}
			}	
			dao.deleteData("myClass.deleteExercise", num);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Exercise preReadExercise(Map<String, Object> map) {
		Exercise dto=null;
		
		try{
			dto=dao.selectOne("myClass.preReadExercise", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Exercise nextReadExercise(Map<String, Object> map) {
		Exercise dto=null;
		
		try{
			dto=dao.selectOne("myClass.nextReadExercise", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("myClass.dataCount2",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	// 운동정보 보여주기
	@Override
	public List<ExerciseType> readExerciseType() {
		List<ExerciseType> list = null;
		
		try {
			list = dao.selectList("myClass.exerciseType");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
