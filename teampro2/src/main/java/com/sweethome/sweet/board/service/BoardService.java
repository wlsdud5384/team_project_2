package com.sweethome.sweet.board.service;

import java.util.List;
import java.util.Map;

import com.sweethome.sweet.board.vo.ArticleVO;

public interface BoardService {
	
			// 리스트 목록
	public List<ArticleVO> listArticles() throws Exception;
				
			//추가하려고
	public int addNewArticle(Map articleMap) throws Exception;
			
				//글상세보기하려고
	public ArticleVO viewArticle(int board_id) throws Exception;
	//public Map viewArticle(int articleNO) throws Exception;
				//수정하려고
	public void modArticle(Map articleMap) throws Exception;
				//지울라고~
	public void removeArticle(int articleNO) throws Exception;
}
