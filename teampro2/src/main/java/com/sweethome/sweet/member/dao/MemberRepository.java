package com.sweethome.sweet.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.member.vo.KakaoDTO;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSessionTemplate sql;

	// 카카오 로그인
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sql.insert("mapper.member.kakaoInsert",userInfo);
	}

	// 카카오 확인
	public KakaoDTO findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		return sql.selectOne("mapper.member.findKakao", userInfo);
	}


	public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
		return sql.selectOne("mapper.member.kakaoNumber",userInfo);
	}
	
	
}
