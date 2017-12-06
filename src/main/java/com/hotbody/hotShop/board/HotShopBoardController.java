package com.hotbody.hotShop.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Controller("hotShop.board")
public class HotShopBoardController {
	@Autowired
	private HotShopService service;
	
	@RequestMapping("/hotShop/productList")
	public String productList(
			@RequestParam String state
			,@RequestParam String name
			,HttpServletRequest req
			,Model model
			) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			name = URLDecoder.decode(name, "UTF-8");
		}
		
		model.addAttribute("state", name);
		return ".hotShop.productList";
	}
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList() throws Exception {
		return ".hotShop.shopReviewList";
	}
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	@RequestMapping(value="/hotShop/shopArticle")
	public String shopArticle() {
		return ".hotShop.shopArticle";
	}
	
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.GET)
	public String createdForm() {
		return ".hotShop.created";
	}
	
	@RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
          
        Iterator<String> itr =  multipartRequest.getFileNames();
         
        String filePath = "C:/test"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                          
       }
          
        return "success";
    }
	
	@RequestMapping(value="/hotShop/created.ok",  method=RequestMethod.POST)
	public String createdSubmit(
			HotShop dto
			,MultipartHttpServletRequest multipartRequest
			,Model model
			) {
		
		dto.setContent(dto.getPdSumContent()+"[回]"+dto.getContent());
		service.insertProductList(dto);
		
		return "redirect:/";
	}
}
