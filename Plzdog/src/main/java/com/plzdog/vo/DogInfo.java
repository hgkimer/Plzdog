package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class DogInfo implements Serializable {

	private int dogId;
	private List<Code> dogInfoList;
	
	public DogInfo() {}

	public DogInfo(int dogId, List<Code> dogInfoList) {
		this.dogId = dogId;
		this.dogInfoList = dogInfoList;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public List<Code> getDogInfoList() {
		return dogInfoList;
	}

	public void setDogInfoList(List<Code> dogInfoList) {
		this.dogInfoList = dogInfoList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dogId;
		result = prime * result + ((dogInfoList == null) ? 0 : dogInfoList.hashCode());
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
		if (dogId != other.dogId)
			return false;
		if (dogInfoList == null) {
			if (other.dogInfoList != null)
				return false;
		} else if (!dogInfoList.equals(other.dogInfoList))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DogInfo [dogId=" + dogId + ", dogInfoList=" + dogInfoList + "]";
	}
}
