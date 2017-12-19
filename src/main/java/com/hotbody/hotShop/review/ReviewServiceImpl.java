package com.hotbody.hotShop.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("review.reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public int insertReview(Review dto, String pathname) {
		int result = 0;
		
		try {
			 if(! dto.getUpload().isEmpty()) {
		            String image=fileManager.doFileUpload(dto.getUpload(), pathname);
		            dto.setImage(image);
			 }
			result = dao.insertData("review.insertReview", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = dao.selectList("review.listReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("review.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Review readReview(int reviewCode) {
		Review dto = null;
		
		try {
			dto = dao.selectOne("review.readReview", reviewCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteReview(int reviewCode, String pathname, String userId) {
		int result=0;

		try{
			Review dto=readReview(reviewCode);
			if(dto!=null) {
				if(! dto.getUserId().equals(userId) && ! userId.equals("admin"))
					return result;
				
				if(dto.getImage()!=null&&dto.getImage().length()!=0) {
					fileManager.doFileDelete(dto.getImage(), pathname);
				}
			}
			dao.deleteData("review.deleteReply", reviewCode);
			dao.deleteData("review.deleteReview", reviewCode);
			result=1;
		} catch(Exception e) {
		}
		return result;
	}
	
	@Override
	public int insertReply(Reply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("review.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		
		try {
			list = dao.selectList("review.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("review.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.deleteData("review.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
