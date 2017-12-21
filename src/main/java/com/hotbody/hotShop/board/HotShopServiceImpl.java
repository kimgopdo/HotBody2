package com.hotbody.hotShop.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;
import com.hotbody.hotShop.qna.Qna;
import com.hotbody.hotShop.review.Review;

@Service("hotShop.hotShopService")
public class HotShopServiceImpl implements HotShopService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertProductList(HotShop dto, String pathname) {
		int result=0;
		try { 
			if(! dto.getUpload().isEmpty()) {
				System.out.println("파일업로드 if문");
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImgSaveFilename(saveFilename);
				dto.setImgOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("product.insertProductList", dto);
			dto.setPdnum(dao.selectOne("product.readProductNum", dto.getPdName()));
			result=dao.insertData("product.insertPmainImg", dto);
			result=dao.insertData("product.insertTemporary", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<HotShop> productList(Map<String, Object> map) {
		List<HotShop> list=null;
		try {
				list=dao.selectList("product.productList",map);				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public HotShop productArticle(Map<String, Object> map) {
		HotShop dto=null;
		try {
			dto=dao.selectOne("product.productList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public List<Qna> productArticle_QnA(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list = dao.selectList("qna.listQnaArticle", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<Review> productArticle_Review(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = dao.selectList("review.listReviewArticle", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public int productUpdate(HotShop dto, String pathname) {
		int result=0;
		
		try {
			if(! dto.getUpload().isEmpty()) {
				System.out.println("파일업로드 if문");
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImgSaveFilename(saveFilename);
				dto.setImgOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result=dao.updateData("product.productListUpdate", dto);
			result=dao.updateData("product.PmainImgUpdate", dto);
			result=dao.updateData("product.TemporaryUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public int insertSchedule(Schedule dto) {
		int result=0;
		try {
			result=dao.insertData("product.insertSchedule", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Schedule> readSchedules() {
		List<Schedule> list=null;
		try {
			/*list=dao.selectList("product.scheduleList");*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Supply> readSupply() {
		List<Supply> list=null;
		try {
			list=dao.selectList("product.supplyList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int insertProductIn(ProductIn dto) {
		int result=0;
		try {
			result=dao.insertData("product.insertSupply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<ProductIn> readProductIn(Map<String, Object> map) {
		List<ProductIn> list=null;
		try {
			list=dao.selectList("product.readProductIn",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int dataCount() {
		int result=0;
		try {
			result=dao.selectOne("product.pdInDataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int dataCount_qna(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("qna.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int dataCount_review(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("review.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int productHitCount(int pdnum) {
		int result=0;
		try {
			result=dao.updateData("product.updateHitCount",pdnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int insertPayment(Payment dto) {
		int result=0;
		try {
			dao.insertData("product.insertPayment", dto);
			dto.setDelOrder(dao.selectOne("product.readDelOrder", dto.getUserId()));
			dto.setClassNum(64);
			int []amount=dto.getAmount();
			int []pdnum=dto.getPdnum();
			for(int n=0;n<amount.length;n++) {
				dto.setAmount_one(amount[n]);
				dto.setPdnum_one(pdnum[n]);
				dao.insertData("product.insertCartList", dto);
			}
			result=dao.insertData("product.insertPayInfo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
