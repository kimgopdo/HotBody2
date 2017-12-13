package com.hotbody.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("order.orderService")
public class OderServiceImpl implements OrderService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Order> listOrder(Map<String, Object> map) {

		List<Order> list =null;
		try {
			list=dao.selectList("order.listOrder",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("order.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertOrder(Order dto) {
		int result=0;
		int seq=0;
		try {
			seq = dao.selectOne("order.seq");
			dto.setDelOrder(seq);
			result = dao.insertData("order.insertOrder", dto);
			dao.insertData("order.insertCartList", dto);
			dao.insertData("order.insertTotalOrderList", dto.getDelOrder());
			dao.insertData("order.insertMilelage", dto);
			dao.insertData("order.register", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
