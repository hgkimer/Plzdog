package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Care implements Serializable{

	private int careId;
	private String careContents;
	private int resId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date careDate;
	
	private List<CareImage> careImageList;

	public Care() {}

	public Care(int careId, String careContents, int resId, Date careDate) {
		this.careId = careId;
		this.careContents = careContents;
		this.resId = resId;
		this.careDate = careDate;
	}

	public Care(int careId, String careContents, int resId, Date careDate, List<CareImage> careImageList) {
		this.careId = careId;
		this.careContents = careContents;
		this.resId = resId;
		this.careDate = careDate;
		this.careImageList = careImageList;
	}

	public int getCareId() {
		return careId;
	}

	public void setCareId(int careId) {
		this.careId = careId;
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

	public List<CareImage> getCareImageList() {
		return careImageList;
	}

	public void setCareImageList(List<CareImage> careImageList) {
		this.careImageList = careImageList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((careContents == null) ? 0 : careContents.hashCode());
		result = prime * result + ((careDate == null) ? 0 : careDate.hashCode());
		result = prime * result + careId;
		result = prime * result + ((careImageList == null) ? 0 : careImageList.hashCode());
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
		if (careId != other.careId)
			return false;
		if (careImageList == null) {
			if (other.careImageList != null)
				return false;
		} else if (!careImageList.equals(other.careImageList))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Care [careId=" + careId + ", careContents=" + careContents + ", resId=" + resId + ", careDate="
				+ careDate + ", careImageList=" + careImageList + "]";
	}
}