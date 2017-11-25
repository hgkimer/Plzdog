package com.plzdog.vo;

import java.io.Serializable;
import java.util.List;

public class Sitter implements Serializable {

	private String email;
	private String school;
	private String certification;
	private String serviceAddress;
	private double sitterRate;
	
	private List<Skill> skillList;
	
	public Sitter() {}

	

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate) {
		super();
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
	}
	
	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			List<Skill> skillList) {
		super();
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.skillList = skillList;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getSchool() {
		return school;
	}



	public void setSchool(String school) {
		this.school = school;
	}



	public String getCertification() {
		return certification;
	}



	public void setCertification(String certification) {
		this.certification = certification;
	}



	public String getServiceAddress() {
		return serviceAddress;
	}



	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress;
	}



	public double getSitterRate() {
		return sitterRate;
	}



	public void setSitterRate(double sitterRate) {
		this.sitterRate = sitterRate;
	}



	public List<Skill> getSkillList() {
		return skillList;
	}



	public void setSkillList(List<Skill> skillList) {
		this.skillList = skillList;
	}



	@Override
	public String toString() {
		return "Sitter [email=" + email + ", school=" + school + ", certification=" + certification
				+ ", serviceAddress=" + serviceAddress + ", sitterRate=" + sitterRate + ", skillList=" + skillList
				+ "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((certification == null) ? 0 : certification.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((school == null) ? 0 : school.hashCode());
		result = prime * result + ((serviceAddress == null) ? 0 : serviceAddress.hashCode());
		long temp;
		temp = Double.doubleToLongBits(sitterRate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((skillList == null) ? 0 : skillList.hashCode());
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
		Sitter other = (Sitter) obj;
		if (certification == null) {
			if (other.certification != null)
				return false;
		} else if (!certification.equals(other.certification))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (school == null) {
			if (other.school != null)
				return false;
		} else if (!school.equals(other.school))
			return false;
		if (serviceAddress == null) {
			if (other.serviceAddress != null)
				return false;
		} else if (!serviceAddress.equals(other.serviceAddress))
			return false;
		if (Double.doubleToLongBits(sitterRate) != Double.doubleToLongBits(other.sitterRate))
			return false;
		if (skillList == null) {
			if (other.skillList != null)
				return false;
		} else if (!skillList.equals(other.skillList))
			return false;
		return true;
	}
}