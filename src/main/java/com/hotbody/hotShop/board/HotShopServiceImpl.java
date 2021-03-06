package com.hotbody.hotShop.board;

import java.util.ArrayList;
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
					for(HotShop dto:list) {
						int pdnum=dto.getPdnum();
						Integer starScore=dao.selectOne("product.readPdStarScore",pdnum);
						if(starScore==null) {
							starScore=0;
						}
						dto.setStarScore(starScore);
					}
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
			int pdnum=dto.getPdnum();
			Integer starScore=dao.selectOne("product.readPdStarScore",pdnum);
			if(starScore==null) {
				starScore=0;
			}
			dto.setStarScore(starScore);
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
			dao.updateData("product.productInStCount", dto);
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
	public int productDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("product.pdListDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
			dto.setDelOrder(readDelOrder(dto.getUserId()));
			dto.setClassNum(0);
			int []amount=dto.getAmount();
			int []pdnum=dto.getPdnum();
			for(int n=0;n<amount.length;n++) {
				dto.setAmount_one(amount[n]);
				dto.setPdnum_one(pdnum[n]);
				dao.insertData("product.insertCartList", dto);
			}
			dao.insertData("product.isnertTotalOrdList", dto);
			dao.insertData("product.insertMilelage", dto);
			result=dao.insertData("product.insertPayInfo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int readDelOrder(String userId) {
		int delOrder=0;
		try {
			delOrder=dao.selectOne("product.readDelOrder", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delOrder;
	}
	@Override
	public List<Payment> readDelOrderProduct(int oderNum) {
		List<Payment> list=null;
		try {
			list=dao.selectList("product.readDelOrderProduct", oderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int insertBcl(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("product.insertBcl", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int insertSci(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("product.insertSci", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int deleteBcl(int code) {
		int result=0;
		try {
			result=dao.deleteData("product.deleteBciMenu", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int deleteSci(int code) {
		int result=0;
		try {
			result=dao.deleteData("product.deleteSclMenu", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int hide(int code) {
		int result=0;
		try {
			result=dao.updateData("product.hideUpdate", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int show(int code) {
		int result=0;
		try {
			result=dao.updateData("product.showUpdate", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int insertProductDis(ProductDis dto) {
		int result=0;
		try {
			dao.updateData("product.productDisStCount", dto);
			result=dao.insertData("product.insertProductDis", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int productDisDataCount() {
		int result=0;
		try {
			result=dao.selectOne("product.pdDisDataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<ProductDis> readProductDis(Map<String, Object> map) {
		List<ProductDis> list=null;
		try {
			list=dao.selectList("product.readProductDis",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int readPdRawPrice(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("product.readPdRawPrice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Integer> readRealChart(String checkDate) {
		List<Integer> list=new ArrayList<>();
		int result=0;
		
		try {
			for(int n=1;n<=12;n++) {
				int n1=0;
				int n2=0;
				int n3=0;
				if(n>10) {
					checkDate=checkDate+"-"+"0"+n;
					n1=dao.selectOne("product.readRealChartTotalPay", checkDate);
					n2=dao.selectOne("product.readRealChartPdDisAmt", checkDate);
					n3=dao.selectOne("product.readRealChartPdInAmt", checkDate);
					result=n1-n2-n3;
					list.add(result);
				}else {
					checkDate=checkDate+"-"+n;
					n1=dao.selectOne("product.readRealChartTotalPay", checkDate);
					n2=dao.selectOne("product.readRealChartPdDisAmt", checkDate);
					n3=dao.selectOne("product.readRealChartPdInAmt", checkDate);
					result=n1-n2-n3;
					list.add(result);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
