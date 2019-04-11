package com.sts.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sts.domain.Board;
import com.sts.domain.User_;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	//팔로잉들 타임라인 출력
	public List<Board> timeLinePrint(Board b){
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.timeLinePrint", b);
	}
	
	//팔로잉들 게시물 출력
	@Override
	public List<Board> boardPrint2(Board b) {
		return null;
	}

	//유저 타임라인 출력
	@Override
	public List<Board> boardPrint1(Board b) {
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.myBoardList", b);
	}
	
	//유저 갤러리 출력 
	@Override
	public List<Board> userGallery(Board b){	
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.myBoardList", b);
	}
	
	//게시물 추가 
	@Override
	public int boardAdd(Board b) {
		return this.sqlSession.insert("com.sts.mapper.BoardMapper.myBoardAdd", b);
	}
	
	//게시물 수정 
	@Override
	public int boardUpdate(Board b) {
		return this.sqlSession.update("com.sts.mapper.BoardMapper.myBoardUpdate", b);
	}
	
	//게시물 삭제 
	@Override
	public int boardDel(Board b) {
		return this.sqlSession.delete("com.sts.mapper.BoardMapper.myBoardDel", b);
	}
	
	//좋아요 목록 
	@Override
	public List<Board> likeyPrint(String board_id) {
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.myBoardLikey", board_id);
	}

	//좋아요 추가 
	@Override
	public int likeyAdd(Board b) {
		return this.sqlSession.insert("com.sts.mapper.BoardMapper.likeyAdd", b);
	}

	//좋아요 수 +1(update)
	@Override
	public int likeyCountAdd(String board_id) {
		return this.sqlSession.update("com.sts.mapper.BoardMapper.likeyCountAdd", board_id);
	}
	
	//좋아요 취소 
	@Override
	public int likeyDel(Board b) {
		return this.sqlSession.delete("com.sts.mapper.BoardMapper.likeyDel", b);
	}
	
	//좋아요 수 -1(update)
	@Override
	public int likeyCountDel(String board_id) {
		return this.sqlSession.update("com.sts.mapper.BoardMapper.likeyCountDel", board_id);
	}
	
	//댓글 출력 
	@Override
	public List<Board> commentPrint(Board b) {
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.myBoardComment");
	}
	
	//댓글 작성 
	@Override
	public int commentAdd(Board b) {
		return this.sqlSession.insert("com.sts.mapper.BoardMapper.myBoardCommentAdd",b);
	}
	
	//댓글 삭제 
	@Override
	public int commentDel(Board b) {
		return this.sqlSession.delete("com.sts.mapper.BoardMapper.myBoardCommentDel", b);
	}
	
	//해시태그 작성 
	@Override
	public int hashtagAdd(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//해시태그 삭제 
	@Override
	public int hashtagDel(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	//팔로우 체크
	@Override
	public int followCheck(Board b) {
		return this.sqlSession.selectOne("com.sts.mapper.UserMapper.followCheck", b);
	}

	// 갤러리 클릭시#######################################
	public List<Board> galleryClick(Board b){
		return this.sqlSession.selectList("com.sts.mapper.BoardMapper.galleryClick", b);
	}

}
