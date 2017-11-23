package com.plzdog.vo;

import java.io.Serializable;

public class Code implements Serializable{

	private Dog dog;
	private Skill skill;
	private Demand demand;
	
	private String codeName;
	private String category;
	
	public Code() {
	}

	public Code(String codeName, String category) {
		this.codeName = codeName;
		this.category = category;
	}

	public Code(Dog dog, Skill skill, Demand demand, String codeName, String category) {
		this.dog = dog;
		this.skill = skill;
		this.demand = demand;
		this.codeName = codeName;
		this.category = category;
	}

	
	
}
