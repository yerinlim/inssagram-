package com.sts.domain;

import java.sql.Date;

public class Board {
	private String board_id; //게시물 아이디
	private String id_; //사용자 아이디
	private String picture; //게시물 사진
	private String content; //게시물 내용
	private Date b_reg_date; //게시물 작성 일자
	private String comment_id; //댓글 아이디
	private String comment_content; //댓글 내용
	private Date c_reg_date; // 댓글 작성 일자
	private String likey_id; // 좋아요 아이디
	private String cid; //댓글 작성자 아이디
	private String lid; // 좋아요 누른 아이디 
	private String profile_; //프로필 사진 
	private int lState; //좋아요 상태 
	
	private String tag_name; // 태그명
	private int likey_count; // 좋아요 개수 !!!
	private int likey_check; //좋아요 체크 
	private String send_user; //팔로잉 
	private String receive_user; //팔로워  
	
	//getter, setter
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getId_() {
		return id_;
	}
	public void setId_(String id_) {
		this.id_ = id_;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(Date b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getC_reg_date() {
		return c_reg_date;
	}
	public void setC_reg_date(Date c_reg_date) {
		this.c_reg_date = c_reg_date;
	}
	public String getLikey_id() {
		return likey_id;
	}
	public void setLikey_id(String likey_id) {
		this.likey_id = likey_id;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getProfile_() {
		return profile_;
	}
	public void setProfile_(String profile_) {
		this.profile_ = profile_;
	}
	public int getLikey_count() {
		return likey_count;
	}
	public void setLikey_count(int likey_count) {
		this.likey_count = likey_count;
	}
	public int getlState() {
		return lState;
	}
	public void setlState(int lState) {
		this.lState = lState;
	}
	public int getLikey_check() {
		return likey_check;
	}
	public void setLikey_check(int likey_check) {
		this.likey_check = likey_check;
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

	
	
	
}
