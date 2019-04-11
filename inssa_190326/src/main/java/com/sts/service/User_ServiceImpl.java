package com.sts.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sts.domain.User_;
import com.sts.handler.MailHandler;
import com.sts.persistence.*;
@Service("user_Service")
public class User_ServiceImpl implements User_Service{
	
	@Resource(name="user_DAO")
	private User_DAO user_DAO;
	
	@Inject
	private JavaMailSender mailSender;
	   
	//계정 정보 출력 
	@Override
	public User_ myInfoPrint(User_ u) {
		return this.user_DAO.myInfoPrint(u);
	}

	//팔로워 목록 
	@Override
	public List<User_> follower_list(User_ u) {
		return this.user_DAO.follower_list(u);
	}

	//팔로잉 목록 
	@Override
	public List<User_> following_list(User_ u) {
		return this.user_DAO.following_list(u);
	}

	//비밀번호 변경 
	@Override
	public int pwUpdate(User_ u) {
		return this.user_DAO.pwUpdate(u);
	}

	//개인 정보 수정 
	@Override
	public int infoUpdate(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//프로필 수정 
	@Override
	public int profileUpdate(User_ u) {
		return this.user_DAO.profileUpdate(u);
	}

	//상태 메시지 수정 
	@Override
	public int messageUpdate(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//프로필 삭제 
	@Override
	public int profileDel(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//상태 메시지 삭제 
	@Override
	public int messageDel(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//회원가입(계정 추가)
	@Override
	public int userAdd(User_ u) {
		return this.user_DAO.userAdd(u);
	}

	//회원탈퇴(계정 삭제)
	@Override
	public int userDel(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//비밀번호 찾기 
	@Override
	public User_ findPw(User_ u) {
		return this.user_DAO.findPw(u);
	}

	//이메일로 비밀번호 전송 
	@Override
	public User_ sendPw(User_ u) throws Exception {
		User_ uu = this.user_DAO.sendPw(u);
		String id_ = u.getId_();
		String email = u.getEmail();
	    String pw_ =uu.getPw_();
		
	    //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[INSSAGRAM] 비밀번호 찾기 안내");
        sendMail.setText(
                new StringBuffer().append("<h1>"+id_+"님의 비밀번호 안내</h1>").
                append("회원님의 비밀번호는:"+pw_ +"입니다.").toString());
        
        sendMail.setFrom("ktt419@gmail.com", "서어비스센터 ");
        sendMail.setTo(email);
        sendMail.send();
		return uu;
	}

	//아이디 찾기 
	@Override
	public List<User_> findId(User_ u) {
		return this.user_DAO.findId(u);
	}

	//아이디 중복검사 
	@Override
	public User_ idCheck(User_ u) {
		return this.user_DAO.idCheck(u);
	}
	
	//로그인 
	@Override
	public User_ login(User_ u) {
		return this.user_DAO.login(u);
	}

	//팔로우 체크
	@Override
	public int followCheck(User_ u) {
		return this.user_DAO.followCheck(u);
	}
	
	//팔로우
	@Override
	public int follow(User_ u) {
		return this.user_DAO.follow(u);
	}
	
	//팔로우
	@Override
	public int unFollow(User_ u) {
		return this.user_DAO.unFollow(u);
	}

	//프로필 사진 수정 
	@Override
	public int profilePictureUpdate(User_ u) {
		return this.user_DAO.profilePictureUpdate(u);
	}
}
