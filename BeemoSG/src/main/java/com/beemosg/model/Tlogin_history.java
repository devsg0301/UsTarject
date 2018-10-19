package com.beemosg.model;

import java.util.Date;

public class Tlogin_history {
	private Integer total_count;
	private Integer rnum1;
	private int seq;
	private String cust_no;
	private String cust_name;
	private String cust_id;
	private Date insert_date;
	
	public Integer getRnum1() {
		return rnum1;
	}
	public void setRnum1(Integer rnum1) {
		this.rnum1 = rnum1;
	}
	public Integer getTotal_count() {
		return total_count;
	}
	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCust_no() {
		return cust_no;
	}
	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
}
