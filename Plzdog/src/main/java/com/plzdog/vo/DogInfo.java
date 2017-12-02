package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class DogInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int dogId;
	private String codeDog;
	
	private Code code;
	public DogInfo() {}

	public DogInfo(int dogId, String codeDog) {
		super();
		this.dogId = dogId;
		this.codeDog = codeDog;
	}

	public DogInfo(int dogId, String codeDog, Code code) {
		super();
		this.dogId = dogId;
		this.codeDog = codeDog;
		this.code = code;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public String getCodeDog() {
		return codeDog;
	}

	public void setCodeDog(String codeDog) {
		this.codeDog = codeDog;
	}

	public Code getCode() {
		return code;
	}

	public void setCode(Code code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "DogInfo [dogId=" + dogId + ", codeDog=" + codeDog + ", code=" + code + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((codeDog == null) ? 0 : codeDog.hashCode());
		result = prime * result + dogId;
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
		DogInfo other = (DogInfo) obj;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (codeDog == null) {
			if (other.codeDog != null)
				return false;
		} else if (!codeDog.equals(other.codeDog))
			return false;
		if (dogId != other.dogId)
			return false;
		return true;
	}
}
