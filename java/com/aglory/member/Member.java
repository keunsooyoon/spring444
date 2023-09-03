package com.aglory.member;

public class Member {
	
	private int mid, enabled;
	
	private String username, password, authority, mname, memail, mtel, mdate;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public Member(int mid, int enabled, String username, String password, String authority, String mname, String memail,
			String mtel, String mdate) {

		this.mid = mid;
		this.enabled = enabled;
		this.username = username;
		this.password = password;
		this.authority = authority;
		this.mname = mname;
		this.memail = memail;
		this.mtel = mtel;
		this.mdate = mdate;
	}

	public Member() {

	}


	
	
	
	

}
