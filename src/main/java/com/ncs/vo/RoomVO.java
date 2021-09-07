package com.ncs.vo;

public class RoomVO {

	private int rm_num;
	private String rm_image;
	private String rm_name;
	private int rm_nprice;
	private int rm_price;
	private int rm_min_prs;
	private int rm_max_prs;
	private String rm_size;
	private String rm_pyeong;
	private String rm_strt;
	private String rm_inst;
	private String rm_intro;
	
	public int getRm_num() {
		return rm_num;
	}
	public void setRm_num(int rm_num) {
		this.rm_num = rm_num;
	}
	public String getRm_image() {
		return rm_image;
	}
	public void setRm_image(String rm_image) {
		this.rm_image = rm_image;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public int getRm_nprice() {
		return rm_nprice;
	}
	public void setRm_nprice(int rm_nprice) {
		this.rm_nprice = rm_nprice;
	}
	public int getRm_price() {
		return rm_price;
	}
	public void setRm_price(int rm_price) {
		this.rm_price = rm_price;
	}
	public int getRm_min_prs() {
		return rm_min_prs;
	}
	public void setRm_min_prs(int rm_min_prs) {
		this.rm_min_prs = rm_min_prs;
	}
	public int getRm_max_prs() {
		return rm_max_prs;
	}
	public void setRm_max_prs(int rm_max_prs) {
		this.rm_max_prs = rm_max_prs;
	}
	public String getRm_size() {
		return rm_size;
	}
	public void setRm_size(String rm_size) {
		this.rm_size = rm_size;
	}
	public String getRm_pyeong() {
		return rm_pyeong;
	}
	public void setRm_pyeong(String rm_pyeong) {
		this.rm_pyeong = rm_pyeong;
	}
	public String getRm_strt() {
		return rm_strt;
	}
	public void setRm_strt(String rm_strt) {
		this.rm_strt = rm_strt;
	}
	public String getRm_inst() {
		return rm_inst;
	}
	public void setRm_inst(String rm_inst) {
		this.rm_inst = rm_inst;
	}
	public String getRm_intro() {
		return rm_intro;
	}
	public void setRm_intro(String rm_intro) {
		this.rm_intro = rm_intro;
	}
	
	@Override
	public String toString() {
		return "RoomVO [rm_num=" + rm_num + ", rm_image=" + rm_image + ", rm_name=" + rm_name + ", rm_nprice="
				+ rm_nprice + ", rm_price=" + rm_price + ", rm_min_prs=" + rm_min_prs + ", rm_max_prs=" + rm_max_prs
				+ ", rm_size=" + rm_size + ", rm_pyeong=" + rm_pyeong + ", rm_strt=" + rm_strt + ", rm_inst=" + rm_inst
				+ ", rm_intro=" + rm_intro + "]";
	}
	
}