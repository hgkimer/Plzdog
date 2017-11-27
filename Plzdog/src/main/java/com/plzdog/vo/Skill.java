package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Skill implements Serializable {

	private String email;
	private Code codeSkill;
	
	public Skill() {}

	public Skill(String email, Code codeSkill) {
		this.email = email;
		this.codeSkill = codeSkill;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Code getCodeSkill() {
		return codeSkill;
	}

	public void setCodeSkill(Code codeSkill) {
		this.codeSkill = codeSkill;
	}

	@Override
	public String toString() {
		return "Skill [email=" + email + ", codeSkill=" + codeSkill + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codeSkill == null) ? 0 : codeSkill.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
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
		if (codeSkill == null) {
			if (other.codeSkill != null)
				return false;
		} else if (!codeSkill.equals(other.codeSkill))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		return true;
	}
	

	
}