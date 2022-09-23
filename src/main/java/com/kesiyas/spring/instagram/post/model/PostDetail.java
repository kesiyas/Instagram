package com.kesiyas.spring.instagram.post.model;

import java.util.List;

import com.kesiyas.spring.instagram.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private List<CommentDetail> commentDetail;	
	
	private int heartCount;
	private boolean isLike;
		
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
	
	public List<CommentDetail> getCommentDetail() {
		return commentDetail;
	}
	public void setCommentDetail(List<CommentDetail> commentDetail) {
		this.commentDetail = commentDetail;
	}
	
	public int getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}
	
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
}
