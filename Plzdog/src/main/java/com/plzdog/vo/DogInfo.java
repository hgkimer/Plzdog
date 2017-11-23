package com.plzdog.vo;

import java.io.Serializable;

public class DogInfo implements Serializable {

	private int dogId;
	private String code;
	
	public DogInfo() {}

	public DogInfo(int dogId, String code) {
		this.dogId = dogId;
		this.code = code;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
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
		if (dogId != other.dogId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DogInfo [dogId=" + dogId + ", code=" + code + "]";
	}
}
