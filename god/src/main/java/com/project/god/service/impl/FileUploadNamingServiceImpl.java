package com.project.god.service.impl;

import org.springframework.stereotype.Service;

import com.project.god.service.FileUploadNamingService;

import lombok.extern.slf4j.Slf4j;

/**
 * File Upload Naming Service Impl
 * 
 * @author god
 *
 */
@Service
@Slf4j
public class FileUploadNamingServiceImpl implements FileUploadNamingService {
	
	/**
	 * #parseFilePostfix(int, java.lang.String)
	 */
	@Override
	public String parseFilePostfix(int productId, String file) {

		log.info(" 실제 저장 파일로 변환 : 파일 접미어(_ + productId) 첨부 ");
		// 본 파일명과 확장자 분리 처리
		String[] fileStr = file.split("\\."); 
		String fileName = fileStr[0];
		String fileExt = fileStr[1];
		
		// 업로드 파일명 형성
		return fileName + "_" 
			   + productId
			   + "." + fileExt;
	} //

	@Override
	public String getOriginalFilename(int productId, String file) {
		
		log.info(" 원래 파일명으로 변환 : 파일 접미어 제거 ");
		String result = null;
		
		String[] fileStr = file.split("\\."); 
		String fileName = fileStr[0];
		String fileExt = fileStr[1];
		
		fileName = fileName.replaceAll("_"+productId, "");
		
		result = fileName + "." + fileExt;
		
		return result;
	}
}
