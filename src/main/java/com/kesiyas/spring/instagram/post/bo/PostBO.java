package com.kesiyas.spring.instagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.instagram.comment.bo.CommentBO;
import com.kesiyas.spring.instagram.common.FileManagerService;
import com.kesiyas.spring.instagram.post.dao.PostDAO;
import com.kesiyas.spring.instagram.post.heart.bo.HeartBO;
import com.kesiyas.spring.instagram.post.model.CommentDetail;
import com.kesiyas.spring.instagram.post.model.Post;
import com.kesiyas.spring.instagram.post.model.PostDetail;
import com.kesiyas.spring.instagram.post.model.PostDetailPage;
import com.kesiyas.spring.instagram.user.bo.UserBO;
import com.kesiyas.spring.instagram.user.model.User;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired 
	private CommentBO commentBO;
	
	@Autowired
	private HeartBO heartBO;
	
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
				
		return postDAO.selectPostList(userId);
	}
	
	public List<PostDetail> getPost(int loginUserId){
		// 게시글 하나당 작성자 정보를 조합하는 과정
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
				
		for(Post post : postList) {
			
			int postId = post.getId();
			
			// 해당하는 게시글의 작성자
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			
			List<CommentDetail> commentDetailList = commentBO.getCommentById(postId);		
			
			int heartCount = heartBO.getHeartCount(postId);
			boolean isLike = heartBO.isLike(loginUserId, postId);
		
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);	
			postDetail.setCommentDetail(commentDetailList);
			postDetail.setHeartCount(heartCount);
			postDetail.setLike(isLike);
						
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 포스트 삭제
	public int deletePost(int id, int userId) {
		
		return postDAO.deletePost(id, userId);
	}		
			
	// 개인 정보 페이지
	public PostDetailPage getUserData(int userId) {
		
		int postCount = postDAO.selectPostCount(userId);
		
		List<Post> postList = postDAO.selectPostList(userId);
		
		User user = userBO.getUserById(userId);
		
		PostDetailPage postDetail = new PostDetailPage();
		
		postDetail.setPostList(postList);
		postDetail.setUser(user);
		postDetail.setPostCount(postCount);
		
		return postDetail;
	}
	
	
}
