package com.hotbody.guest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;


@Service("guest.guestService")
public class GuestServiceImpl implements GuestService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertGuest(Guest dto) {
		int result = 0;
		
		try {
			result = dao.insertData("guest.insertGuest", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Guest> listGuest(Map<String, Object> map) {
		List<Guest> list=null;
		try {
			list=dao.selectList("guest.listGuest", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=dao.selectOne("guest.dataCount");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteGuest(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.deleteData("guest.deleteGuest",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	

}
