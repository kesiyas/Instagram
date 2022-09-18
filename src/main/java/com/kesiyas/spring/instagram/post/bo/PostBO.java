package com.kesiyas.spring.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.instagram.common.FileManagerService;
import com.kesiyas.spring.instagram.post.dao.PostDAO;
import com.kesiyas.spring.instagram.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(String content, MultipartFile file, int userId) {		
		String imgPath = null;
		
		if(file != null) {
			
			imgPath = FileManagerService.saveFile(userId, file);
			
			if(imgPath == null) {
				// 파일 저장 실패
				return 0;
			}
		}
		
		return postDAO.insertPost(content, imgPath, userId);
	}
	
	public List<Post> getTimeLine(int userId) {
		
		return postDAO.selectPost(userId);
	}
	
	public int deletePost(int id, int userId) {
		
		return postDAO.deletePost(id, userId);
	}
	
	public List<Post> userImgList(int userId) {
		
		return postDAO.selectPost(userId);
	}

}
