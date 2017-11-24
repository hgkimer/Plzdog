package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Member implements Serializable {

	private String email;
	private String memberName;
	private String password;
	private String mainAddress;
	private String subAddress;
	private String zipcode;
	private String memberImage;
	private String phoneNum;
	private int memberEnable;
	
	private Sitter sitter;					//시터
	private List<Review> reviewList;		//시터
	private List<Reservation> resList;		//견주, 시터
	private List<Dog> dogList;				//견주, 시터
	private Skill skill;					//시터
	
	public Member() {}

	public Member(String email, String memberName, String password, String mainAddress, String subAddress,
			String zipcode, String memberImage, String phoneNum, int memberEnable) {
		this.email = email;
		this.memberName = memberName;
		this.password = password;
		this.mainAddress = mainAddress;
		this.subAddress = subAddress;
		this.zipcode = zipcode;
		this.memberImage = memberImage;
		this.phoneNum = phoneNum;
		this.memberEnable = memberEnable;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getMemberEnable() {
		return memberEnable;
	}

	public void setMemberEnable(int memberEnable) {
		this.memberEnable = memberEnable;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}

	public List<Reservation> getResList() {
		return resList;
	}

	public void setResList(List<Reservation> resList) {
		this.resList = resList;
	}

	public List<Dog> getDogList() {
		return dogList;
	}

	public void setDogList(List<Dog> dogList) {
		this.dogList = dogList;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dogList == null) ? 0 : dogList.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((mainAddress == null) ? 0 : mainAddress.hashCode());
		result = prime * result + memberEnable;
		result = prime * result + ((memberImage == null) ? 0 : memberImage.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((resList == null) ? 0 : resList.hashCode());
		result = prime * result + ((reviewList == null) ? 0 : reviewList.hashCode());
		result = prime * result + ((sitter == null) ? 0 : sitter.hashCode());
		result = prime * result + ((skill == null) ? 0 : skill.hashCode());
		result = prime * result + ((subAddress == null) ? 0 : subAddress.hashCode());
		result = prime * result + ((zipcode == null) ? 0 : zipcode.hashCode());
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
		Member other = (Member) obj;
		if (dogList == null) {
			if (other.dogList != null)
				return false;
		} else if (!dogList.equals(other.dogList))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (mainAddress == null) {
			if (other.mainAddress != null)
				return false;
		} else if (!mainAddress.equals(other.mainAddress))
			return false;
		if (memberEnable != other.memberEnable)
			return false;
		if (memberImage == null) {
			if (other.memberImage != null)
				return false;
		} else if (!memberImage.equals(other.memberImage))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (resList == null) {
			if (other.resList != null)
				return false;
		} else if (!resList.equals(other.resList))
			return false;
		if (reviewList == null) {
			if (other.reviewList != null)
				return false;
		} else if (!reviewList.equals(other.reviewList))
			return false;
		if (sitter == null) {
			if (other.sitter != null)
				return false;
		} else if (!sitter.equals(other.sitter))
			return false;
		if (skill == null) {
			if (other.skill != null)
				return false;
		} else if (!skill.equals(other.skill))
			return false;
		if (subAddress == null) {
			if (other.subAddress != null)
				return false;
		} else if (!subAddress.equals(other.subAddress))
			return false;
		if (zipcode == null) {
			if (other.zipcode != null)
				return false;
		} else if (!zipcode.equals(other.zipcode))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", memberName=" + memberName + ", password=" + password + ", mainAddress="
				+ mainAddress + ", subAddress=" + subAddress + ", zipcode=" + zipcode + ", memberImage=" + memberImage
				+ ", phoneNum=" + phoneNum + ", memberEnable=" + memberEnable + ", sitter=" + sitter + ", reviewList="
				+ reviewList + ", resList=" + resList + ", dogList=" + dogList + ", skill=" + skill + "]";
	}
}