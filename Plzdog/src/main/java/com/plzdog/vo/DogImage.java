package com.plzdog.vo;

import java.io.Serializable;

public class DogImage implements Serializable{

	private String dogImage;
	private int dogId;
	
	public DogImage() {}

	public DogImage(String dogImage, int dogId) {
		this.dogImage = dogImage;
		this.dogId = dogId;
	}

	public String getDogImage() {
		return dogImage;
	}

	public void setDogImage(String dogImage) {
		this.dogImage = dogImage;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	@Override
	public String toString() {
		return "DogImage [dogImage=" + dogImage + ", dogId=" + dogId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dogId;
		result = prime * result + ((dogImage == null) ? 0 : dogImage.hashCode());
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
		DogImage other = (DogImage) obj;
		if (dogId != other.dogId)
			return false;
		if (dogImage == null) {
			if (other.dogImage != null)
				return false;
		} else if (!dogImage.equals(other.dogImage))
			return false;
		return true;
	}
	
}
