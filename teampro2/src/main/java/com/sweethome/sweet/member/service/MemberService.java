package com.sweethome.sweet.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.KakaoDTO;
import com.sweethome.sweet.member.vo.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public MemberVO modMember(String id) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public List listGoods() throws DataAccessException;
	 public String getAccessToken(String authorize_code) throws DataAccessException;
	 public KakaoDTO getUserInfo(String access_Token) throws DataAccessException;
	 public KakaoDTO kakaoNumber(KakaoDTO userInfo)  throws DataAccessException;
	 public KakaoDTO kakaologin(KakaoDTO member) throws DataAccessException;
	 public String overlapped(String id) throws DataAccessException;
}
