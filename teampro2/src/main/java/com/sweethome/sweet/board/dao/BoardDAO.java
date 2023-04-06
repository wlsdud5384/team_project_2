package com.sweethome.sweet.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.board.vo.ArticleVO;


public interface BoardDAO {
	
	
				// 리스트 목록 게시판 목록
	public List selectAllArticlesList() throws DataAccessException;
	
				// 추가추가
	public int insertNewArticle(Map<String, Object> articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;
			
	
				// 글상세 보여줄때 섭;ㅣ스
	public ArticleVO selectArticle(int board_id) throws DataAccessException;
			
	
				//수정
	public void updateArticle(Map articleMap) throws DataAccessException;
				// 삭제
	public void deleteArticle(int board_id) throws DataAccessException;
				// 이미지
	public List selectImageFileList(int board_id) throws DataAccessException;

	
}
