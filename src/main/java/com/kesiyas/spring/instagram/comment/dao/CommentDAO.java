package com.kesiyas.spring.instagram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("loginId") String loginId
			, @Param("content") String content);

	public List<Comment> selectCommentById(@Param("id") int id);
}