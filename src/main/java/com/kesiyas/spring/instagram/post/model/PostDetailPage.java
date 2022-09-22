package com.kesiyas.spring.instagram.post.model;

import java.util.List;

import com.kesiyas.spring.instagram.user.model.User;

public class PostDetailPage {
	
	private User user;
	private Post post;
	private List<Post> postList;
	private int postCount;
	
	public List<Post> getPostList() {
		return postList;
	}
	public void setPostList(List<Post> postList) {
		this.postList = postList;
	}
	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	

}
