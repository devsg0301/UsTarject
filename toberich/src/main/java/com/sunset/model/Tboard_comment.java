package com.sunset.model;

import java.util.Date;

public class Tboard_comment {
	private Integer idx;
	private Integer seq;
	private String comment;
	private String author;
	private String insert_id;
	private Date insert_date;
	private Date modify_date;
	private Integer idx_no;
	private Integer seq_re;
	private Integer seq_no;
	private Integer gap;
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getInsert_id() {
		return insert_id;
	}
	public void setInsert_id(String insert_id) {
		this.insert_id = insert_id;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public Integer getIdx_no() {
		return idx_no;
	}
	public void setIdx_no(Integer idx_no) {
		this.idx_no = idx_no;
	}
	public Integer getSeq_re() {
		return seq_re;
	}
	public void setSeq_re(Integer seq_re) {
		this.seq_re = seq_re;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public Integer getGap() {
		return gap;
	}
	public void setGap(Integer gap) {
		this.gap = gap;
	}
	
}
