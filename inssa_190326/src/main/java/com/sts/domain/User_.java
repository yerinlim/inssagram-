package com.sts.domain;

import java.sql.Date;

public class User_ {
	private String id_; //사용자 아이디
	private String pw_; //사용자 패스워드
	private String profile_; //프로필 사진
	private String status_message; //상태 메시지
	private Date reg_date; //사용자 가입일 
	private String email; //사용자 이메일
	private String send_user; //팔로잉
	private String receive_user; //팔로워
	private String newPw; 	//비밀번호 변경시 새 비밀번호
	
	//getter, setter
	public String getId_() {
		return id_;
	}
	public void setId_(String id_) {
		this.id_ = id_;
	}
	public String getPw_() {
		return pw_;
	}
	public void setPw_(String pw_) {
		this.pw_ = pw_;
	}
	public String getProfile_() {
		return profile_;
	}
	public void setProfile_(String profile_) {
		this.profile_ = profile_;
	}
	public String getStatus_message() {
		return status_message;
	}
	public void setStatus_message(String status_message) {
		this.status_message = status_message;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSend_user() {
		return send_user;
	}
	public void setSend_user(String send_user) {
		this.send_user = send_user;
	}
	public String getReceive_user() {
		return receive_user;
	}
	public void setReceive_user(String receive_user) {
		this.receive_user = receive_user;
	}
	public String getNewPw() {
		return newPw;
	}
	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	
}
