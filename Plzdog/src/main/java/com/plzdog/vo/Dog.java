package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Dog implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int dogId;
	private String dogName;
	private String species;
	private String gender;
	private double weight;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String email;
	
	//여러개의 이미지 처리
	private List<MultipartFile> dogImageList;
	
	//여러개의 dogImage명 처리
	private List<DogImage> dogImage;
	
	//여러개의 dogInfo 처리
	private List<DogInfo> dogInfoList;
	
	public Dog() {}

	public Dog(int dogId, String dogName, String species, String gender, double weight, Date birth, String email) {
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.email = email;
	}

	public Dog(int dogId, String dogName, String species, String gender, double weight, Date birth, String email,
			List<MultipartFile> dogImageList, List<DogImage> dogImage) {
		super();
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.email = email;
		this.dogImageList = dogImageList;
		this.dogImage = dogImage;
	}
	
	public Dog(int dogId, String dogName, String species, String gender, double weight, Date birth, String email,
			List<MultipartFile> dogImageList) {
		super();
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.email = email;
		this.dogImageList = dogImageList;
	}

	public Dog(int dogId, String dogName, String species, String gender, double weight, Date birth, String email,
			List<MultipartFile> dogImageList, List<DogImage> dogImage, List<DogInfo> dogInfoList) {
		super();
		this.dogId = dogId;
		this.dogName = dogName;
		this.species = species;
		this.gender = gender;
		this.weight = weight;
		this.birth = birth;
		this.email = email;
		this.dogImageList = dogImageList;
		this.dogImage = dogImage;
		this.dogInfoList = dogInfoList;
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

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<MultipartFile> getDogImageList() {
		return dogImageList;
	}

	public void setDogImageList(List<MultipartFile> dogImageList) {
		this.dogImageList = dogImageList;
	}

	public List<DogImage> getDogImage() {
		return dogImage;
	}

	public void setDogImage(List<DogImage> dogImage) {
		this.dogImage = dogImage;
	}

	public List<DogInfo> getDogInfoList() {
		return dogInfoList;
	}

	public void setDogInfoList(List<DogInfo> dogInfoList) {
		this.dogInfoList = dogInfoList;
	}

	@Override
	public String toString() {
		return "Dog [dogId=" + dogId + ", dogName=" + dogName + ", species=" + species + ", gender=" + gender
				+ ", weight=" + weight + ", birth=" + birth + ", email=" + email + ", dogImageList=" + dogImageList
				+ ", dogImage=" + dogImage + ", dogInfoList=" + dogInfoList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + dogId;
		result = prime * result + ((dogImage == null) ? 0 : dogImage.hashCode());
		result = prime * result + ((dogImageList == null) ? 0 : dogImageList.hashCode());
		result = prime * result + ((dogInfoList == null) ? 0 : dogInfoList.hashCode());
		result = prime * result + ((dogName == null) ? 0 : dogName.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((species == null) ? 0 : species.hashCode());
		long temp;
		temp = Double.doubleToLongBits(weight);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		if (dogId != other.dogId)
			return false;
		if (dogImage == null) {
			if (other.dogImage != null)
				return false;
		} else if (!dogImage.equals(other.dogImage))
			return false;
		if (dogImageList == null) {
			if (other.dogImageList != null)
				return false;
		} else if (!dogImageList.equals(other.dogImageList))
			return false;
		if (dogInfoList == null) {
			if (other.dogInfoList != null)
				return false;
		} else if (!dogInfoList.equals(other.dogInfoList))
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
		if (Double.doubleToLongBits(weight) != Double.doubleToLongBits(other.weight))
			return false;
		return true;
	}

}	
