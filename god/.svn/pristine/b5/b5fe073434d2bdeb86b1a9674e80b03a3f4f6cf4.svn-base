package com.project.god.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.god.domain.CategoryVO;
import com.project.god.domain.ProductDTO;
import com.project.god.domain.ProductVO;
import com.project.god.service.FileUploadService;
import com.project.god.service.ProductService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONArray;

/**
 * 관리자 상품 등록 컨트롤러
 * 
 * @author god
 *
 */

@Controller
@Slf4j
@RequestMapping("/admin")
public class ProductRegiController {

	@Autowired
	ProductService productService;

	@Autowired
	FileUploadService fileUploadService;

	@Autowired
	private FileSystemResource uploadDirResource; // fileUpload metadata wiring

	// 상품등록 화면
	@RequestMapping("/admin_product_regi.do")
	public String productRegi(Model model) throws Exception {

		log.info(" 상품등록 화면 ");

		List<CategoryVO> categoryList = null;

		categoryList = productService.getCategoryList();

		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));
		model.addAttribute("productDTO", new ProductDTO());

		return "/admin/admin_product_regi";
	}

	// 상품등록 처리
	@RequestMapping(value = "/product_regi_proc.do", method = RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	public String productRegiProc(@ModelAttribute("productDTO") ProductDTO productDTO,
								  Model model,
								  BindingResult result) throws Exception {

		log.info(" 상품등록 처리 ");

		log.info(" VO : {}", productDTO);
		log.info(" files1 : " + productDTO.getProductImg().getOriginalFilename());
		log.info(" files2 : " + productDTO.getProductListImg().getOriginalFilename());
		
		String fileName1 = productDTO.getProductImg().getOriginalFilename();
		String fileName2 = productDTO.getProductListImg().getOriginalFilename();
		
		String thumbPathFileName1 = "thumb_"+fileName1.split("\\.")[0]+".png";

		// 오류(에러) 처리
		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				
				log.error(" Error: " + error.getCode() + " - " + error.getDefaultMessage());
			}
			return "/admin/admin_product_regi";
		}

		if ((!productDTO.getProductImg().isEmpty() && productDTO.getProductImg() != null) &&
			(!productDTO.getProductListImg().isEmpty() && productDTO.getProductListImg() != null)) {
																		
			String tmpFileName1 = "";
			String tmpFileName2 = "";
			String tmpFileExt1 = "";
			String tmpFileExt2 = "";
			
			// 파일 정보
			tmpFileName1 = productDTO.getProductImg().getOriginalFilename();
			tmpFileName2 = productDTO.getProductListImg().getOriginalFilename();
			       
			tmpFileExt1 = tmpFileName1.substring(tmpFileName1.lastIndexOf(".") + 1,
												 tmpFileName1.length());
			tmpFileExt2 = tmpFileName2.substring(tmpFileName2.lastIndexOf(".") + 1,
												 tmpFileName2.length());
	               
			log.info(" 파일명1 - 확장자 : " + tmpFileName1 + " - " + tmpFileExt1);
			log.info(" 파일명2 - 확장자 : " + tmpFileName2 + " - " + tmpFileExt2);
              
			// 업로드 파일 확장자 제한 : 그림 파일 업로드 게시판용
			if  ((tmpFileExt1.equalsIgnoreCase("JPG") ||tmpFileExt1.equalsIgnoreCase("JPEG") ||
			 	 tmpFileExt1.equalsIgnoreCase("PNG") || tmpFileExt1.equalsIgnoreCase("GIF")) && 
				(tmpFileExt2.equalsIgnoreCase("JPG") ||tmpFileExt2.equalsIgnoreCase("JPEG") ||
			 	 tmpFileExt2.equalsIgnoreCase("PNG") || tmpFileExt2.equalsIgnoreCase("GIF"))) {    

				log.info(" 그림 파일 확장자 OK ! ");
				
				FileOutputStream fos1 = null;
				FileOutputStream fos2 = null;

				// 파일 경로(들) 저장
				// String tempPath = uploadDirResource.getPath().replace("/", "\\");
				// filePathList.add(uploadDirResource.getPath() + fileName);
				// log.info("file path : " + tempPath);

				// 파일 저장소에 저장
				try {
					byte[] bytes1 = productDTO.getProductImg().getBytes();
					byte[] bytes2 = productDTO.getProductListImg().getBytes();

					File outFileName1 = new File(uploadDirResource.getPath() + fileName1);
					fos1 = new FileOutputStream(outFileName1);
					
					File outFileName2 = new File(uploadDirResource.getPath() + fileName2);
					fos2 = new FileOutputStream(outFileName2);

					// 썸네일(thumbnail) path : PNG 형식으로 저장
                    String thumbPath = uploadDirResource.getPath() + "thumbnail/";
                    
                    fos1 = new FileOutputStream(outFileName1);
					fos1.write(bytes1);
					
					fos2 = new FileOutputStream(outFileName2);
					fos2.write(bytes2);
					
					// 썸네일 파일 저장 시작
                    // 200*100 크기의 썸네일 작성
                    File thumbnail1 = new File(thumbPathFileName1); 
                    //if (outFileName.exists()) { 
                    // thumbnail.getParentFile().mkdirs(); 
                    
                    Thumbnails.of(outFileName1)
                    		  .size(130, 170)
                    		  .outputFormat("png")
                    		  .toFile(thumbPath + thumbnail1); 
            		// }                        
                	// 썸네일 파일 저장 끝

				} catch (IOException e) {
					log.info(" FileUploadController save File writing error ! ");
					e.printStackTrace();
				} finally {

					try {
						if (fos1 != null) fos1.close();
						if (fos2 != null) fos2.close();
						
					} catch (IOException e) {
						log.info(" 3FileUploadController save IOE : ");
						e.printStackTrace();
					}

					log.info(" File upload success! ");
				} // try
	
			// if : 그림 파일 점검
			} else {
				 
		    	log.info(" 올바른 그림 파일 형식이 아닙니다. ");
		    	return "/error/image_error";
			} //
	
		} else {
			log.info(" File type error! ");
	    }

		int productId = 0;
	
		// 추가 : 신규 productId 값 구하기 (sequence)
		productId = productService.getProductIdByLastSeq();
	
		log.info(" 시퀀스 게시글 번호 : " + productId);
	
		ProductVO productVO = new ProductVO(productDTO);
		
		// 썸네일 파일명 추가
		productVO.setProductThumImg(thumbPathFileName1);
		productVO.setProductId(productId);
		
		log.info(" productVO : {}", productVO);
		
		productService.regiProduct(productVO);
		
		model.addAttribute("file1", fileName1);
		model.addAttribute("file2", fileName2);
		model.addAttribute("thumbFile1", thumbPathFileName1);
	
		return "redirect:/admin/admin_product_list.do/1";
	}
}
