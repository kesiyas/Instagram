package com.kesiyas.spring.instagram.post.model;

import com.kesiyas.spring.instagram.comment.model.Comment;
import com.kesiyas.spring.instagram.user.model.User;

public class CommentDetail {
	
	private Comment comment;
	private User user;
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
