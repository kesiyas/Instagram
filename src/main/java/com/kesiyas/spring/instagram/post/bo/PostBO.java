package com.kesiyas.spring.instagram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.instagram.common.FileManagerService;
import com.kesiyas.spring.instagram.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(String content, MultipartFile file, int userId) {		
		
		String imgPath = FileManagerService.saveFile(userId, file);
		
		if(file == null) {
			return 0;
		}
		
		if(imgPath == null) {
			return 0;
		}
		
		return postDAO.insertPost(content, imgPath, userId);
	}

}
