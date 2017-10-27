package com.tao.entity;

public class Percent {

	private int question_id;
	private int c1;
	private int c2;
	
	public Percent() {
		super();
	}

	public Percent(int question_id, int c1, int c2) {
		super();
		this.question_id = question_id;
		this.c1 = c1;
		this.c2 = c2;
	}

	@Override
	public String toString() {
		return "Percent [question_id=" + question_id + ", c1=" + c1 + ", c2=" + c2 + "]";
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int getC1() {
		return c1;
	}

	public void setC1(int c1) {
		this.c1 = c1;
	}

	public int getC2() {
		return c2;
	}

	public void setC2(int c2) {
		this.c2 = c2;
	}

}
