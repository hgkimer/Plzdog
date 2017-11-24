package com.plzdog.vo;

import java.io.Serializable;

public class CareImage implements Serializable{

	private String care_image;
	private int careId;
	
	public CareImage() {}

	public CareImage(String care_image, int careId) {
		this.care_image = care_image;
		this.careId = careId;
	}

	public String getCare_image() {
		return care_image;
	}

	public void setCare_image(String care_image) {
		this.care_image = care_image;
	}

	public int getCareId() {
		return careId;
	}

	public void setCareId(int careId) {
		this.careId = careId;
	}

	@Override
	public String toString() {
		return "CareImage [care_image=" + care_image + ", careId=" + careId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + careId;
		result = prime * result + ((care_image == null) ? 0 : care_image.hashCode());
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
		CareImage other = (CareImage) obj;
		if (careId != other.careId)
			return false;
		if (care_image == null) {
			if (other.care_image != null)
				return false;
		} else if (!care_image.equals(other.care_image))
			return false;
		return true;
	}
	
}
