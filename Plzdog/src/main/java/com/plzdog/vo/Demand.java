package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Demand implements Serializable{

	private static final long serialVersionUID = 1L;
	private int resId;
	private Code code;
	
	public Demand() {}
	
	public Demand(int resId, Code code) {
		this.resId = resId;
		this.code = code;
	}


	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public Code getCode() {
		return code;
	}

	public void setCode(Code code) {
		this.code = code;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
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
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Demand [resId=" + resId + ", code=" + code + "]";
	}
}
