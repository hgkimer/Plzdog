package com.plz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.dao.DogDao;
import com.plz.service.DogService;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

@Service
public class DogServiceImpl implements DogService {

	@Autowired
	private DogDao dogDao;
	
	@Override
	public void insertDog(Dog dog) {
		dogDao.insertDog(dog);
	}

	@Override
	public List<Dog> selectDogByEmail(String email) {
		return dogDao.selectDogByEmail(email);
	}

	@Override
	public void updateDog(Dog dog) {
		dogDao.updateDog(dog);
	}

	@Override
	public void deleteDog(int dogId) {
		dogDao.deleteDog(dogId);
	}

	@Override
	public void insertDogImage(DogImage dogImage) {
		dogDao.insertDogImage(dogImage);
	}

	@Override
	public void updateDogImage(DogImage dogImage, String originalImage) {
		dogDao.updateDogImage(dogImage, originalImage);
	}

	@Override
	public void deleteDogImage(String dogImage) {
		dogDao.deleteDogImage(dogImage);
	}
}