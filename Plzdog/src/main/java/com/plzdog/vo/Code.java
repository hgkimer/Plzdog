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

	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	public Demand getDemand() {
		return demand;
	}

	public void setDemand(Demand demand) {
		this.demand = demand;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((codeName == null) ? 0 : codeName.hashCode());
		result = prime * result + ((demand == null) ? 0 : demand.hashCode());
		result = prime * result + ((dog == null) ? 0 : dog.hashCode());
		result = prime * result + ((skill == null) ? 0 : skill.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Code other = (Code) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (codeName == null) {
			if (other.codeName != null)
				return false;
		} else if (!codeName.equals(other.codeName))
			return false;
		if (demand == null) {
			if (other.demand != null)
				return false;
		} else if (!demand.equals(other.demand))
			return false;
		if (dog == null) {
			if (other.dog != null)
				return false;
		} else if (!dog.equals(other.dog))
			return false;
		if (skill == null) {
			if (other.skill != null)
				return false;
		} else if (!skill.equals(other.skill))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Code [dog=" + dog + ", skill=" + skill + ", demand=" + demand + ", codeName=" + codeName + ", category="
				+ category + "]";
	}
}
