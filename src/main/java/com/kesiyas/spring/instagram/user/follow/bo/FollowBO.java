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
	
}
