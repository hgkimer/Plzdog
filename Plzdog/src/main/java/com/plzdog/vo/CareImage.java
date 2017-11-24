package com.plzdog.vo;

import java.io.Serializable;

public class CareImage implements Serializable{

	private String careImage;
	private int careId;
	
	public CareImage() {}

	public CareImage(String careImage, int careId) {
		this.careImage = careImage;
		this.careId = careId;
	}

	public String getCare_image() {
		return careImage;
	}

	public void setCare_image(String careImage) {
		this.careImage = careImage;
	}

	public int getCareId() {
		return careId;
	}

	public void setCareId(int careId) {
		this.careId = careId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + careId;
		result = prime * result + ((careImage == null) ? 0 : careImage.hashCode());
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
		if (careImage == null) {
			if (other.careImage != null)
				return false;
		} else if (!careImage.equals(other.careImage))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CareImage [careImage=" + careImage + ", careId=" + careId + "]";
	}
}
