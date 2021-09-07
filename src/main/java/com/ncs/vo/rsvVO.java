package com.ncs.vo;

public class rsvVO {
	
	private int bk_code;
	private String rm_name;
	private String bk_date;
	private String bk_days;
	private int bk_adult;
	private int bk_child;
	private int bk_infant;
	private String bk_option;
	private int bk_total;
	private int rm_num;
	private String bk_name;
	private String email;
	private String bk_phone;
	private String em_phone;
	private int room_prce;
	private int pers_prce;
	
	public int getBk_code() {
		return bk_code;
	}
	public void setBk_code(int bk_code) {
		this.bk_code = bk_code;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getBk_date() {
		return bk_date;
	}
	public void setBk_date(String bk_date) {
		this.bk_date = bk_date;
	}
	public String getBk_days() {
		return bk_days;
	}
	public void setBk_days(String bk_days) {
		this.bk_days = bk_days;
	}
	public int getBk_adult() {
		return bk_adult;
	}
	public void setBk_adult(int bk_adult) {
		this.bk_adult = bk_adult;
	}
	public int getBk_child() {
		return bk_child;
	}
	public void setBk_child(int bk_child) {
		this.bk_child = bk_child;
	}
	public int getBk_infant() {
		return bk_infant;
	}
	public void setBk_infant(int bk_infant) {
		this.bk_infant = bk_infant;
	}
	public String getBk_option() {
		return bk_option;
	}
	public void setBk_option(String bk_option) {
		this.bk_option = bk_option;
	}
	public int getBk_total() {
		return bk_total;
	}
	public void setBk_total(int bk_total) {
		this.bk_total = bk_total;
	}
	public int getRm_num() {
		return rm_num;
	}
	public void setRm_num(int rm_num) {
		this.rm_num = rm_num;
	}
	public String getBk_name() {
		return bk_name;
	}
	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBk_phone() {
		return bk_phone;
	}
	public void setBk_phone(String bk_phone) {
		this.bk_phone = bk_phone;
	}
	public String getEm_phone() {
		return em_phone;
	}
	public void setEm_phone(String em_phone) {
		this.em_phone = em_phone;
	}
	public int getRoom_prce() {
		return room_prce;
	}
	public void setRoom_prce(int room_prce) {
		this.room_prce = room_prce;
	}
	public int getPers_prce() {
		return pers_prce;
	}
	public void setPers_prce(int pers_prce) {
		this.pers_prce = pers_prce;
	}
	
	@Override
	public String toString() {
		return "rsvVO [bk_code=" + bk_code + ", rm_name=" + rm_name + ", bk_date=" + bk_date + ", bk_days=" + bk_days
				+ ", bk_adult=" + bk_adult + ", bk_child=" + bk_child + ", bk_infant=" + bk_infant + ", bk_option="
				+ bk_option + ", bk_total=" + bk_total + ", rm_num=" + rm_num + ", bk_name=" + bk_name + ", email="
				+ email + ", bk_phone=" + bk_phone + ", em_phone=" + em_phone + ", room_prce=" + room_prce
				+ ", pers_prce=" + pers_prce + "]";
	}
	
}