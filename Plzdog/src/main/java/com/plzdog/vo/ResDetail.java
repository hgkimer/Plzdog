package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class ResDetail implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int resId; //해당 예약의 ID
	private int dogId; //해당 예약의 강아지
	
	private Dog dog;
	
	public ResDetail() {}
	public ResDetail(int resId, int dogId) {
		super();
		this.resId = resId;
		this.dogId = dogId;
	}
	
	
	public ResDetail(int resId, int dogId, Dog dog) {
		super();
		this.resId = resId;
		this.dogId = dogId;
		this.dog = dog;
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
	public Dog getDog() {
		return dog;
	}
	public void setDog(Dog dog) {
		this.dog = dog;
	}
	@Override
	public String toString() {
		return "ResDetail [resId=" + resId + ", dogId=" + dogId + ", dog=" + dog + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dog == null) ? 0 : dog.hashCode());
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
		if (dog == null) {
			if (other.dog != null)
				return false;
		} else if (!dog.equals(other.dog))
			return false;
		if (dogId != other.dogId)
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}
	
	
}
