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
import org.springframework.web.multipart.MultipartFile;

import com.plz.dao.CareDao;
import com.plz.service.CareService;
import com.plzdog.vo.Care;
import com.plzdog.vo.CareImage;

@Service
public class CareServiceImpl implements CareService {

	@Autowired
	private CareDao careDao;
	
	@Override
	@Transactional
	public void insertCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException {
		//care정보+이미지 등록 처리
		careDao.insertCare(care);
		ArrayList<CareImage> list = new ArrayList<>();
		for(MultipartFile careImage : care.getCareImageList()) {
			if(careImage != null && ! careImage.isEmpty()) {//업로드된 파일이 있는 경우 파일을 옮기고 파일명을 dogImage에 설정
				String fileName = UUID.randomUUID().toString();	
				File dest = new File(request.getServletContext().getRealPath("/careImage"), fileName);
				careImage.transferTo(dest);
				//careImage 등록 처리
				careDao.insertCareImage(new CareImage(care.getCareId(),fileName));
				list.add(new CareImage(care.getCareId(),fileName));
			}
		}
		//careImage를 care 객체에 등록 
		care.setCareImage(list);
		
		//dogInfo 등록처리
		
	}
	
	/*@Override
	@Transactional
	public void insertCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException {
		ArrayList<String> fileNameList = new ArrayList<>();
		for(MultipartFile careImage : care.getCareImageList()) {
			if(careImage != null && ! careImage.isEmpty()) {//업로드된 파일이 있는 경우 파일을 옮기고 파일명을 User에 설정
				fileNameList.add(UUID.randomUUID().toString());	
				File dest = new File(request.getServletContext().getRealPath("/careImage"), 
						fileNameList.get(fileNameList.size()-1));
				careImage.transferTo(dest);
			}
		}
		care.setFileNameList(fileNameList);
		careDao.insertCare(care);
		
		for(String imageName : care.getFileNameList()) {
			careDao.insertCareImage(care.getCareId(),imageName);
		}
	}*/

	@Override
	public List<Care> selectCareJoinCareImage(int resId) {
		return careDao.selectCareJoinCareImage(resId);
	}
	
	@Override
	public Care selectCareJoinCareImageByCareId(int careId) {
		return careDao.selectCareJoinCareImageByCareId(careId);
	}
	
	@Override
	public void updateCare(Care care) {
		careDao.updateCare(care);
	}

	@Override
	@Transactional
	public void deleteCare(int careId) {
		careDao.deleteCare(careId);
	}

	@Override
	public void insertCareImage(CareImage careImage) {
		careDao.insertCareImage(careImage);
	}

	@Override
	public void updateCareImage(CareImage careImage, String originalImage) {
		careDao.updateCareImage(careImage, originalImage);
	}

	@Override
	public void deleteCareImage(String careImage) {
		careDao.deleteCareImage(careImage);
	}
}