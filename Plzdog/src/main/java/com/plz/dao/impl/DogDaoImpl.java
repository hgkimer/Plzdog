package com.plz.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plz.dao.DogDao;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

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
		return session.selectList(makeSqlId("selectDogByEmail"), email);
	}

	@Override
	public int updateDog(Dog dog) {
		return session.update(makeSqlId("updateDog"), dog);
	}

	@Override
	public int deleteDog(int dogId) {
		return session.delete(makeSqlId("deleteDog"), dogId);
	}

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
}