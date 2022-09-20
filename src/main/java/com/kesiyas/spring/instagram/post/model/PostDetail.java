package com.kesiyas.spring.instagram.post.model;

import java.util.List;

import com.kesiyas.spring.instagram.comment.model.Comment;
import com.kesiyas.spring.instagram.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private List<Comment> comment;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
}
