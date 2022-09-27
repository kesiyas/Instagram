package com.kesiyas.spring.instagram.user.follow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.user.follow.model.Follow;

@Repository
public interface FollowDAO {

	public int insertFollow(
			@Param("followeeId") int followeeId
			, @Param("followerId") int followerId);
		
	public int selectCountFollowByFollowerId(
			@Param("followeeId") int followeeId
			, @Param("followerId") int followerId);
	
	public List<Follow> selectFollowList(@Param("loginUserId") int loginUserId);
}
