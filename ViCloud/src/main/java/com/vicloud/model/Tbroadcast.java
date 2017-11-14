package com.vicloud.model;

import java.util.Date;

public class Tbroadcast {
	private Integer idx;
	private String category;
	private String genre;
	private String title;
	private String grade;
	private String foldername;
	private String albumname;
	private String filename;
	private String file_url;
	private String extension;
	private String sub_url;
	private boolean sub_check;
	private String play_date;
	private Date insert_date;
	private String insert_id;
	private Date modify_date;
	private int hit;
	private int total_count;
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public String getSub_url() {
		return sub_url;
	}
	public void setSub_url(String sub_url) {
		this.sub_url = sub_url;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public String getFoldername() {
		return foldername;
	}
	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}
	public boolean isSub_check() {
		return sub_check;
	}
	public void setSub_check(boolean sub_check) {
		this.sub_check = sub_check;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getPlay_date() {
		return play_date;
	}
	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}
	
}
