package com.ncs.vo;

public class CalendarVO {
	
	private int bk_code; // 예약 번호
	private String rm_name; // 객실 이름 
	private String bk_date; // 예약 날짜
	private String bk_days; // 기간 
	private int bk_adult; // 성인
	private int bk_child; // 아동
	private int bk_infant; // 유아
	private String bk_option; // 옵션 선택
	private String bk_status; // 예약 상태
	private int bk_total; // 총 금액
	private int rm_num; // 객실번호
	private String bk_name; // 예약자 이름 
	private String email; // 예약자 아이디
	
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
	public String getBk_status() {
		return bk_status;
	}
	public void setBk_status(String bk_status) {
		this.bk_status = bk_status;
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
	
	@Override
	public String toString() {
		return "BookingVO [bk_code=" + bk_code + ", rm_name=" + rm_name + ", bk_date=" + bk_date + ", bk_days="
				+ bk_days + ", bk_adult=" + bk_adult + ", bk_child=" + bk_child + ", bk_infant=" + bk_infant
				+ ", bk_option=" + bk_option + ", bk_status=" + bk_status + ", bk_total=" + bk_total + ", rm_num="
				+ rm_num + ", bk_name=" + bk_name + ", email=" + email + "]";
	}
	
} // class
