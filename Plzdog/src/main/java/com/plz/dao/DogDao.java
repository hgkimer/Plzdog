package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;
import com.plzdog.vo.DogInfo;

public interface DogDao {
	
	/**
	 * 강아지 정보 등록
	 * @param dog
	 * @return
	 */
	int insertDog(Dog dog);	

	/**
	 * email회원이 등록한 강아지 정보 조회
	 * @param email
	 * @return
	 */
	List<Dog> selectDogByEmail(String email);
	
	/**
	 * 강아지 정보 수정
	 * @param dog
	 * @return
	 */
	int updateDog(Dog dog);
	
	/**
	 * 강아지 정보 삭제
	 * @param dogId
	 * @return
	 */
	int deleteDog(int dogId);
	
	/**
	 * 강아지 이미지 등록
	 * @param dogImage
	 * @return
	 */
	int insertDogImage(DogImage dogImage);
	
	/**
	 * 강아지 이미지 수정
	 * @param dogImage
	 * @param originalImage
	 * @return
	 */
	int updateDogImage(DogImage dogImage, String originalImage);
	
	/**
	 * 강아지 이미지 삭제
	 * @param dogImage
	 * @return
	 */
	int deleteDogImage(String dogImage);
	
	/**
	 * 강아지 정보 추가
	 * @param dogInfo
	 * @return
	 */
	int insertDogInfo(DogInfo dogInfo);
	
	/**
	 * 강아지 정보 수정
	 * @param dogInfo
	 * @return
	 */
	int updateDogInfo(DogInfo dogInfo);
	
	/**
	 * 강아지 정보 삭제
	 * @param dogId
	 * @return
	 */
	int deleteDogInfo(int dogId);
}
