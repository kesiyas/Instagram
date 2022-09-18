package com.kesiyas.spring.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("content") String content
			, @Param("imgPath") String imgPath
			, @Param("userId") int userId);
	
	public List<Post> selectPost(@Param("userId") int userId);
	
	public int deletePost(@Param("id") int id, @Param("userId") int userId);

}
