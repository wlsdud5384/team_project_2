package com.sweethome.sweet.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private int goods_id;
	private String name;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private String img6;
	private String type;
	private int floor;
	private int area;
	private int room_num;
	private int bthroom_num;
	private String homeDrctn;
	private String ht_type;
	private int parking;
	private int parking_pay;
	private boolean elevator;
	private boolean veranda;
	private String mainUse;
	private Date move_in_date;
	private Date using_date;
	private Date make_date;
	private Date remove_date;
	private String goods_dp_id;
	private int deposit;
	private int jeonse;
	private int payment;
	private int m_payment;
	private int b_payment;
	private int main_cost;
	private String content;
	private Double location_x;
	private Double location_y;
	private String status;
	private int like;
	private String addr1;
	private String addr2;
	private String region;
	
	public GoodsVO () {
		
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}

	public String getImg6() {
		return img6;
	}

	public void setImg6(String img6) {
		this.img6 = img6;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getBthroom_num() {
		return bthroom_num;
	}

	public void setBthroom_num(int bthroom_num) {
		this.bthroom_num = bthroom_num;
	}

	public String getHomeDrctn() {
		return homeDrctn;
	}

	public void setHomeDrctn(String homeDrctn) {
		this.homeDrctn = homeDrctn;
	}

	public String getHt_type() {
		return ht_type;
	}

	public void setHt_type(String ht_type) {
		this.ht_type = ht_type;
	}

	public int getParking() {
		return parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	public int getParking_pay() {
		return parking_pay;
	}

	public void setParking_pay(int parking_pay) {
		this.parking_pay = parking_pay;
	}

	public boolean isElevator() {
		return elevator;
	}

	public void setElevator(boolean elevator) {
		this.elevator = elevator;
	}

	public boolean isVeranda() {
		return veranda;
	}

	public void setVeranda(boolean veranda) {
		this.veranda = veranda;
	}

	public String getMainUse() {
		return mainUse;
	}

	public void setMainUse(String mainUse) {
		this.mainUse = mainUse;
	}

	public Date getMove_in_date() {
		return move_in_date;
	}

	public void setMove_in_date(Date move_in_date) {
		this.move_in_date = move_in_date;
	}

	public Date getUsing_date() {
		return using_date;
	}

	public void setUsing_date(Date using_date) {
		this.using_date = using_date;
	}

	public Date getMake_date() {
		return make_date;
	}

	public void setMake_date(Date make_date) {
		this.make_date = make_date;
	}

	public Date getRemove_date() {
		return remove_date;
	}

	public void setRemove_date(Date remove_date) {
		this.remove_date = remove_date;
	}

	public String getGoods_dp_id() {
		return goods_dp_id;
	}

	public void setGoods_dp_id(String goods_dp_id) {
		this.goods_dp_id = goods_dp_id;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getJeonse() {
		return jeonse;
	}

	public void setJeonse(int jeonse) {
		this.jeonse = jeonse;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getM_payment() {
		return m_payment;
	}

	public void setM_payment(int m_payment) {
		this.m_payment = m_payment;
	}

	public int getB_payment() {
		return b_payment;
	}

	public void setB_payment(int b_payment) {
		this.b_payment = b_payment;
	}

	public int getMain_cost() {
		return main_cost;
	}

	public void setMain_cost(int main_cost) {
		this.main_cost = main_cost;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Double getLocation_x() {
		return location_x;
	}

	public void setLocation_x(Double location_x) {
		this.location_x = location_x;
	}

	public Double getLocation_y() {
		return location_y;
	}

	public void setLocation_y(Double location_y) {
		this.location_y = location_y;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	
	
}
