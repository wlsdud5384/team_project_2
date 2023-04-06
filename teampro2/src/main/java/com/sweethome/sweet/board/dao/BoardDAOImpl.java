package com.sweethome.sweet.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.board.vo.ArticleVO;
import com.sweethome.sweet.board.vo.ImageVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override		// 목록 리스트 보여주기위함
	public List selectAllArticlesList() throws DataAccessException {
		List<ArticleVO> articlesList = articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}

	
				// 글쓰기 할때 쓰는거 같은데 흐음...맞다! 그리고 이미지도 추가
	@Override		//이미지 추가, 글쓰기 하면서 들린다. 
	public int insertNewArticle(Map<String, Object> articleMap) throws DataAccessException {
		int board_id = selectNewboard_id();	//board_id 는 게시판 번호 순서 숫자임 밑에 저걸 갖고오는게있음
		articleMap.put("board_id", board_id);
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		return board_id;
	}
    
	//다중 파일 업로드
	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setArticleNO(articleNO);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
   */
	
	@Override			// 게시판 글 상세 보여주는 dao 서비스랑도 이어진다. 근데 왜 이미지안나와?
	public ArticleVO selectArticle(int board_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", board_id);
	}

	@Override		// 수정위함
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override		//삭제
	public void deleteArticle(int board_id) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", board_id);
		
	}
	
	@Override		//이미지
	public List selectImageFileList(int board_id) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",board_id);
		return imageFileList;
	}
					
	
			// 글쓰기 얘도 같이 들리는거 같음 들린다기보단 참고하는거랄까 dao xml 연결 이름 맞춰야함 아니였음 글쓰기 
	private int selectNewboard_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewboard_id");
	}

	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}

}
