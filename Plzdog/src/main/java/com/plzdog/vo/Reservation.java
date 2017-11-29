package com.plzdog.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Reservation implements Serializable {

	private static final long serialVersionUID = 1L;
	private int resId;
	private int resType;
	private Date resSDate;
	private Date resEDate;
	private String resContents;
	private String memberEmail;
	private String sitterEmail;
	
	private ArrayList<Care> careList;
	private List<Demand> demandList;
	private Sales sales;
	
	public Reservation() {}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail) {
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, List<Demand> demandList) {
		super();
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.demandList = demandList;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, ArrayList<Care> careList) {
		super();
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.careList = careList;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, Sales sales) {
		super();
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.sales = sales;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, List<Demand> demandList, Sales sales) {
		super();
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.demandList = demandList;
		this.sales = sales;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, ArrayList<Care> careList, List<Demand> demandList, Sales sales) {
		super();
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.careList = careList;
		this.demandList = demandList;
		this.sales = sales;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public int getResType() {
		return resType;
	}

	public void setResType(int resType) {
		this.resType = resType;
	}

	public Date getResSDate() {
		return resSDate;
	}

	public void setResSDate(Date resSDate) {
		this.resSDate = resSDate;
	}

	public Date getResEdate() {
		return resEDate;
	}

	public void setResEdate(Date resEdate) {
		this.resEDate = resEdate;
	}

	public String getResContents() {
		return resContents;
	}

	public void setResContents(String resContents) {
		this.resContents = resContents;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getSitterEmail() {
		return sitterEmail;
	}

	public void setSitterEmail(String sitterEmail) {
		this.sitterEmail = sitterEmail;
	}

	public ArrayList<Care> getCareList() {
		return careList;
	}

	public void setCareList(ArrayList<Care> careList) {
		this.careList = careList;
	}

	public List<Demand> getDemandList() {
		return demandList;
	}

	public void setDemandList(List<Demand> demandList) {
		this.demandList = demandList;
	}

	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}

	@Override
	public String toString() {
		return "Reservation [resId=" + resId + ", resType=" + resType + ", resSDate=" + resSDate + ", resEdate="
				+ resEDate + ", resContents=" + resContents + ", memberEmail=" + memberEmail + ", sitterEmail="
				+ sitterEmail + ", careList=" + careList + ", demandList=" + demandList + ", sales=" + sales + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((careList == null) ? 0 : careList.hashCode());
		result = prime * result + ((demandList == null) ? 0 : demandList.hashCode());
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		result = prime * result + ((resContents == null) ? 0 : resContents.hashCode());
		result = prime * result + ((resEDate == null) ? 0 : resEDate.hashCode());
		result = prime * result + resId;
		result = prime * result + ((resSDate == null) ? 0 : resSDate.hashCode());
		result = prime * result + resType;
		result = prime * result + ((sales == null) ? 0 : sales.hashCode());
		result = prime * result + ((sitterEmail == null) ? 0 : sitterEmail.hashCode());
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
		Reservation other = (Reservation) obj;
		if (careList == null) {
			if (other.careList != null)
				return false;
		} else if (!careList.equals(other.careList))
			return false;
		if (demandList == null) {
			if (other.demandList != null)
				return false;
		} else if (!demandList.equals(other.demandList))
			return false;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		if (resContents == null) {
			if (other.resContents != null)
				return false;
		} else if (!resContents.equals(other.resContents))
			return false;
		if (resEDate == null) {
			if (other.resEDate != null)
				return false;
		} else if (!resEDate.equals(other.resEDate))
			return false;
		if (resId != other.resId)
			return false;
		if (resSDate == null) {
			if (other.resSDate != null)
				return false;
		} else if (!resSDate.equals(other.resSDate))
			return false;
		if (resType != other.resType)
			return false;
		if (sales == null) {
			if (other.sales != null)
				return false;
		} else if (!sales.equals(other.sales))
			return false;
		if (sitterEmail == null) {
			if (other.sitterEmail != null)
				return false;
		} else if (!sitterEmail.equals(other.sitterEmail))
			return false;
		return true;
	}
}
