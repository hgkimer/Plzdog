package com.plzdog.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class CareImage implements Serializable{

	private MultipartFile imageCare;
	private String imageName;
	private int careId;
	
	public CareImage() {}

	public CareImage(MultipartFile imageCare, int careId) {
		this.imageCare = imageCare;
		this.careId = careId;
	}

	public CareImage(MultipartFile imageCare, String imageName, int careId) {
		this.imageCare = imageCare;
		this.imageName = imageName;
		this.careId = careId;
	}

	public MultipartFile getImageCare() {
		return imageCare;
	}

	public void setImageCare(MultipartFile imageCare) {
		this.imageCare = imageCare;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
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
		result = prime * result + ((imageName == null) ? 0 : imageName.hashCode());
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
		if (imageName == null) {
			if (other.imageName != null)
				return false;
		} else if (!imageName.equals(other.imageName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CareImage [imageName=" + imageName + ", careId=" + careId + "]";
	}
}
