package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;

public class Sales implements Serializable {

	private static final long serialVersionUID = 1L;
	private int resId;
	private int total;
	private int pay;
	private int commission;
	private Date salesDate;
	
	public Sales() {}

	public Sales(int resId, int total, int pay, int commission, Date salesDate) {
		this.resId = resId;
		this.total = total;
		this.pay = pay;
		this.commission = commission;
		this.salesDate = salesDate;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getCommission() {
		return commission;
	}

	public void setCommission(int commission) {
		this.commission = commission;
	}

	public Date getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + commission;
		result = prime * result + pay;
		result = prime * result + resId;
		result = prime * result + ((salesDate == null) ? 0 : salesDate.hashCode());
		result = prime * result + total;
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
		Sales other = (Sales) obj;
		if (commission != other.commission)
			return false;
		if (pay != other.pay)
			return false;
		if (resId != other.resId)
			return false;
		if (salesDate == null) {
			if (other.salesDate != null)
				return false;
		} else if (!salesDate.equals(other.salesDate))
			return false;
		if (total != other.total)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Sales [resId=" + resId + ", total=" + total + ", pay=" + pay + ", commission=" + commission
				+ ", salesDate=" + salesDate + "]";
	}
}
