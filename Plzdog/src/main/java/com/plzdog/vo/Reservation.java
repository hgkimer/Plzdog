package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Reservation implements Serializable {

	private static final long serialVersionUID = 1L;
	private int resId;
	@DateTimeFormat(iso=ISO.DATE, pattern="yyyy-MM-dd")
	private Date resSDate;
	@DateTimeFormat(iso=ISO.DATE, pattern="yyyy-MM-dd")
	private Date resEDate;
	private int price;
	private String resContents;
	//★★★★★예약 상태 ddl.sql 참조
	private String resStatus; 
	private String memberEmail;
	private String sitterEmail;
	
	private List<ResDetail> resDetailList;
	private List<Care> careList;
	private List<Demand> demandList;
	private Sales sales;
	//예약을 신청한 회원의 정보를 담을 Member객체 변수
	private Member member;
	//예약을 담당하는 시터의 정보를 담을 Member객체 변수
	private Member sitter;
	private Dog dog;
	private List<Dog> resDogList;
	
	public Reservation() {}
	
	public Reservation(int resId, Date resSDate, Date resEDate, int price, String resContents, String resStatus,
			String memberEmail, String sitterEmail) {
		this.resId = resId;
		this.resSDate = resSDate;
		this.resEDate = resEDate;
		this.price = price;
		this.resContents = resContents;
		this.resStatus = resStatus;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
	}

	public Reservation(int resId, Date resSDate, Date resEDate, int price, String resContents, String resStatus,
			String memberEmail, String sitterEmail, List<ResDetail> resDetailList, List<Care> careList,
			List<Demand> demandList, Sales sales, Member member) {
		this.resId = resId;
		this.resSDate = resSDate;
		this.resEDate = resEDate;
		this.price = price;
		this.resContents = resContents;
		this.resStatus = resStatus;
		this.memberEmail = memberEmail;
		this.sitterEmail = sitterEmail;
		this.resDetailList = resDetailList;
		this.careList = careList;
		this.demandList = demandList;
		this.sales = sales;
		this.member = member;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getResContents() {
		return resContents;
	}

	public void setResContents(String resContents) {
		this.resContents = resContents;
	}

	public String getResStatus() {
		return resStatus;
	}

	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
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

	public List<ResDetail> getResDetailList() {
		return resDetailList;
	}

	public void setResDetailList(List<ResDetail> resDetailList) {
		this.resDetailList = resDetailList;
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

	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Member getSitter() {
		return sitter;
	}

	public void setSitter(Member sitter) {
		this.sitter = sitter;
	}

	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	public List<Dog> getResDogList() {
		return resDogList;
	}

	public void setResDogList(List<Dog> resDogList) {
		this.resDogList = resDogList;
	}

	@Override
	public String toString() {
		return "Reservation [resId=" + resId + ", resSDate=" + resSDate + ", resEDate=" + resEDate + ", price=" + price
				+ ", resContents=" + resContents + ", resStatus=" + resStatus + ", memberEmail=" + memberEmail
				+ ", sitterEmail=" + sitterEmail + ", resDetailList=" + resDetailList + ", careList=" + careList
				+ ", demandList=" + demandList + ", sales=" + sales + ", member=" + member + ", sitter=" + sitter
				+ ", dog=" + dog + ", resDogList=" + resDogList + "]";
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
		result = prime * result + ((resDetailList == null) ? 0 : resDetailList.hashCode());
		result = prime * result + ((resDogList == null) ? 0 : resDogList.hashCode());
		result = prime * result + ((resEDate == null) ? 0 : resEDate.hashCode());
		result = prime * result + resId;
		result = prime * result + ((resSDate == null) ? 0 : resSDate.hashCode());
		result = prime * result + ((resStatus == null) ? 0 : resStatus.hashCode());
		result = prime * result + ((sales == null) ? 0 : sales.hashCode());
		result = prime * result + ((sitter == null) ? 0 : sitter.hashCode());
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
		if (resDetailList == null) {
			if (other.resDetailList != null)
				return false;
		} else if (!resDetailList.equals(other.resDetailList))
			return false;
		if (resDogList == null) {
			if (other.resDogList != null)
				return false;
		} else if (!resDogList.equals(other.resDogList))
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
		if (resStatus == null) {
			if (other.resStatus != null)
				return false;
		} else if (!resStatus.equals(other.resStatus))
			return false;
		if (sales == null) {
			if (other.sales != null)
				return false;
		} else if (!sales.equals(other.sales))
			return false;
		if (sitter == null) {
			if (other.sitter != null)
				return false;
		} else if (!sitter.equals(other.sitter))
			return false;
		if (sitterEmail == null) {
			if (other.sitterEmail != null)
				return false;
		} else if (!sitterEmail.equals(other.sitterEmail))
			return false;
		return true;
	}

	
}