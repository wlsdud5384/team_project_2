package com.sweethome.sweet.member.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("kakaoDTO")
public class KakaoDTO {

	private long number;
	private String nickname;
	private String email;
	
	public long getnumber() {
		return number;
	}
	public void setnumber(long number) {
		this.number = number;
	}
	public String getname() {
		return nickname;
	}
	public void setname(String nickname) {
		this.nickname = nickname;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	
	
}
