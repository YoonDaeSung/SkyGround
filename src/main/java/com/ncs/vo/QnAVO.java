package com.ncs.vo;

public class QnAVO {
	
	private int qt_turn;
	private String qt_title;
	private String qt_contents;
	private String qt_date;
	private String email;
	
	public int getQt_turn() {
		return qt_turn;
	}
	public void setQt_turn(int qt_turn) {
		this.qt_turn = qt_turn;
	}
	public String getQt_title() {
		return qt_title;
	}
	public void setQt_title(String qt_title) {
		this.qt_title = qt_title;
	}
	public String getQt_contents() {
		return qt_contents;
	}
	public void setQt_contents(String qt_contents) {
		this.qt_contents = qt_contents;
	}
	public String getQt_date() {
		return qt_date;
	}
	public void setQt_date(String qt_date) {
		this.qt_date = qt_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "QnAVO [qt_turn=" + qt_turn + ", qt_title=" + qt_title + ", qt_contents=" + qt_contents + ", qt_date="
				+ qt_date + ", email=" + email + "]";
	}

}// class