package com.sweethome.sweet.memberB.order.vo;

import java.sql.Date;

public class OrederVOB {
	private int goodscon_id;
	private int goods_id;
	private String member_id;
	private String bp_id;
	private int price;
	private Date sale_date;
	private String region;
	
	public OrederVOB() {
	      
	   }

	public int getGoodscon_id() {
		return goodscon_id;
	}

	public void setGoodscon_id(int goodscon_id) {
		this.goodscon_id = goodscon_id;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBp_id() {
		return bp_id;
	}

	public void setBp_id(String bp_id) {
		this.bp_id = bp_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getSale_date() {
		return sale_date;
	}

	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	
}
