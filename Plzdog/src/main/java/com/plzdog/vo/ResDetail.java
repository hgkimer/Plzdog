package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class ResDetail implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int resId; //해당 예약의 ID
	private int dogId; //해당 예약의 강아지
	
	private List<Dog> dogList;
	
	public ResDetail() {}
	public ResDetail(int resId, int dogId) {
		super();
		this.resId = resId;
		this.dogId = dogId;
	}
	
	
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public int getDogId() {
		return dogId;
	}
	public void setDogId(int dogId) {
		this.dogId = dogId;
	}
	public List<Dog> getDogList() {
		return dogList;
	}
	public void setDogList(List<Dog> dogList) {
		this.dogList = dogList;
	}
	@Override
	public String toString() {
		return "ResDetail [resId=" + resId + ", dogId=" + dogId + ", dogList=" + dogList + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dogId;
		result = prime * result + ((dogList == null) ? 0 : dogList.hashCode());
		result = prime * result + resId;
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
		ResDetail other = (ResDetail) obj;
		if (dogId != other.dogId)
			return false;
		if (dogList == null) {
			if (other.dogList != null)
				return false;
		} else if (!dogList.equals(other.dogList))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}
}
