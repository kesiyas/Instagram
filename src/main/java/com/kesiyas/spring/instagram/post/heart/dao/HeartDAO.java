package com.kesiyas.spring.instagram.post.heart.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.post.heart.model.Heart;

@Repository
public interface HeartDAO {

	public int insertHeart(@Param("postId") int postId, @Param("userId") int userId);

	public int deleteHeart(@Param("postId") int postId, @Param("userId") int userId);
			
	public int selectHeartCount(@Param("postId") int postId);
	
	public int selectCountLikeByUserId(@Param("postId") int postId, @Param("userId") int userId);
}
