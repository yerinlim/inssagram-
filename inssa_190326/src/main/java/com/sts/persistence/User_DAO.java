package com.sts.persistence;

import java.util.List;

import com.sts.domain.User_;

public interface User_DAO {
	
	//계정 정보 출력
	public User_ myInfoPrint(User_ u);
	
	//팔로워 목록
	public List<User_> follower_list(User_ u);

	//팔로잉 목록
	public List<User_> following_list(User_ u);
	
	//비밀번호 변경 
	public int pwUpdate(User_ u);
	
	//개인 정보 수정
	public int infoUpdate(User_ u);
	
	//프로필 수정 - profile
	public int profileUpdate(User_ u);
	
	//상태 메시지 수정 - status_message
	public int messageUpdate(User_ u);
	
	//프로필 삭제
	public int profileDel(User_ u);
	
	//상태 메시지 삭제
	public int messageDel(User_ u);
	
	//회원가입(계정 추가)
	public int userAdd(User_ u);
	
	//회원탈퇴(계정 삭제)
	public int userDel(User_ u);
	
	//비밀번호 찾기 
	public User_ findPw(User_ u);
	
	//이메일로 비밀번호 전송 
	public User_ sendPw(User_ u);
	
	//아이디 찾기
	public List<User_> findId(User_ u);
	
	//아이디 중복검사 
	public User_ idCheck(User_ u);
	
	//로그인 
	public User_ login(User_ u);
	
	//팔로우 체크
	public int followCheck(User_ u);
	
	//팔로우
	public int follow(User_ u);
	
	//언팔로우
	public int unFollow(User_ u);
	
	//프로필 사진 수정
	public int profilePictureUpdate(User_ u);
	
}
