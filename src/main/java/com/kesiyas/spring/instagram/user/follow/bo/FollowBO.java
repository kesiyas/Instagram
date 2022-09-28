package com.kesiyas.spring.instagram.user.follow.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.post.model.FollowDetail;
import com.kesiyas.spring.instagram.user.bo.UserBO;
import com.kesiyas.spring.instagram.user.follow.dao.FollowDAO;
import com.kesiyas.spring.instagram.user.follow.model.Follow;
import com.kesiyas.spring.instagram.user.model.User;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;
	
	@Autowired
	private UserBO userBO;

	public int addFollow(int followeeId, int followerId) {
		
		return followDAO.insertFollow(followeeId, followerId);
	}
	
	// 포스트 작성유저와 팔로우가 되어 있는지 확인
	public boolean isFollow(int followeeId, int followerId) {
			
		return (followDAO.selectCountFollowByFollowerId(followeeId, followerId) == 1)?true:false;
	}
	
	// 로그인중인 유저의 팔로우 목록 가져오기
	public List<FollowDetail> followList(int loginUserId) {
		
		List<Follow> followList = followDAO.selectFollowList(loginUserId);
		
		List<FollowDetail> followDetailList = new ArrayList<>();
		
		for(Follow follow : followList) {
			
			int followeeId = follow.getFolloweeId();
			
			User followeeUser = userBO.getUserById(followeeId);
			
			FollowDetail followDetail = new FollowDetail();
			followDetail.setUser(followeeUser);
			followDetail.setFollow(follow);
			
			followDetailList.add(followDetail);			
		}
		
		return followDetailList;
	}
	
	// 팔로우 취소 기능
	public int unFollow(int followeeId, int followerId) {
		
		return followDAO.deleteFollow(followeeId, followerId);
	}
	
}
