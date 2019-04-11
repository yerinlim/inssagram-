package com.sts.persistence;

import java.util.List;

import com.sts.domain.Board;
import com.sts.domain.User_;

public interface BoardDAO {
	
	//팔로잉들 타임라인 출력
	public List<Board> timeLinePrint(Board b); //id_
	
	//팔로잉들 게시물 출력
	public List<Board> boardPrint2(Board b); 
	
	//유저 타임라인 출력
	public List<Board> boardPrint1(Board b); //id_

	//유저 갤러리 출력 
	public List<Board> userGallery(Board b); 
	
	//게시물 추가
	public int boardAdd(Board b);
	
	//게시물 수정 
	public int boardUpdate(Board b);
	
	//게시물 삭제
	public int boardDel(Board b); //id_ , board_id
	
	//좋아요 목록 
	public List<Board> likeyPrint(String board_id);
	
	//좋아요 추가
	public int likeyAdd(Board b); //id_, board_id
	
	//좋아요 수 +1(update)
	public int likeyCountAdd(String board_id);
	
	//좋아요 취소
	public int likeyDel(Board b);
	
	//좋아요 수 -1(update)
	public int likeyCountDel(String board_id);
	
	//댓글 출력
	public List<Board> commentPrint(Board b);

	//댓글 작성
	public int commentAdd(Board b);
	
	//댓글 삭제
	public int commentDel(Board b);
	
	//해시태그 작성 
	public int hashtagAdd(Board b);
	
	//해시태그 삭제
	public int hashtagDel(Board b);
	
	//팔로우 체크
	public int followCheck(Board b);
	
	// 갤러리 클릭시#######################################
	public List<Board> galleryClick(Board b);
}
