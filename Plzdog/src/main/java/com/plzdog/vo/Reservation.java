package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;

public class Reservation implements Serializable {

	private int resId;
	private int resType;
	private Date resSDate;
	private Date resEdate;
	private String resContents;
	private String memberEmail;
	private String sitterEmail;
	
	private Care care;
	private Demand demand;
	private Sales salse;
	
	public Reservation() {}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail) {
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEdate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, Demand demand) {
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEdate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.demand = demand;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, Demand demand, Sales salse) {
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEdate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.demand = demand;
		this.salse = salse;
	}

	public Reservation(int resId, int resType, Date resSDate, Date resEdate, String resContents, String memberEmail,
			String sitterEmail, Care care, Demand demand, Sales salse) {
		this.resId = resId;
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEdate = resEdate;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.care = care;
		this.demand = demand;
		this.salse = salse;
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
		return resEdate;
	}

	public void setResEdate(Date resEdate) {
		this.resEdate = resEdate;
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

	public Care getCare() {
		return care;
	}

	public void setCare(Care care) {
		this.care = care;
	}

	public Demand getDemand() {
		return demand;
	}

	public void setDemand(Demand demand) {
		this.demand = demand;
	}

	public Sales getSalse() {
		return salse;
	}

	public void setSalse(Sales salse) {
		this.salse = salse;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((care == null) ? 0 : care.hashCode());
		result = prime * result + ((demand == null) ? 0 : demand.hashCode());
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		result = prime * result + ((resContents == null) ? 0 : resContents.hashCode());
		result = prime * result + ((resEdate == null) ? 0 : resEdate.hashCode());
		result = prime * result + resId;
		result = prime * result + ((resSDate == null) ? 0 : resSDate.hashCode());
		result = prime * result + resType;
		result = prime * result + ((salse == null) ? 0 : salse.hashCode());
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
		if (care == null) {
			if (other.care != null)
				return false;
		} else if (!care.equals(other.care))
			return false;
		if (demand == null) {
			if (other.demand != null)
				return false;
		} else if (!demand.equals(other.demand))
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
		if (resEdate == null) {
			if (other.resEdate != null)
				return false;
		} else if (!resEdate.equals(other.resEdate))
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
		if (salse == null) {
			if (other.salse != null)
				return false;
		} else if (!salse.equals(other.salse))
			return false;
		if (sitterEmail == null) {
			if (other.sitterEmail != null)
				return false;
		} else if (!sitterEmail.equals(other.sitterEmail))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Reservation [resId=" + resId + ", resType=" + resType + ", resSDate=" + resSDate + ", resEdate="
				+ resEdate + ", resContents=" + resContents + ", memberEmail=" + memberEmail + ", sitterEmail="
				+ sitterEmail + ", care=" + care + ", demand=" + demand + ", salse=" + salse + "]";
	}
}
