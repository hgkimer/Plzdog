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
	@Transactional
	public void updateCare(Care care, HttpServletRequest request) throws IllegalStateException, IOException {
		//돌봄일지 수정
		careDao.updateCare(care);
		
		// 리턴할 careList
		List<CareImage> list = new ArrayList<>();
		
		//해당 돌봄일지에 대한 이미지 전체 삭제
		careDao.deleteCareImage(care.getCareId());
		
		//기존의 image들 oldList에 추가
		if (!(care.getOldImage() == null) && !(care.getOldImage().size() == 0)) {
			for (String fileName : care.getOldImage()) {
				// 다시 이미지 추가
				careDao.insertCareImage(new CareImage(care.getCareId(),fileName));
				list.add(new CareImage(care.getCareId(),fileName));
			}
		}
		
		// 파라미터로 넘어온 image들 처리
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
	}
	
	/************************
	 * premiumStage 정보수정 controller
	 * 
	 * @throws IOException
	 * @throws IllegalStateException
	 **********************/

	/*@RequestMapping("/producer/premiumStageUpdate")
	public ModelAndView premiumStageUpdate(@ModelAttribute PremiumStage stage, HttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println(stage+"premiumstageController");
		
		 * updatecontroller 흐름. 1. 기존에 있던 image 테이블의 데이터삭제. 2. 새로 받은 multiImage들 list에
		 * 담아서 넣기. 3. supplier의 정보 update. 4. map에 이미지 리스트, supplier 담아서 다음 페이지에 넘기기.
		 
		// 파라미터로 넘어온 image들
		List<MultipartFile> list = stage.getMultiImage();
		// 테이블에 넣을 image들
		List<String> imageList = new ArrayList<>();
		if (!(stage.getOldImage() == null) && !(stage.getOldImage().size() == 0)) {
			for (String s : stage.getOldImage()) {
				imageList.add(s);
			}
		}
		if (!(list == null) && !(list.size() == 0)) {
			for (MultipartFile image : list) {
				int i = 0;
				String dir = request.getServletContext().getRealPath("/supplierImage");
				String fileName = UUID.randomUUID().toString();
				File upImage = new File(dir, fileName + ".jpg");
				image.transferTo(upImage);
				imageList.add(fileName + ".jpg");
			}
		}
		
		stage.setStageImage(imageList.get(0));

		// service에서 처리해 줄것 : image 기존거 삭제 & 추가 / supplier 의 정보 update
		stage = service.updatePremiumStage(stage.getEstablishNum(), imageList, stage);

		// map에 넣어서 보낸다.
		Map<String, Object> map = new HashMap<>();
		map.put("imageList", imageList);
		map.put("premiumStage", stage);

		return new ModelAndView("premiumStage/myStageDetailView.tiles", "map", map);
	}*/


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
	public void deleteCareImage(int careId) {
		careDao.deleteCareImage(careId);
	}
}