package com.plzdog.vo;

import java.io.Serializable;

public class ResDetail implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int resId; //해당 예약의 ID
	private int dogId; //해당 예약의 강아지
	
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dogId;
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
		if (resId != other.resId)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ResDetail [resId=" + resId + ", dogId=" + dogId + "]";
	}
	
	
	
	

}
