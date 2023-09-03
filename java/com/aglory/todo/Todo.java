package com.aglory.todo;

public class Todo {
	
	private int tid;
	
	private String todo, tdue, tdate;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getTdue() {
		return tdue;
	}

	public void setTdue(String tdue) {
		this.tdue = tdue;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public Todo(int tid, String todo, String tdue, String tdate) {

		this.tid = tid;
		this.todo = todo;
		this.tdue = tdue;
		this.tdate = tdate;
	}

	public Todo() {

	}
	
	
	

}
