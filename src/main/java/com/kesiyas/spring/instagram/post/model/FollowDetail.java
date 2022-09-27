package com.kesiyas.spring.instagram.post.model;

import com.kesiyas.spring.instagram.user.follow.model.Follow;
import com.kesiyas.spring.instagram.user.model.User;

public class FollowDetail {
	private Follow follow;
	private User user;
	
	public Follow getFollow() {
		return follow;
	}
	public void setFollow(Follow follow) {
		this.follow = follow;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
