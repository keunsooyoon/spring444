package com.aglory.notice;

public class Notice {
	private int nid;
	
	private String ntitle, ncontent, ncate, nwriter, ndate;

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNcate() {
		return ncate;
	}

	public void setNcate(String ncate) {
		this.ncate = ncate;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public Notice() {

	}

	public Notice(int nid, String ntitle, String ncontent, String ncate, String nwriter, String ndate) {

		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ncate = ncate;
		this.nwriter = nwriter;
		this.ndate = ndate;
	}
	
	
	

}