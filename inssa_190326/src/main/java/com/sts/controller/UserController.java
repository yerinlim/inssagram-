package com.sts.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sts.domain.User_;
import com.sts.service.BoardService;
import com.sts.service.User_Service;

@Controller
public class UserController {
	
	@Resource(name="user_Service")
	private User_Service user_Service;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	//회원가입 페이지 
	@RequestMapping("signin")
	public String signin() {
		
		return "signin";
	}
	
	//회원가입 액션 
	@RequestMapping("/signin/userAdd")
	public String userAdd(User_ u, RedirectAttributes rttr) {
		String url="";
		int result =this.user_Service.userAdd(u);
		rttr.addFlashAttribute("result", result);
		if(result==1) {
			url="redirect:/signSuccess";
		}else {
			
		}
		return url;
	}
	
	//회원가입 완료 페이지
	@RequestMapping("/signSuccess")
	public String signSuccess() {
		return "signSuccess";
	}
	
	//아이디, 비밀번호 찾기 페이지 
	@RequestMapping("/find")
	public String find() {
		return "find";
	}
	
	//아이디 찾기 페이지 
	@RequestMapping("/findId")
	public String findId() {
		return "findId";
	}
	
	//아이디 찾기(이메일 입력하면 아이디 반환)
	@RequestMapping(value="/findId/realFindId")
	@ResponseBody
	public List<User_> realFindId(User_ u) {
		return this.user_Service.findId(u);
	}
	
	//비밀번호 찾기 성공 페이지
	@RequestMapping(value="/pwFindSuccess")
	public String pwFindSuccess() {
		return "pwFindSuccess";
	}
	
	//비밀번호 찾기(아이디 입력하면 이메일 반환)
	@RequestMapping(value="/find/findPw", method=RequestMethod.POST)
	@ResponseBody
	public User_ findPw(User_ u) {
		return this.user_Service.findPw(u);
	}
	
	//비밀번호 이메일 전송
	@RequestMapping(value="/find/findPw/sendPw")
	public String sendPw(User_ u) throws Exception {
		String url="";
		User_ uu =this.user_Service.sendPw(u);
		
		if(uu!=null) {
			url="redirect:/pwFindSuccess";
		}else {
			url="redirect:/find";
		}
		return url;
	}
	
	//아이디 중복검사 
	@RequestMapping("/signin/idCheck")
	@ResponseBody
	public User_ idCheck(User_ u) {
		System.out.println(u.getId_());
		User_ temp = this.user_Service.idCheck(u);
		System.out.println(temp.getId_());
		
		return this.user_Service.idCheck(u);
	}
	
	//팔로우
	@RequestMapping("/follow")
	@ResponseBody
	public int follow(User_ u) {
		return this.user_Service.follow(u);
	}
	
	//언팔로우
	@RequestMapping("/unFollow")
	@ResponseBody
	public int unFollow(User_ u) {
		return this.user_Service.unFollow(u);
	}
	
	//프로필 편집 페이지 
	@RequestMapping("/profileEdit")
	public String profileEdit(Model model, User_ u, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_());
		
		//유저 정보
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		return "profileEdit";
	}
	
	//프로필 변경(update)
	@RequestMapping("/profileUpdate")
	public String profileUpdate(User_ u, RedirectAttributes rttr, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_());
		
		String txt = "fail";
		int result = this.user_Service.profileUpdate(u);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:profileEdit";
	}
	
	//비밀번호 변경 페이지 
	@RequestMapping("/passwordEdit")
	public String passwordEdit(Model model, User_ u, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_());
		
		//유저 정보
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		return "passwordEdit";
	}
	
	//비밀번호 변경(update)
	@RequestMapping("/passwordUpdate")
	public String passwordUpdate(User_ u,  RedirectAttributes rttr) {
		String txt = "fail";
		int result = this.user_Service.pwUpdate(u);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:passwordEdit";
	}
	
	//프로필 사진 변경 페이지 
	@RequestMapping("/profilePicture")
	public String profilePicture(Model model, User_ u, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_());
		
		// 유저 정보
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		return "profilePictureEdit";
	}

	//프로필 사진 변경(update)
	@RequestMapping(value = "/profilePictureUpdate", method = RequestMethod.POST)
	public String profilePictureUpdate(@RequestParam("pUrl") MultipartFile file, User_ u, 
						RedirectAttributes rttr,HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_());
		
		// 이미지 업로드
		String url = this.boardService.restore(file);
		System.out.println(url);
		
		u.setProfile_(url);
		String txt = "fail";

		int result = this.user_Service.profilePictureUpdate(u);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);
		
		return "redirect:profilePicture";
	}
}
