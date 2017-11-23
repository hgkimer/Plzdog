package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;

public class Dog implements Serializable{
	
	private int dogId;
	private String dogName;
	private String species;
	private String gender;
	private int weight;
	private Date birth;
	private String code;
	private String email;
	
	private DogImage dogImage;
	private DogInfo dogInfo;
	
	public Dog() {}

	public Dog(int dogId, String dogName, String species, String gender, int weight, Date birth, String code,
			String email) {
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.code = code;
		this.email = email;
	}

	public Dog(int dogId, String dogName, String species, String gender, int weight, Date birth, String code,
			String email, DogInfo dogInfo) {
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.code = code;
		this.email = email;
		this.dogInfo = dogInfo;
	}

	public Dog(int dogId, String dogName, String species, String gender, int weight, Date birth, String code,
			String email, DogImage dogImage) {
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.code = code;
		this.email = email;
		this.dogImage = dogImage;
	}

	public Dog(int dogId, String dogName, String species, String gender, int weight, Date birth, String code,
			String email, DogImage dogImage, DogInfo dogInfo) {
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.code = code;
		this.email = email;
		this.dogImage = dogImage;
		this.dogInfo = dogInfo;
	}

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public DogImage getDogImage() {
		return dogImage;
	}

	public void setDogImage(DogImage dogImage) {
		this.dogImage = dogImage;
	}

	public DogInfo getDogInfo() {
		return dogInfo;
	}

	public void setDogInfo(DogInfo dogInfo) {
		this.dogInfo = dogInfo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + dogId;
		result = prime * result + ((dogImage == null) ? 0 : dogImage.hashCode());
		result = prime * result + ((dogInfo == null) ? 0 : dogInfo.hashCode());
		result = prime * result + ((dogName == null) ? 0 : dogName.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((species == null) ? 0 : species.hashCode());
		result = prime * result + weight;
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
		Dog other = (Dog) obj;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (dogId != other.dogId)
			return false;
		if (dogImage == null) {
			if (other.dogImage != null)
				return false;
		} else if (!dogImage.equals(other.dogImage))
			return false;
		if (dogInfo == null) {
			if (other.dogInfo != null)
				return false;
		} else if (!dogInfo.equals(other.dogInfo))
			return false;
		if (dogName == null) {
			if (other.dogName != null)
				return false;
		} else if (!dogName.equals(other.dogName))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (species == null) {
			if (other.species != null)
				return false;
		} else if (!species.equals(other.species))
			return false;
		if (weight != other.weight)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Dog [dogId=" + dogId + ", dogName=" + dogName + ", species=" + species + ", gender=" + gender
				+ ", weight=" + weight + ", birth=" + birth + ", code=" + code + ", email=" + email + ", dogImage="
				+ dogImage + ", dogInfo=" + dogInfo + "]";
	}
}	
