package com.hotbody.mocoboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("mocoboard.BoardService")
public class BoardServiceImpl implements BoardService {
@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Board dto) {
		
		int result=0;
		
		try {
			result=dao.insertData("moco.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		
		return 0;
	}

	@Override
	public Board readBoard(int moFBNum) {
		
		return null;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int moFBNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
