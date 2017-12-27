package com.hotbody.qna1;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;


@Service("qna1.qna1Service")
public class Qna1ServiceImpl implements Qna1Service {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertQna1(Qna1 dto) {
		int result=0;
		
		try {
			result=dao.insertData("qna1.insertQna1", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		try {
			result=dao.selectOne("qna1.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Qna1> listQna1(Map<String, Object> map) {
		List<Qna1> list = null;
		try {
			list=dao.selectList("qna1.listQna1", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Qna1 readQna1(int qna1Code) {
		Qna1 dto=null;
		try {
			dto=dao.selectOne("qna1.readQna1", qna1Code);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Qna1 preReadQna1(Map<String, Object> map) {
		Qna1 dto=null;
		try {
			dto=dao.selectOne("qna1.preReadQna1", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Qna1 nextReadQna1(Map<String, Object> map) {
		Qna1 dto= null;
		try {
			dto=dao.selectOne("qna1.nextReadQna1", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int qna1Code) {
		int result=0;
		try {
			result=dao.updateData("qna1.updateHitCount", qna1Code);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateQna1(Qna1 dto) {
		int result=0;
		try {
			result=dao.updateData("qna1.updateQna1", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteQna1(int qna1Code) {
		int result=0;
		try {
			result=dao.deleteData("qna1.deleteQna1", qna1Code);	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
