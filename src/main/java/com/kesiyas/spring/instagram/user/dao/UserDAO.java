package com.kesiyas.spring.instagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.instagram.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("phoneNumber") String phoneNumber);
	
	public int selectLoginId(@Param("loginId") String loginId);
	
	public User selectUser(@Param("loginId") String loginId, @Param("password") String password);
}