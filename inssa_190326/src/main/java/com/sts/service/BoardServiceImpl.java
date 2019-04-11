package com.sts.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sts.domain.Board;
import com.sts.domain.User_;
import com.sts.persistence.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	//파일이 저장될 위치
	private static final String SAVE_PATH = "/Users/lim_yerin/Documents/inssa/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/inssa_190326/resources/images/"; 
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	//팔로잉들 타임라인 출력
	@Override
	public List<Board> timeLinePrint(Board b){
		return this.boardDAO.timeLinePrint(b);
	}
	
	//팔로잉들 갤러리 출력
	@Override
	public List<Board> boardPrint2(Board b) {
		// TODO Auto-generated method stub
		return null;
	}
	//유저 타임라인 출력
	@Override
	public List<Board> boardPrint1(Board b) {
		return this.boardDAO.boardPrint1(b);
	}
	
	//유저 갤러리 출력 
	@Override
	public List<Board> userGallery(Board b){
		return this.boardDAO.userGallery(b);
	}

	//게시물 추가
	@Override
	public int boardAdd(Board b) {
		return this.boardDAO.boardAdd(b);
	}
	
	//게시물 수정 
	@Override
	public int boardUpdate(Board b) {
		return this.boardDAO.boardUpdate(b);
	}
	
	//게시물 삭제 
	@Override
	public int boardDel(Board b) {
		return this.boardDAO.boardDel(b);
	}
	
	//좋아요 목록 
	@Override
	public List<Board> likeyPrint(String board_id) {
		return this.boardDAO.likeyPrint(board_id);
	}

	//좋아요 추가 
	@Override
	public int likeyAdd(Board b) {
		return this.boardDAO.likeyAdd(b);
	}
	
	//좋아요 수 +1(update) 
	@Override
	public int likeyCountAdd(String board_id) {
		return this.boardDAO.likeyCountAdd(board_id);
	}
	
	//좋아요 취소 
	@Override
	public int likeyDel(Board b) {
		return this.boardDAO.likeyDel(b);
	}
	
	//좋아요 수 -1(update)
	@Override
	public int likeyCountDel(String board_id) {
		return this.boardDAO.likeyCountDel(board_id);
	}
	
	//댓글 출력 
	@Override
	public List<Board> commentPrint(Board b) {
		return this.boardDAO.commentPrint(b);
	}
	
	//댓글 작성 
	@Override
	public int commentAdd(Board b) {
		return this.boardDAO.commentAdd(b);
	}
	
	//댓글 삭제 
	@Override
	public int commentDel(Board b) {
		return this.boardDAO.commentDel(b);
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
		return this.boardDAO.followCheck(b);
	}
	
	// 갤러리 클릭시#######################################
	public List<Board> galleryClick(Board b){
		return this.boardDAO.galleryClick(b);
	}
	
	//파일 업로드 
	@Override
	public String restore(MultipartFile multipartFile) {
		 String url = null;
		   try {
		     // 파일 정보
		     String originFilename = multipartFile.getOriginalFilename();
		     String extName
		       = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		     Long size = multipartFile.getSize();
		      
		     // 서버에서 저장 할 파일 이름
		     String saveFileName = genSaveFileName(extName);
		      
		     System.out.println("originFilename : " + originFilename);
		     System.out.println("extensionName : " + extName);
		     System.out.println("size : " + size);
		     System.out.println("saveFileName : " + saveFileName);
		      
		     writeFile(multipartFile, saveFileName);
		     url = saveFileName;
		  }
		   catch (IOException e) {
		     // 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
		     // 편의상 RuntimeException을 던진다.
		     // throw new FileUploadException();
		     throw new RuntimeException(e);
		  }
		return url;
	}
	
	 //현재 시간을 기준으로 파일 이름 생성
	 //이름 중복 방지 
	 private String genSaveFileName(String extName) {
	   String fileName = "";
	   
	   Calendar calendar = Calendar.getInstance();
	   fileName += calendar.get(Calendar.YEAR);
	   fileName += calendar.get(Calendar.MONTH);
	   fileName += calendar.get(Calendar.DATE);
	   fileName += calendar.get(Calendar.HOUR);
	   fileName += calendar.get(Calendar.MINUTE);
	   fileName += calendar.get(Calendar.SECOND);
	   fileName += calendar.get(Calendar.MILLISECOND);
	   fileName += extName;
	    
	   return fileName;
	}
	 //파일을 실제로 write 하는 메서드
	 private boolean writeFile(MultipartFile multipartFile, String saveFileName)
	               throws IOException{
	   boolean result = false;
	   byte[] data = multipartFile.getBytes();
	   FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
	   fos.write(data);
	   fos.close();
	    
	   return result;
	}


}
