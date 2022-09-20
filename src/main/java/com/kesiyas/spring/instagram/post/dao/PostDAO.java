package com.kesiyas.spring.instagram.post.dao;

import java.util.List
;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.post.model.Post;
import com.kesiyas.spring.instagram.post.model.PostDetail;
import com.kesiyas.spring.instagram.user.model.User;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("content") String content
			, @Param("imgPath") String imgPath
			, @Param("userId") int userId);
	
	public List<Post> selectPostList(@Param("userId") int userId);
	public List<Post> selectPost();
		
	public int deletePost(@Param("id") int id, @Param("userId") int userId);

	public User selectSearchUser(@Param("loginId") String loginId);
	
	public User selectOtherUser(@Param("userId") int userId);
};
