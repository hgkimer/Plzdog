package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;

public class Care implements Serializable{

	private CareImage careImage;
	
	private String careContents;
	private int resId;
	private Date careDate;
	
	public Care() {
	}

	public Care(String careContents, int resId, Date careDate) {
		this.careContents = careContents;
		this.resId = resId;
		this.careDate = careDate;
	}

	public Care(CareImage careImage, String careContents, int resId, Date careDate) {
		this.careImage = careImage;
		this.careContents = careContents;
		this.resId = resId;
		this.careDate = careDate;
	}

	public CareImage getCareImage() {
		return careImage;
	}

	public void setCareImage(CareImage careImage) {
		this.careImage = careImage;
	}

	public String getCareContents() {
		return careContents;
	}

	public void setCareContents(String careContents) {
		this.careContents = careContents;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public Date getCareDate() {
		return careDate;
	}

	public void setCareDate(Date careDate) {
		this.careDate = careDate;
	}

	@Override
	public String toString() {
		return "Care [careImage=" + careImage + ", careContents=" + careContents + ", resId=" + resId + ", careDate="
				+ careDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((careContents == null) ? 0 : careContents.hashCode());
		result = prime * result + ((careDate == null) ? 0 : careDate.hashCode());
		result = prime * result + ((careImage == null) ? 0 : careImage.hashCode());
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
		Care other = (Care) obj;
		if (careContents == null) {
			if (other.careContents != null)
				return false;
		} else if (!careContents.equals(other.careContents))
			return false;
		if (careDate == null) {
			if (other.careDate != null)
				return false;
		} else if (!careDate.equals(other.careDate))
			return false;
		if (careImage == null) {
			if (other.careImage != null)
				return false;
		} else if (!careImage.equals(other.careImage))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}
	
}