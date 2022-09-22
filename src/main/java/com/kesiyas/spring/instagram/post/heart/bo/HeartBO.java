package com.kesiyas.spring.instagram.post.heart.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.post.heart.dao.HeartDAO;
import com.kesiyas.spring.instagram.post.heart.model.Heart;

@Service
public class HeartBO {

	@Autowired
	private HeartDAO heartDAO;
	
	// 좋아요 클릭 기능
	public int like(int postId, int userId) {
		
		return heartDAO.insertHeart(postId, userId);
	}
	
	// 좋아요 취소 기능
	public int unLike(int postId, int userId) {
		
		return heartDAO.deleteHeart(postId, userId);
	}
	
	// 게시글 별 좋아요 개수 가져오기
	public int getHeartCount(int postId) {
		
		return heartDAO.selectHeartCount(postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요 여부 확인 기능
	public boolean isLike(int userId, int postId) {
		
		return (heartDAO.selectCountLikeByUserId(postId, userId) == 1)?true:false;
	}
}
