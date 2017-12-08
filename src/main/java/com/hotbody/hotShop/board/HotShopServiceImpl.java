package com.hotbody.hotShop.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

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
	public List<HotShop> productList() {
		List<HotShop> list=null;
		try {
			list=dao.selectList("product.productList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public HotShop productArticle(int pdnum) {
		HotShop dto=null;
		try {
			dto=dao.selectOne("product.productArticle", pdnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
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
	
	
}
