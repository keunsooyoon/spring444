package com.carshop.board;

public class BoardDTO {
	
	private String btitle, bcontent, bauthor, bdate;

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

	public String getBauthor() {
		return bauthor;
	}

	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public BoardDTO(String btitle, String bcontent, String bauthor, String bdate) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bauthor = bauthor;
		this.bdate = bdate;
	}
	
	

}
