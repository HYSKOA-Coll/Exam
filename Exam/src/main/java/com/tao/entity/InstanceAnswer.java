package com.tao.entity;

public class InstanceAnswer {

	private int answer_id;
	private String answer_student;
	private int answer_score;
	private int answer_prompt;
	private int packet_id;
	private int info_id;
	private String token;
	private int clazz_id;
	private int question_id;
	
	private String packet_name;
	private String info_name;
	
	
	public InstanceAnswer() {
		super();
	}


	public InstanceAnswer(int answer_id, String answer_student, int answer_score, int answer_prompt, int packet_id,
			int info_id, String token, int clazz_id, int question_id, String packet_name, String info_name) {
		super();
		this.answer_id = answer_id;
		this.answer_student = answer_student;
		this.answer_score = answer_score;
		this.answer_prompt = answer_prompt;
		this.packet_id = packet_id;
		this.info_id = info_id;
		this.token = token;
		this.clazz_id = clazz_id;
		this.question_id = question_id;
		this.packet_name = packet_name;
		this.info_name = info_name;
	}


	@Override
	public String toString() {
		return "InstanceAnswer [answer_id=" + answer_id + ", answer_student=" + answer_student + ", answer_score="
				+ answer_score + ", answer_prompt=" + answer_prompt + ", packet_id=" + packet_id + ", info_id="
				+ info_id + ", token=" + token + ", clazz_id=" + clazz_id + ", question_id=" + question_id
				+ ", packet_name=" + packet_name + ", info_name=" + info_name + "]";
	}


	public int getAnswer_id() {
		return answer_id;
	}


	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}


	public String getAnswer_student() {
		return answer_student;
	}


	public void setAnswer_student(String answer_student) {
		this.answer_student = answer_student;
	}


	public int getAnswer_score() {
		return answer_score;
	}


	public void setAnswer_score(int answer_score) {
		this.answer_score = answer_score;
	}


	public int getAnswer_prompt() {
		return answer_prompt;
	}


	public void setAnswer_prompt(int answer_prompt) {
		this.answer_prompt = answer_prompt;
	}


	public int getPacket_id() {
		return packet_id;
	}


	public void setPacket_id(int packet_id) {
		this.packet_id = packet_id;
	}


	public int getInfo_id() {
		return info_id;
	}


	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}


	public String getToken() {
		return token;
	}


	public void setToken(String token) {
		this.token = token;
	}


	public int getClazz_id() {
		return clazz_id;
	}


	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}


	public int getQuestion_id() {
		return question_id;
	}


	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}


	public String getPacket_name() {
		return packet_name;
	}


	public void setPacket_name(String packet_name) {
		this.packet_name = packet_name;
	}


	public String getInfo_name() {
		return info_name;
	}


	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	
}
