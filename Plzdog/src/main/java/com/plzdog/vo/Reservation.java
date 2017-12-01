package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Reservation implements Serializable {

	private static final long serialVersionUID = 1L;
	private int resId;
	//★★★★★예약 상태(1 : 예약 대기 / 2 : 예약 확정 / 3: 결제 완료
	private int resType; 
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date resSDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date resEDate;
	private int price;
	private String resContents;
	private String memberEmail;
	private String sitterEmail;
	
	private List<Care> careList;
	private List<Demand> demandList;
	private Sales sales;
	private Dog dog;
	private Member member;
	
	public Reservation() {}
	
	//예약 ID는 시퀀스이므로 객체를 만들때는 Emai로 조회해서 쓴다.
	public Reservation(int resType, Date resSDate, Date resEDate, int price, String resContents, String memberEmail,
			String sitterEmail) {
		super();
		this.resType = resType;
		this.resSDate = resSDate;
		this.resEDate = resEDate;
		this.price = price;
		this.resContents = resContents;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public Date getResEDate() {
		return resEDate;
	}

	public void setResEDate(Date resEDate) {
		this.resEDate = resEDate;
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


	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}
	
	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<Care> getCareList() {
		return careList;
	}

	public void setCareList(List<Care> careList) {
		this.careList = careList;
	}

	public List<Demand> getDemandList() {
		return demandList;
	}

	public void setDemandList(List<Demand> demandList) {
		this.demandList = demandList;
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Reservation [resId=" + resId + ", resType=" + resType + ", resSDate=" + resSDate + ", resEDate="
				+ resEDate + ", price=" + price + ", resContents=" + resContents + ", memberEmail=" + memberEmail
				+ ", sitterEmail=" + sitterEmail + ", careList=" + careList + ", demandList=" + demandList + ", sales="
				+ sales + ", dog=" + dog + ", member=" + member + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((careList == null) ? 0 : careList.hashCode());
		result = prime * result + ((demandList == null) ? 0 : demandList.hashCode());
		result = prime * result + ((dog == null) ? 0 : dog.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		result = prime * result + price;
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
		if (dog == null) {
			if (other.dog != null)
				return false;
		} else if (!dog.equals(other.dog))
			return false;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		if (price != other.price)
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