package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Skill implements Serializable {

	private String email;
	private List<Code> skillList;
	
	public Skill() {}

	public Skill(String email, List<Code> skillList) {
		this.email = email;
		this.skillList = skillList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Code> getSkillList() {
		return skillList;
	}

	public void setSkillList(List<Code> skillList) {
		this.skillList = skillList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((skillList == null) ? 0 : skillList.hashCode());
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
		Skill other = (Skill) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (skillList == null) {
			if (other.skillList != null)
				return false;
		} else if (!skillList.equals(other.skillList))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Skill [email=" + email + ", skillList=" + skillList + "]";
	}
}