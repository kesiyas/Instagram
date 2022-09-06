package com.kesiyas.spring.instagram.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("content") String content
			, @Param("imgPath") String imgPath
			, @Param("userId") int userId);
}
