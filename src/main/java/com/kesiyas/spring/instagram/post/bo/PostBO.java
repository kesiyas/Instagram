package com.kesiyas.spring.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.instagram.common.FileManagerService;
import com.kesiyas.spring.instagram.post.dao.PostDAO;
import com.kesiyas.spring.instagram.post.model.Post;
import com.kesiyas.spring.instagram.post.model.PostDetail;
import com.kesiyas.spring.instagram.user.bo.UserBO;
import com.kesiyas.spring.instagram.user.model.User;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 포스트 작성
	public int addPost(String content, MultipartFile file, int userId) {		
		String imgPath = null;
		
		if(file != null) {
			
			imgPath = FileManagerService.saveFile(userId, file);
			
			if(imgPath == null) {
				// 파일 저장 실패
				return 0;
			}
		}
		
		return postDAO.insertPost(content, imgPath, userId);
	}
	
	public List<Post> getPostList(int userId) {
				
		return postDAO.selectPost(userId);
	}
	
	public List<PostDetail> getPost(){
		// 게시글 하나당 작성자 정보를 조합하는 과정
		List<Post> postList = postDAO.selectPost();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
		}
		
		return ;
	}
	
	// 포스트 삭제
	public int deletePost(int id, int userId) {
		
		return postDAO.deletePost(id, userId);
	}		
	
	// 사용자 검색
	public User searchUser(String loginId) {
		
		return postDAO.selectSearchUser(loginId);
	}
		
	public User getUserData(int userId) {
		
		return postDAO.selectOtherUser(userId);
	}
	
}
