package com.ncs.vo;

public class ReplyVO {
	
	private int re_turn;
	private	String re_contents;
	private String re_date;
	private String email;
	private int qt_turn;
	
	public int getRe_turn() {
		return re_turn;
	}
	public void setRe_turn(int re_turn) {
		this.re_turn = re_turn;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQt_turn() {
		return qt_turn;
	}
	public void setQt_turn(int qt_turn) {
		this.qt_turn = qt_turn;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [re_turn=" + re_turn + ", re_contents=" + re_contents + ", re_date=" + re_date + ", email="
				+ email + ", qt_turn=" + qt_turn + "]";
	}
	
}