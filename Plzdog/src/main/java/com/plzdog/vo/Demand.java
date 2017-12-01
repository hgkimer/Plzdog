package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Demand implements Serializable{

	private static final long serialVersionUID = 1L;
	private int resId;
	private Code codeDemand;
	
	public Demand() {}

	public Demand(int resId, Code codeDemand) {
		this.resId = resId;
		this.codeDemand = codeDemand;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public Code getCodeDemand() {
		return codeDemand;
	}

	public void setCodeDemand(Code codeDemand) {
		this.codeDemand = codeDemand;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codeDemand == null) ? 0 : codeDemand.hashCode());
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
		if (codeDemand == null) {
			if (other.codeDemand != null)
				return false;
		} else if (!codeDemand.equals(other.codeDemand))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Demand [resId=" + resId + ", codeDemand=" + codeDemand + "]";
	}
	
	
}
