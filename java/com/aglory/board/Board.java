package com.aglory.board;

public class Board {
	
	private int bid, bstatus;
	
	private String bpid, btitle, bcontent, bcate, bwriter, bdate;

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getBstatus() {
		return bstatus;
	}

	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}

	public String getBpid() {
		return bpid;
	}

	public void setBpid(String bpid) {
		this.bpid = bpid;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBcate() {
		return bcate;
	}

	public void setBcate(String bcate) {
		this.bcate = bcate;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public Board(int bid, int bstatus, String bpid, String btitle, String bcontent, String bcate, String bwriter,
			String bdate) {
		this.bid = bid;
		this.bstatus = bstatus;
		this.bpid = bpid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bcate = bcate;
		this.bwriter = bwriter;
		this.bdate = bdate;
	}

	public Board() {

	}

	
	
	

}