package com.hotbody.hotShop.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("qna.qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertQna(Qna dto, String mode) {
		int result = 0;
		
		try {
			int seq=dao.selectOne("qna.seq");
			dto.setPdQCode(seq);
			if(mode.equals("created"))
				dto.setGroupNum(seq);
				
			result = dao.insertData("qna.insertQna", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Qna readQna(int pdQCode) {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.readQna", pdQCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateQna(Qna dto) {
		int result = 0;
		
		try {
		dao.updateData("qna.updateQna", dto);
		result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteQna(int pdQCode, String userId) {
		int result=0;

		try{
			Qna dto=readQna(pdQCode);
			if(dto!=null) {
				if(! dto.getUserId().equals(userId) && ! userId.equals("admin"))
					return result;
			}
			
			dao.deleteData("qna.deleteQna", pdQCode);
			result=1;
		} catch(Exception e) {
		}
		return result;
	}

}
