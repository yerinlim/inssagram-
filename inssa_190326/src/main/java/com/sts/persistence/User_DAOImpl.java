package com.sts.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sts.domain.User_;
@Repository("user_DAO")
public class User_DAOImpl implements User_DAO{

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	//계정 정보 출력
	@Override
	public User_ myInfoPrint(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.myInfo", u);
	}
	
	//팔로워 목록
	@Override
	public List<User_> follower_list(User_ u) {
		return this.sqlSession.selectList("com.sts.mapper.UserMapper.followerList", u);
	}
	
	//팔로잉 목록
	@Override
	public List<User_> following_list(User_ u) {
		return this.sqlSession.selectList("com.sts.mapper.UserMapper.followingList", u);
	}
	
	//비밀번호 변경 
	@Override
	public int pwUpdate(User_ u) {
		return this.sqlSession.update("com.sts.mapper.UserMapper.pwUpdate", u);
	}
	
	//개인 정보 수정 
	@Override
	public int infoUpdate(User_ u) {
		// TODO Auto-generated method stub
		return 0;
	}

	//프로필 수정 - profile
	@Override
	public int profileUpdate(User_ u) {
		return this.sqlSession.update("com.sts.mapper.UserMapper.profileUpdate", u);
	}

	//상태 메시지 수정 - status_message
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
		return this.sqlSession.insert("com.sts.mapper.UserMapper.signin", u);
	}

	//회원탈퇴(계정 삭제) 
	@Override
	public int userDel(User_ u) {
		return 0;
	}
	
	//비밀번호 찾기 
	@Override
	public User_ findPw(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.findPw", u);
	}

	//이메일로 비밀번호 전송 
	@Override
	public User_ sendPw(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.sendPw", u);
	}

	//아이디 찾기 
	@Override
	public List<User_> findId(User_ u) {
		return this.sqlSession.selectList("com.sts.mapper.UserMapper.findId",u);
	}
	
	//아이디 중복검사 
	@Override
	public User_ idCheck(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.idCheck",u);
	}

	//로그인 
	@Override
	public User_ login(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.login", u);
	}

	//팔로우 체크
	@Override
	public int followCheck(User_ u) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.followCheck", u);
	}
	
	//팔로우
	@Override
	public int follow(User_ u) {
		return this.sqlSession.delete("com.sts.mapper.UserMapper.follow", u);
	}
	
	//언팔로우
	@Override
	public int unFollow(User_ u) {
		return this.sqlSession.delete("com.sts.mapper.UserMapper.unFollow", u);
	}

	//프로필 사진 수정 
	@Override
	public int profilePictureUpdate(User_ u) {
		return this.sqlSession.update("com.sts.mapper.UserMapper.profilePictureUpdate", u);
	}
	

}
