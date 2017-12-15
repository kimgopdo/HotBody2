package com.hotbody.mocojee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("mocojee.MocojeeService")
public class MocojeeServiceImpl implements MocojeeService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public int insertMocojee(Mocojee dto, String pathname) {

		int result = 0;

		try {
			if (!dto.getUpload().isEmpty()) {
				String moImage = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setMoImage(moImage);
			}

			result = dao.insertData("mocojee.insertMocojee", dto);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	@Override
	public List<Mocojee> listMocojee(Map<String, Object> map) {
		List<Mocojee> list = null;

		try {
			list = dao.selectList("mocojee.listMocojee", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("mocojee.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	@Override
	public Mocojee readMocojee(int geNum) {
		Mocojee dto = null;

		try {
			dto = dao.selectOne("mocojee.readMocojee", geNum);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public int updateMocojee(Mocojee dto, String pathname) {
		int result = 0;

		try {
			if (dto.getUpload() != null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);

				if (newFilename != null) {
					if (dto.getMoImage().length() != 0 && dto.getMoImage() != null) {
						fileManager.doFileDelete(dto.getMoImage(), pathname);
					}

					dto.setMoImage(newFilename);
				}
			}

			result = dao.updateData("mocojee.updateMocojee", dto);
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	@Override
	public int deleteMocojee(int geNum, String pathname, String userId) {
		int result = 0;
		
		try {
			Mocojee dto=readMocojee(geNum);
			if(dto!=null) {
				if(! dto.getUserId().equals(userId)&& ! userId.equals("admin"))
					return result;
			}
			if(dto.getMoImage() != null && dto.getMoImage().length() !=0) {
				fileManager.doFileDelete(dto.getMoImage(), pathname);
			}
			
			dao.deleteData("mocojee.deleteMocojee",dto);
			result=1;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}

