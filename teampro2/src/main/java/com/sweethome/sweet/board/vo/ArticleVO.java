package com.sweethome.sweet.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private int  board_id;
	private String title;
	private String content;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private Date new_date;
	private Date remove_date;
	private Date delete_date;
	private String status;
	private int like_type;
	private String mem_id;
	private String views;
	private String member_id;
	
	
	
	public ArticleVO() {
		System.out.println("ArticleVO 생성자");
	}
	
	
	public ArticleVO(int board_id,
					 String title,
					 String content,
					 String img1,
					 String img2,
					 String img3,
					 String img4,
					 String img5,
					 Date new_date,
					 String status,
					 int like_type,
					 String mem_id,
					 String views,
					 String member_id) {
		this.board_id = board_id;
		this.title = title;
		this.content = content;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
		this.new_date = new_date;
		this.status = status;
		this.like_type = like_type;
		this.mem_id = mem_id;
		this.views = views;
		this.member_id = member_id;
	}
	

	
	
	

	public int getBoard_id() {
		return board_id;
	}


	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	


	public Date getNew_date() {
		return new_date;
	}


	public void setNew_date(Date new_date) {
		this.new_date = new_date;
	}


	public Date getRemove_date() {
		return remove_date;
	}


	public void setRemove_date(Date remove_date) {
		this.remove_date = remove_date;
	}


	public Date getDelete_date() {
		return delete_date;
	}


	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getLike_type() {
		return like_type;
	}


	public void setLike_type(int like_type) {
		this.like_type = like_type;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getViews() {
		return views;
	}


	public void setViews(String views) {
		this.views = views;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

						// getImg1() 문자열 값을 반환한다
						//메서드를 통해 문자열 디코딩하고URLDecoder.decode값을 곧 img1이
				// 널 이거나 0 이 아닐때 디코딩에 문자인코딩 사용하여 성공하면 img1 값이 문자열로 반환된다
				// 이런식으로 했을때 이미지 파일을 업로드 및 다운로드 하는데 유용하다.
			// URLDecoder 는 java 제공하는 클래스중 하나인데 문자열 디코딩 할때 사용한다.
	public String getImg1() {
		try {
			if (img1 != null && img1.length() != 0) {
				img1 = URLDecoder.decode(img1, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return img1;
	}

	public void setImg1(String img1) {
		try {
			if(img1!= null && img1.length()!=0) {
				this.img1 = URLEncoder.encode(img1,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public String getImg2() {
		try {
			if (img2 != null && img2.length() != 0) {
				img2 = URLDecoder.decode(img2, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return img2;
	}

	public void setImg2(String img2) {
		try {
			if(img2!= null && img2.length()!=0) {
				this.img2 = URLEncoder.encode(img2,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	
	public String getImg3() {
		try {
			if (img3 != null && img3.length() != 0) {
				img3 = URLDecoder.decode(img3, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return img3;
	}

	public void setImg3(String img1) {
		try {
			if(img3!= null && img3.length()!=0) {
				this.img3 = URLEncoder.encode(img3,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public String getImg4() {
		try {
			if (img4 != null && img4.length() != 0) {
				img4 = URLDecoder.decode(img4, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return img4;
	}

	public void setImg4(String img4) {
		try {
			if(img4!= null && img4.length()!=0) {
				this.img4 = URLEncoder.encode(img4,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	
	public String getImg5() {
		try {
			if (img5 != null && img5.length() != 0) {
				img5 = URLDecoder.decode(img5, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return img5;
	}

	public void setImg5(String img5) {
		try {
			if(img5!= null && img5.length()!=0) {
				this.img5 = URLEncoder.encode(img5,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	

	
	
	
	

	
}
