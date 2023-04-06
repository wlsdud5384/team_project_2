package com.sweethome.sweet.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public interface BoardController {
	
							//목록나오게
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
							//추가~
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	
							//상세보려고~
	public ModelAndView viewArticle(@RequestParam("board_id") int board_id,
			                        HttpServletRequest request, HttpServletResponse response) throws Exception;
	
							//아마 수정
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  HttpServletResponse response) throws Exception;
	
							//지우는거
	public ResponseEntity  removeArticle(@RequestParam("board_id") int board_id,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	

}
