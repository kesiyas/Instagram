package com.kesiyas.spring.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.instagram.common.EncryptUtils;
import com.kesiyas.spring.instagram.user.dao.UserDAO;
import com.kesiyas.spring.instagram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String nickname
			, String phoneNumber) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, nickname, phoneNumber);
	}
	
	public boolean isDuplicate(String loginId) {
		
		return (userDAO.selectCheckLoginId(loginId) != 0) ? true : false;
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	// 계정 찾기
	public User getloginId(String name, String nickname) {
		
		return userDAO.selectLoginId(name, nickname);
	}
	
	// user 테이블의 id를 통해서 사용자 정보를 얻어 오는 기능
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
}
