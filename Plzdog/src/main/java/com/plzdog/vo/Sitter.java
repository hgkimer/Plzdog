package com.plzdog.vo;

import java.io.Serializable;

public class Sitter implements Serializable {

	private String email;
	private String school;
	private String certification;
	private String serviceAddress;
	private double sitterRate;
	
	private Reservation reservation;
	private Skill skill;
	private Review review;
	
	public Sitter() {}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Skill skill) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.skill = skill;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Reservation reservation) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.reservation = reservation;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Review review) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.review = review;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Reservation reservation, Skill skill) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.reservation = reservation;
		this.skill = skill;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Reservation reservation, Review review) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.reservation = reservation;
		this.review = review;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Skill skill, Review review) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.skill = skill;
		this.review = review;
	}

	public Sitter(String email, String school, String certification, String serviceAddress, double sitterRate,
			Reservation reservation, Skill skill, Review review) {
		this.email = email;
		this.school = school;
		this.certification = certification;
		this.serviceAddress = serviceAddress;
		this.sitterRate = sitterRate;
		this.reservation = reservation;
		this.skill = skill;
		this.review = review;
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

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((certification == null) ? 0 : certification.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((reservation == null) ? 0 : reservation.hashCode());
		result = prime * result + ((review == null) ? 0 : review.hashCode());
		result = prime * result + ((school == null) ? 0 : school.hashCode());
		result = prime * result + ((serviceAddress == null) ? 0 : serviceAddress.hashCode());
		long temp;
		temp = Double.doubleToLongBits(sitterRate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((skill == null) ? 0 : skill.hashCode());
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
		if (reservation == null) {
			if (other.reservation != null)
				return false;
		} else if (!reservation.equals(other.reservation))
			return false;
		if (review == null) {
			if (other.review != null)
				return false;
		} else if (!review.equals(other.review))
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
		if (skill == null) {
			if (other.skill != null)
				return false;
		} else if (!skill.equals(other.skill))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Sitter [email=" + email + ", school=" + school + ", certification=" + certification
				+ ", serviceAddress=" + serviceAddress + ", sitterRate=" + sitterRate + ", reservation=" + reservation
				+ ", skill=" + skill + ", review=" + review + "]";
	}
}
