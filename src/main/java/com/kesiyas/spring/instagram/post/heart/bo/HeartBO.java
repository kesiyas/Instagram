package com.kesiyas.spring.instagram.post.heart.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.post.heart.dao.HeartDAO;
import com.kesiyas.spring.instagram.post.heart.model.Heart;

@Service
public class HeartBO {

	@Autowired
	private HeartDAO heartDAO;
	
	public int like(int postId, int userId) {
		
		return heartDAO.insertHeart(postId, userId);
	}
	
	public int getHeartCount(int postId) {
		
		return heartDAO.selectHeartCount(postId);
	}
	
	public Heart isDuplicateLike(int postId, int userId) {
					
		return heartDAO.selectDuplicateHeart(postId, userId);
	}
}
