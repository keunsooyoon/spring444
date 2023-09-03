package com.aglory.calendar;

public class Cal {
	
	private String cid, title, start, end, allDay, color, textColor, cauthor, cdate;

	
	
	
	
	

	public Cal(String cid, String title, String start, String end, String allDay, String color, String textColor,
			String cauthor, String cdate) {
		this.cid = cid;
		this.title = title;
		this.start = start;
		this.end = end;
		this.allDay = allDay;
		this.color = color;
		this.textColor = textColor;
		this.cauthor = cauthor;
		this.cdate = cdate;
	}







	public String getCid() {
		return cid;
	}







	public void setCid(String cid) {
		this.cid = cid;
	}







	public String getTitle() {
		return title;
	}







	public void setTitle(String title) {
		this.title = title;
	}







	public String getStart() {
		return start;
	}







	public void setStart(String start) {
		this.start = start;
	}







	public String getEnd() {
		return end;
	}







	public void setEnd(String end) {
		this.end = end;
	}







	public String getAllDay() {
		return allDay;
	}







	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}







	public String getColor() {
		return color;
	}







	public void setColor(String color) {
		this.color = color;
	}







	public String getTextColor() {
		return textColor;
	}







	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}







	public String getCauthor() {
		return cauthor;
	}







	public void setCauthor(String cauthor) {
		this.cauthor = cauthor;
	}







	public String getCdate() {
		return cdate;
	}







	public void setCdate(String cdate) {
		this.cdate = cdate;
	}







	public Cal() {

	}


	
	
}
