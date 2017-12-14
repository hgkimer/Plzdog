package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Care implements Serializable{

	private static final long serialVersionUID = 1L;
	private int careId;
	private int resId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date careDate;
	private String careMeal;
	private String careWalking;
	private String careBowelMovement;
	private String careReview;
	
	//여러개의 이미지 처리
	private List<MultipartFile> careImageList;
	//여러개의 파일명 처리
	private List<CareImage> careImage; 

	public Care() {}

	public Care(int careId, int resId, Date careDate, String careMeal, String careWalking, String careBowelMovement,
			String careReview) {
		super();
		this.careId = careId;
		this.resId = resId;
		this.careDate = careDate;
		this.careMeal = careMeal;
		this.careWalking = careWalking;
		this.careBowelMovement = careBowelMovement;
		this.careReview = careReview;
	}

	public Care(int careId, int resId, Date careDate, String careMeal, String careWalking, String careBowelMovement,
			String careReview, List<MultipartFile> careImageList, List<CareImage> careImage) {
		super();
		this.careId = careId;
		this.resId = resId;
		this.careDate = careDate;
		this.careMeal = careMeal;
		this.careWalking = careWalking;
		this.careBowelMovement = careBowelMovement;
		this.careReview = careReview;
		this.careImageList = careImageList;
		this.careImage = careImage;
	}

	public int getCareId() {
		return careId;
	}

	public void setCareId(int careId) {
		this.careId = careId;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public Date getCareDate() {
		return careDate;
	}

	public void setCareDate(Date careDate) {
		this.careDate = careDate;
	}

	public String getCareMeal() {
		return careMeal;
	}

	public void setCareMeal(String careMeal) {
		this.careMeal = careMeal;
	}

	public String getCareWalking() {
		return careWalking;
	}

	public void setCareWalking(String careWalking) {
		this.careWalking = careWalking;
	}

	public String getCareBowelMovement() {
		return careBowelMovement;
	}

	public void setCareBowelMovement(String careBowelMovement) {
		this.careBowelMovement = careBowelMovement;
	}

	public String getCareReview() {
		return careReview;
	}

	public void setCareReview(String careReview) {
		this.careReview = careReview;
	}

	public List<MultipartFile> getCareImageList() {
		return careImageList;
	}

	public void setCareImageList(List<MultipartFile> careImageList) {
		this.careImageList = careImageList;
	}

	public List<CareImage> getCareImage() {
		return careImage;
	}

	public void setCareImage(List<CareImage> careImage) {
		this.careImage = careImage;
	}

	@Override
	public String toString() {
		return "Care [careId=" + careId + ", resId=" + resId + ", careDate=" + careDate + ", careMeal=" + careMeal
				+ ", careWalking=" + careWalking + ", careBowelMovement=" + careBowelMovement + ", careReview="
				+ careReview + ", careImageList=" + careImageList + ", careImage=" + careImage + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((careBowelMovement == null) ? 0 : careBowelMovement.hashCode());
		result = prime * result + ((careDate == null) ? 0 : careDate.hashCode());
		result = prime * result + careId;
		result = prime * result + ((careImage == null) ? 0 : careImage.hashCode());
		result = prime * result + ((careImageList == null) ? 0 : careImageList.hashCode());
		result = prime * result + ((careMeal == null) ? 0 : careMeal.hashCode());
		result = prime * result + ((careReview == null) ? 0 : careReview.hashCode());
		result = prime * result + ((careWalking == null) ? 0 : careWalking.hashCode());
		result = prime * result + resId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Care other = (Care) obj;
		if (careBowelMovement == null) {
			if (other.careBowelMovement != null)
				return false;
		} else if (!careBowelMovement.equals(other.careBowelMovement))
			return false;
		if (careDate == null) {
			if (other.careDate != null)
				return false;
		} else if (!careDate.equals(other.careDate))
			return false;
		if (careId != other.careId)
			return false;
		if (careImage == null) {
			if (other.careImage != null)
				return false;
		} else if (!careImage.equals(other.careImage))
			return false;
		if (careImageList == null) {
			if (other.careImageList != null)
				return false;
		} else if (!careImageList.equals(other.careImageList))
			return false;
		if (careMeal == null) {
			if (other.careMeal != null)
				return false;
		} else if (!careMeal.equals(other.careMeal))
			return false;
		if (careReview == null) {
			if (other.careReview != null)
				return false;
		} else if (!careReview.equals(other.careReview))
			return false;
		if (careWalking == null) {
			if (other.careWalking != null)
				return false;
		} else if (!careWalking.equals(other.careWalking))
			return false;
		if (resId != other.resId)
			return false;
		return true;
	}
}