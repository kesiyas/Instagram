package com.kesiyas.spring.instagram.user.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.user.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;

	public int addFollow(int followeeId, int followerId) {
		
		return followDAO.insertFollow(followeeId, followerId);
	}
	
	// 포스트 작성유저와 팔로우가 되어 있는지 확인
	public boolean isLike(int followeeId, int followerId) {
		
		return true;
	}
	
}
