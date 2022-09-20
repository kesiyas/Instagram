package com.kesiyas.spring.instagram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.comment.dao.CommentDAO;
import com.kesiyas.spring.instagram.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String loginId, String content) {
		
		return commentDAO.insertComment(userId, postId, loginId, content);
	}
	
	public List<Comment> getCommentById(int id) {
		
		return commentDAO.selectCommentById(id);
		
	}

}
