package com.plz.service;

import java.util.List;

import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

public interface DogService {

	void insertDog(Dog dog);
	
	List<Dog> selectDogByEmail(String email);
	
	void updateDog(Dog dog);
	
	void deleteDog(int dogId);
	
	void insertDogImage(DogImage dogImage);
	
	void updateDogImage(DogImage dogImage, String originalImage);
	
	void deleteDogImage(String dogImage);
}
