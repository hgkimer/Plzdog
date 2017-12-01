package com.plz.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.plz.dao.DogDao;
import com.plz.service.DogService;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;
import com.plzdog.vo.DogInfo;

@Service
public class DogServiceImpl implements DogService {

	@Autowired
	private DogDao dogDao;
	
	@Override
	@Transactional
	public void insertDog(Dog dog ,HttpServletRequest request) throws IllegalStateException, IOException {
				System.out.println(dog);
				dogDao.insertDog(dog);
				ArrayList<DogImage> list = new ArrayList<>();
				for(MultipartFile dogImage : dog.getDogImageList()) {
					if(dogImage != null && ! dogImage.isEmpty()) {//업로드된 파일이 있는 경우 파일을 옮기고 파일명을 User에 설정
						String fileName = UUID.randomUUID().toString();	
						File dest = new File(request.getServletContext().getRealPath("/dogImage"), fileName);
						dogImage.transferTo(dest);
						//careImage 등록 처리
						dogDao.insertDogImage(new DogImage(fileName,dog.getDogId()));
						list.add(new DogImage(fileName,dog.getDogId()));
					}
				}
				//dogImage를 dog 객체에 등록 
				dog.setDogImage(list);
				
				//dogInfo 등록
				for(DogInfo dogInfo : dog.getDogInfoList()) {
					dogDao.insertDogInfo(dogInfo);
				}
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
	@Transactional
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