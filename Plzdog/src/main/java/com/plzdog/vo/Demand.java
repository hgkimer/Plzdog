package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Demand implements Serializable{

	private int resId;
	private List<Code> demandList;
	
	public Demand() {}

	public Demand(int resId, List<Code> codeList) {
		this.resId = resId;
		this.demandList = codeList;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public List<Code> getCodeList() {
		return demandList;
	}

	public void setCodeList(List<Code> codeList) {
		this.demandList = codeList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((demandList == null) ? 0 : demandList.hashCode());
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
		Demand other = (Demand) obj;
		if (demandList == null) {
			if (other.demandList != null)
				return false;
		} else if (!demandList.equals(other.demandList))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Demand [resId=" + resId + ", codeList=" + demandList + "]";
	}
}
