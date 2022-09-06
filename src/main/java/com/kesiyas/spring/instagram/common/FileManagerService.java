package com.kesiyas.spring.instagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "D:\\정민우\\spring\\test\\instagramfile\\upload";
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// 디렉토리 이름(/userId_UNIX TIME)
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		
		// 디렉토리 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패했을 경우
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			String fileFullPath = filePath + file.getOriginalFilename();
			Path path = Paths.get(fileFullPath);
			
			Files.write(path, bytes);
		} catch (IOException e) {		
			e.printStackTrace();
			
			// 파일 저장 실패
			return null;
		}
		
		// 클라이언트에서 접근 가능한 경로 생성				
		return "/images" + directoryName + file.getOriginalFilename();
	}
}
