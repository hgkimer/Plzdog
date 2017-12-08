package com.plz.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.plzdog.vo.Code;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

public interface DogService {
	
	void updateDog(Dog dog);
	
	void deleteDog(int dogId);
	
	void insertDogImage(DogImage dogImage);
	
	void updateDogImage(DogImage dogImage, String originalImage);
	
	void deleteDogImage(String dogImage);

	List<Code> addDog(Dog dog, List<String> dogCodeList, HttpServletRequest request) throws IllegalStateException, IOException;
	
	/**
	 * 이메일로 강아지 정보 조회
	 * @param email
	 * @return
	 */
	List<Dog> selectDogByEmail(String email);
	
	/**
	 * dogId로 강아지 정보 조회
	 * @param email
	 * @return
	 */
	Dog findDogJoinDogInfoDogImageByDogId(int dogId);
}
