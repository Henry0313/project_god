package com.project.god.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

/**
 * File VO
 * 
 * @author god
 *
 */

@Getter
@Setter
public class FileVO {
	
	/** 파일 */
	private List<MultipartFile> files;
}