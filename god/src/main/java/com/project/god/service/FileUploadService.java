/**
 * 
 */
package com.project.god.service;

import org.springframework.web.multipart.MultipartFile;

import com.project.god.domain.FileVO;

/**
 * FileUpload 서비스
 * 
 * @author god
 *
 */
public interface FileUploadService {
	
	FileVO storeUploadFile(int productId, MultipartFile file);
}