package com.kesiyas.spring.instagram.user.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {

	public int insertFollow(
			@Param("followeeId") int followeeId
			, @Param("followerId") int followerId);
	
	public int selectFollow(
			@Param("followeeId") int followeeId
			, @Param("followerId") int followerId);
	
}
