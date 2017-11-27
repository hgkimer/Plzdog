package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class DogInfo implements Serializable {

	private int dogId;
	private String codeDog;
	
	public DogInfo() {}

	public DogInfo(int dogId, String codeDog) {
		this.dogId = dogId;
		this.codeDog = codeDog;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		if (codeDog == null) {
			if (other.codeDog != null)
				return false;
		} else if (!codeDog.equals(other.codeDog))
			return false;
		if (dogId != other.dogId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DogInfo [dogId=" + dogId + ", codeDog=" + codeDog + "]";
	}
}
