package com.sts.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sts.domain.Board;
import com.sts.domain.User_;
import com.sts.service.BoardService;
import com.sts.service.User_Service;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	@Resource(name="user_Service")
	private User_Service user_Service;
	
	//팔로우 한 사람들 타임라인
	@RequestMapping("/timeLine")
	public String timeLine(Board b, User_ u, Model model, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_()); b.setId_(userSession.getId_());
		
		// 게시물 출력
		model.addAttribute("boardList", this.boardService.timeLinePrint(b));
		//댓글 출력
		model.addAttribute("comment", this.boardService.commentPrint(b));
		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		List<User_> following_list = this.user_Service.following_list(userSession);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(userSession);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		
		model.addAttribute("followCheck2", fwMap);
		return "timeLine";
	}
	
	//팔로우 한 사람들 갤러리
	@RequestMapping("/gallery")
	public String gallery(Board b, Model model, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		b.setId_(userSession.getId_());
		
		model.addAttribute("list", this.boardService.timeLinePrint(b));
		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		List<User_> following_list = this.user_Service.following_list(userSession);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(userSession);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		
		model.addAttribute("followCheck2", fwMap);
		return "gallery";
	}

	//로그인 사용자 타임라인
	@RequestMapping(value= "/myTimeLine")
	public String myTimeLine(Board b, User_ u, Model model, HttpSession session, String board_id) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_()); b.setId_(userSession.getId_());
		b.setLid(userSession.getId_());
		
		//게시물 출력
		model.addAttribute("list", this.boardService.boardPrint1(b));
		//댓글 출력
		model.addAttribute("comment", this.boardService.commentPrint(b));
		//사용자정보 출력 
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		//팔로잉 목록 
		model.addAttribute("following_list", this.user_Service.following_list(u));
		//팔로워 목록 
		model.addAttribute("follower_list", this.user_Service.follower_list(u));

		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		
		List<User_> following_list = this.user_Service.following_list(userSession);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(userSession);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		
		
		
		model.addAttribute("followCheck2", fwMap);
		return "myTimeLine";
	}
	
	//로그인 사용자 갤러리
	@RequestMapping("/myGallery")
	public String myGallery(Board b, User_ u, Model model,HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setId_(userSession.getId_()); b.setId_(userSession.getId_());
		
		// 게시글 목록
		model.addAttribute("list", this.boardService.boardPrint1(b));
		// 유저정보
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		//팔로잉 목록 
		model.addAttribute("following_list", this.user_Service.following_list(u));
		//팔로워 목록 
		model.addAttribute("follower_list", this.user_Service.follower_list(u));
		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		List<User_> following_list = this.user_Service.following_list(userSession);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(userSession);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		model.addAttribute("followCheck2", fwMap);
		return "myGallery";
	}
	
	//특정 사용자 타임라인
	@RequestMapping("/userTimeLine")
	public String userTimeLine(Board b, User_ u, Model model, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setReceive_user(u.getId_());
		b.setLid(userSession.getId_());
		
		//게시물 출력
		model.addAttribute("list", this.boardService.boardPrint1(b));
		//댓글 출력
		model.addAttribute("comment", this.boardService.commentPrint(b));
		//사용자정보 출력
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		//팔로잉 목록 
		model.addAttribute("following_list", this.user_Service.following_list(u));
		//팔로워 목록 
		model.addAttribute("follower_list", this.user_Service.follower_list(u));
		
		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		List<User_> following_list = this.user_Service.following_list(u);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(u);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		model.addAttribute("followCheck2", fwMap);
		
		//(나와 클릭한 유저) 팔로우 여부 확인
		u.setSend_user(userSession.getId_());
		u.setReceive_user(u.getId_());
		model.addAttribute("followCheck", this.user_Service.followCheck(u));
		
		return "userTimeLine";
	}
	
	//특정 사용자 갤러리
	@RequestMapping("/userGallery")
	public String userGallery(Board b, User_ u, Model model, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		u.setReceive_user(u.getId_());
		b.setLid(userSession.getId_());
		
		// 게시글 목록
		model.addAttribute("list", this.boardService.boardPrint1(b));
		// 유저정보
		model.addAttribute("user", this.user_Service.myInfoPrint(u));
		// 팔로잉 목록
		model.addAttribute("following_list", this.user_Service.following_list(u));
		// 팔로워 목록
		model.addAttribute("follower_list", this.user_Service.follower_list(u));
		
		Map<String, Integer> fwMap = new HashMap<String, Integer>();
		List<User_> following_list = this.user_Service.following_list(u);
		for(User_ temp : following_list) {
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		List<User_> follower_list = this.user_Service.follower_list(u);
		for(User_ temp : follower_list) {
			temp.setReceive_user(temp.getSend_user());
			temp.setSend_user(userSession.getId_());
			fwMap.put(temp.getReceive_user(), this.user_Service.followCheck(temp));
		}
		model.addAttribute("followCheck2", fwMap);
		
		//(나와 클릭한 유저) 팔로우 여부 확인
		u.setSend_user(userSession.getId_());
		u.setReceive_user(u.getId_());
		model.addAttribute("followCheck", this.user_Service.followCheck(u));

		return "userGallery";
	}
	
	//게시물 추가 페이지 
	@RequestMapping("/boardAdd")
	public String boardAdd(Board b, RedirectAttributes rttr) {
		return "boardAdd";
	}
	
	//게시물 추가  
	@RequestMapping(value="/boardAdd/newAdd", method=RequestMethod.POST)
	public String newAdd(@RequestParam("pUrl") MultipartFile file, Board b, RedirectAttributes rttr, HttpSession session) {
		// 로그인 사용자 정보
		User_ userSession = (User_) session.getAttribute("userSession");
		b.setId_(userSession.getId_());
		
		//이미지 업로드 
		String url = this.boardService.restore(file);	
		b.setPicture(url);
		rttr.addFlashAttribute("result",this.boardService.boardAdd(b));
		return "redirect:/myTimeLine";
	}
	
	//내 게시물 삭제 
	@RequestMapping(value="/myTimeLine/myBoardDel")
	public String myBoardDel(Board b, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", this.boardService.boardDel(b));
		return "redirect:/myTimeLine";
	}
	
	//내 게시물 수정
	@RequestMapping(value="/myTimeLine/myBoardUpdate")
	public String myBoardUpdate(Board b, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", this.boardService.boardUpdate(b));
		return "redirect:/myTimeLine";
	}
	
	//로그인 사용자계정 댓글입력 
	@RequestMapping(value="/myTimeLine/insert")
	public String commentAdd(Board b, RedirectAttributes rttr) {
		int result= this.boardService.commentAdd(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/myTimeLine";
	}
	
	//로그인 사용자계정 댓글삭제 
	@RequestMapping(value="/myTimeLine/del")
	public String commentDel(Board b, RedirectAttributes rttr) {
		int result=this.boardService.commentDel(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/myTimeLine";
	}

	//좋아요 목록 ajax
	@RequestMapping(value="/userPage/likeyAjax")
	@ResponseBody
	public String likeyAjax(String board_id, HttpSession session) {
		User_ userSession = (User_) session.getAttribute("userSession");
		List<Board> likeyPrint = this.boardService.likeyPrint(board_id);
		
		int size = likeyPrint.size();
		int idx=1;
		String result="";
		result = "{\"board_id\":\"" + board_id + "\",\"likey_info\":[";  
		for(Board temp : likeyPrint) {
			temp.setSend_user(userSession.getId_());
			temp.setReceive_user(temp.getId_());
			
			result += "{\"id_\" :\"" + temp.getId_() + 
						"\", \"profile_\" : \"" + temp.getProfile_() +
						"\", \"check_\": ";
			int check_ = this.boardService.followCheck(temp);
			result += "\""+check_ +"\"}";
			if(idx<size) {
				result +=",";
			}
			++idx;
		}
		result +="]}";
		
		//System.out.println(result);
		return result;
	}
	
	//좋아요 추가,취소 
	@RequestMapping(value= {"/userPage/likey"}, method = {RequestMethod.GET})
	@ResponseBody
	public String heart(Board b, HttpServletRequest request){
		String lc= request.getParameter("likey_check");
		
		if(lc.equals("0")) {
			//좋아요 추가 
			this.boardService.likeyAdd(b);
			this.boardService.likeyCountAdd(b.getBoard_id());
			
		}else {
			//좋아요 취소 
			this.boardService.likeyDel(b);
			this.boardService.likeyCountDel(b.getBoard_id());
		}
		return lc;
	}
	
	
	//타임라인 댓글입력 
	@RequestMapping(value="/timeLine/insert")
	public String userCommentAdd(Board b, User_ u, RedirectAttributes rttr) {
		
		int result= this.boardService.commentAdd(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/timeLine";
	}
	
	//타임라인 댓글삭제 
	@RequestMapping(value="/timeLine/del")
	public String userCommentDel(Board b, RedirectAttributes rttr) {
		int result=this.boardService.commentDel(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/timeLine";
	}
	
	//특정 사용자계정 댓글입력 
	@RequestMapping(value="/userTimeLine/insert")
	public String userTCommentAdd(Board b, User_ u, RedirectAttributes rttr, HttpServletRequest request) {
		String id_ = request.getParameter("uId");
		int result= this.boardService.commentAdd(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/userTimeLine?id_="+id_;
	}
	
	//특정 사용자계정 댓글삭제 
	@RequestMapping(value="/userTimeLine/del")
	public String userTCommentDel(Board b, RedirectAttributes rttr, HttpServletRequest request) {
		String id_ = request.getParameter("id_");
		
		int result=this.boardService.commentDel(b);
		rttr.addFlashAttribute("result", result);
		return "redirect:/userTimeLine?id_="+id_;
	}
	
	
	/*****************************************************************/
	//갤러리 모달 게시글 출력 
	@RequestMapping(value="/galleryClick", produces="application/text; charset=utf8")
	@ResponseBody
	public String galleryClick(Board b) {
		List<Board> a = this.boardService.galleryClick(b);
		int size = a.size();
		int idx = 1;
		String result = "{\"board_id\":\"" + b.getBoard_id() +
				"\",\"content\":\"" + a.get(0).getContent() +
				"\",\"comment\":[";
		for(Board i : a) {
			if(i.getComment_id()!=null) {
				result += "{\"comment_id\":\"" + i.getComment_id();
				result += "\",\"Cid\":\"" + i.getCid();
				result += "\",\"comment_content\":\""+i.getComment_content() + "\"}";
				if(idx < size) {
					result += ",";
				}
				++idx;
			}
		}
		result += "]}";
		 //System.out.println(result);
		return result;
	}
	
}
