package com.beemosg.model;

import java.util.Date;

public class Tboard {
	private Integer total_count;
	private Integer rnum1;
	private Integer idx;
	private String gubun;
	private String category;
	private String title;
	private String content;
	private String author;
	private int hit;
	private Date insert_date;
	private String insert_id;
	private Date modify_date;
	private String cust_gb;
	
	public String getCust_gb() {
		return cust_gb;
	}
	public void setCust_gb(String cust_gb) {
		this.cust_gb = cust_gb;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public String getInsert_id() {
		return insert_id;
	}
	public void setInsert_id(String insert_id) {
		this.insert_id = insert_id;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
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
}
