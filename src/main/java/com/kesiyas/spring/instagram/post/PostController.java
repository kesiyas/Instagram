package com.kesiyas.spring.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.instagram.post.bo.PostBO;
import com.kesiyas.spring.instagram.post.model.FollowDetail;
import com.kesiyas.spring.instagram.post.model.PostDetail;
import com.kesiyas.spring.instagram.post.model.PostDetailPage;
import com.kesiyas.spring.instagram.user.follow.bo.FollowBO;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private FollowBO followBO;
	
	@GetMapping("/create/view")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/peed/view")
	public String peed() {
		return "post/list";
	}
	
	// 타임라인 정보 가져오기
	@GetMapping("/list/view")
	public String timeLine(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPost(userId);		
		model.addAttribute("postList", postList);
		
		List<FollowDetail> followDetailList = followBO.followList(userId);
		model.addAttribute("followDetailList", followDetailList);
		
		return "post/list";
	}
		
	// 사용자 페이지로 이동
	@GetMapping("/detail/view") 
	public String userDetailPage(Model model, @RequestParam("userId") int userId) {
		
		PostDetailPage postDetail = postBO.getUserData(userId);
				
		model.addAttribute("postDetail", postDetail);
		
		return "post/detail";
		
	}
	
	
				
	
}
