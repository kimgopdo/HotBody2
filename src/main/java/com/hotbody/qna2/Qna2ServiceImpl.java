package com.hotbody.qna2;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("qna2.qna2Service")
public class Qna2ServiceImpl implements Qna2Service{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertQna2(Qna2 dto) {
		int result=0;
		
		try {
			result=dao.insertData("qna2.insertQna2", dto);			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<Qna2> listQna2(Map<String, Object> map) {
		List<Qna2> list = null;
		try {
			list=dao.selectList("qna2.listQna2", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("qna2.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Qna2 readQna2(int qna2Code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna2 preReadQna2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna2 nextReadQna2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatehitCount(int qna2Code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateQna2(Qna2 dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna2(int qna2Code) {
		// TODO Auto-generated method stub
		return 0;
	}

}
