package com.plz.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.plzdog.vo.Code;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

public interface DogService {
	
	List<Dog> selectDogByEmail(String email);
	
	void updateDog(Dog dog);
	
	void deleteDog(int dogId);
	
	void insertDogImage(DogImage dogImage);
	
	void updateDogImage(DogImage dogImage, String originalImage);
	
	void deleteDogImage(String dogImage);

	void addDog(Dog dog, Code code, HttpServletRequest request) throws IllegalStateException, IOException;
}
