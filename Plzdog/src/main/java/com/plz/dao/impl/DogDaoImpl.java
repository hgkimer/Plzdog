package com.plz.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.DogDao;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;
import com.plzdog.vo.DogInfo;

@Repository
public class DogDaoImpl implements DogDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.plz.config.mybatis.mapper.dogMapper."+id;
	}
	
	@Override
	public int insertDog(Dog dog) {
		return session.insert(makeSqlId("insertDog"), dog);
	}

	@Override
	public List<Dog> selectDogByEmail(String email) {
		return session.selectList(makeSqlId("selectDogJoinDogInfoDogImageByEmail"), email);
	}

	@Override
	public int updateDog(Dog dog) {
		return session.update(makeSqlId("updateDog"), dog);
	}

	@Override
	public int deleteDog(int dogId) {
		return session.delete(makeSqlId("deleteDog"), dogId);
	}
	
	//----------강아지 이미지 -------------------
	@Override
	public int insertDogImage(DogImage dogImage) {
		return session.insert(makeSqlId("insertDogImage"), dogImage);
	}

	@Override
	public int updateDogImage(DogImage dogImage, String originalImage) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("dogId", dogImage.getDogId());
		params.put("dogImage", dogImage.getDogImage());
		params.put("originalImage", originalImage);
		return session.update(makeSqlId("updateDogImage"), params);
	}

	@Override
	public int deleteDogImage(String dogImage) {
		return session.delete(makeSqlId("deleteDogImage"), dogImage);
	}
	
	//----------강아지 정보 -------------------
	@Override
	public int insertDogInfo(DogInfo dogInfo) {
		return session.insert(makeSqlId("insertDogInfo"), dogInfo);
	}

	@Override
	public int updateDogInfo(DogInfo dogInfo) {
		return session.insert(makeSqlId("updateDogImage"), dogInfo);
	}

	@Override
	public int deleteDogInfo(int dogId) {
		return session.delete(makeSqlId("updateDogImage"),dogId);
	}
	
	
}