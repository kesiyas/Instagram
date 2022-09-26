package com.kesiyas.spring.instagram.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.comment.dao.CommentDAO;
import com.kesiyas.spring.instagram.comment.model.Comment;
import com.kesiyas.spring.instagram.post.model.CommentDetail;
import com.kesiyas.spring.instagram.user.bo.UserBO;
import com.kesiyas.spring.instagram.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
	}
	
	// 게시글에 대응하는 댓글 리스트 가져오는 기능
	public List<CommentDetail> getCommentById(int id) {
		List<Comment> commentList = commentDAO.selectCommentById(id);
		
		List<CommentDetail> commnetDetailList = new ArrayList<>();
		
		for(Comment comment : commentList) {
			
			id = comment.getUserId();
			
			User user = userBO.getUserById(id);
			
			CommentDetail commentDetail = new CommentDetail();
			
			commentDetail.setUser(user);
			commentDetail.setComment(comment);
			
			commnetDetailList.add(commentDetail);
		}
			
		return commnetDetailList;	
	}
	
	// 댓글 삭제 기능
	public int deleteComment(int postId, int userId) {
		
		return commentDAO.deleteComment(postId, userId);
	}

}
