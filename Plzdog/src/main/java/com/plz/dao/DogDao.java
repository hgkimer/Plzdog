package com.plz.dao;

import java.util.List;

import com.plzdog.vo.Dog;

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
	
	
}
