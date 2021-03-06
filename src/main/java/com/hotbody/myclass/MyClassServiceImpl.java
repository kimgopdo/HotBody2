package com.hotbody.myclass;

import java.util.Calendar;
import java.util.HashMap;
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
	
	
	
/******************************************************************/	
	/*
	 * 재료관련
	 */
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
	
	
/******************************************************************/	
	/*
	 * 운동관련 서비스
	 */
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

	// 운동타입(가슴,팔,어깨 등...) 보여주기
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
	
	
/******************************************************************/	
	/*
	 * 유용한정보관련
	 */
	
	@Override
	public int insertInfo(Information dto) {
		int result = 0;
		
		try {
			result = dao.insertData("myClass.insertInfo", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Information> listInfo(Map<String, Object> map) {
		List<Information> list = null;
		
		try {
			list = dao.selectList("myClass.listInfo", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount3(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("myClass.dataCount3",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Information readInfo(int num) {
		Information dto = null;
		
		try {
			dto=dao.selectOne("myClass.readInfo", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateInfo(Information dto) {
		int result = 0;
		try {
			result = dao.updateData("myClass.updateInfo", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteInfo(int num) {
		int result = 0;
		try {
			result = dao.deleteData("myClass.deleteInfo", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Information preReadInfo(Map<String, Object> map) {
		Information dto = null;
		try {
			dto = dao.selectOne("myClass.preReadInfo", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Information nextReadInfo(Map<String, Object> map) {
		Information dto = null;
		
		try {
			dto = dao.selectOne("myClass.nextReadInfo", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	
/******************************************************************/	
	/*
	 * 오늘의운동정보
	 */	


	@Override
	public List<TodayExer> listToday(Map<String, Object> map) {
		List<TodayExer> list = null;
		try {		
			list = dao.selectList("myClass.listToday",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount4(Map<String, Object> map) {
		int result = 0;
		try {
			
			result = dao.selectOne("myClass.dataCount4",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertToday(TodayExer dto) {
		
		int result = 0;
		try {			
			//오늘날짜,아이디 넘겨받아서
			Calendar cal=Calendar.getInstance();
			String date=String.format("%tF", cal);
			//date는 yyyy-mm-dd 형식으로 나옴
			//디비처럼 yy/mm/dd로 하고싶으면 	format("%tD", cal); 하면됨.
			
			
			Map<String, Object> map=new HashMap<>();
			map.put("date", date);
			map.put("userId", dto.getUserId());
			
			int cntUser = dao.selectOne("myClass.countUser", map);
			if(cntUser == 0)
				return -1;
			
			int cnt = dao.selectOne("myClass.countToday", map);
			if(cnt == 0)
				result = dao.insertData("myClass.insertToday", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


/******************************************************************/	
	/*
	 * 다이어트 일기
	 */	
	
	@Override
	public int insertDiet(Diary dto) {
		int result = 0;
		try {
			int seq = dao.selectOne("myClass.diarySeq");
			dto.setDiaryNum(seq);
			
			dao.insertData("myClass.insertDietDiary", dto);
			dao.insertData("myClass.insertDiet", dto);
			dao.insertData("myClass.insertDietDetails", dto);
			dao.insertData("myClass.insertMisCheck", dto);
			dao.insertData("myClass.insertDiaryExe", dto);
			
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Diary> listDiet(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Diary readDiet(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDiet(Diary dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDiet(int num) {
		int result = 0;
		
		try {		
			
			dao.deleteData("myClass.deleteDiaryExe", num); //운동
			dao.deleteData("myClass.deleteMisCheck", num); //미션성공여부
			dao.deleteData("myClass.deleteDietDetails", num); //식단상세
			dao.deleteData("myClass.deleteDiet", num); //식단
			dao.deleteData("myClass.deleteDietDiary", num); //다이어트일기		
			result = 1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Diary> listMiss(Map<String, Object> map) {
		List<Diary> list = null;
		
		try {
			list = dao.selectList("myClass.missionInfo",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
