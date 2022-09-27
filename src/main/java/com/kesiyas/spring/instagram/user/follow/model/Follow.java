package com.kesiyas.spring.instagram.user.follow.model;

import java.util.Date;

public class Follow {
	
	private int id;
	private int followeeId;
	private int followerId;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFolloweeId() {
		return followeeId;
	}
	public void setFolloweeId(int followeeId) {
		this.followeeId = followeeId;
	}
	public int getFollowerId() {
		return followerId;
	}
	public void setFollowerId(int followerId) {
		this.followerId = followerId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	

}
