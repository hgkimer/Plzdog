package com.plzdog.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Review implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int reviewId;
	private int reviewRate;
	private String reviewContents;
	private String sitterEmail;
	private String memberEmail;
	@DateTimeFormat(iso=ISO.DATE, pattern="yyyy-MM-dd")
	private Date reviewDate;
	
	//작성자 이름 조회 할 때만 필요
	private String memberName;
	
	public Review() {}

	public Review(int reviewId, int reviewRate, String reviewContents, String sitterEmail, String memberEmail,
			Date reviewDate) {
		super();
		this.reviewId = reviewId;
		this.reviewRate = reviewRate;
		this.reviewContents = reviewContents;
		this.sitterEmail = sitterEmail;
		this.memberEmail = memberEmail;
		this.reviewDate = reviewDate;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public String getSitterEmail() {
		return sitterEmail;
	}

	public void setSitterEmail(String sitterEmail) {
		this.sitterEmail = sitterEmail;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", reviewRate=" + reviewRate + ", reviewContents=" + reviewContents
				+ ", sitterEmail=" + sitterEmail + ", memberEmail=" + memberEmail + ", reviewDate=" + reviewDate
				+ ", memberName=" + memberName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberEmail == null) ? 0 : memberEmail.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((reviewContents == null) ? 0 : reviewContents.hashCode());
		result = prime * result + ((reviewDate == null) ? 0 : reviewDate.hashCode());
		result = prime * result + reviewId;
		result = prime * result + reviewRate;
		result = prime * result + ((sitterEmail == null) ? 0 : sitterEmail.hashCode());
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
		Review other = (Review) obj;
		if (memberEmail == null) {
			if (other.memberEmail != null)
				return false;
		} else if (!memberEmail.equals(other.memberEmail))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (reviewContents == null) {
			if (other.reviewContents != null)
				return false;
		} else if (!reviewContents.equals(other.reviewContents))
			return false;
		if (reviewDate == null) {
			if (other.reviewDate != null)
				return false;
		} else if (!reviewDate.equals(other.reviewDate))
			return false;
		if (reviewId != other.reviewId)
			return false;
		if (reviewRate != other.reviewRate)
			return false;
		if (sitterEmail == null) {
			if (other.sitterEmail != null)
				return false;
		} else if (!sitterEmail.equals(other.sitterEmail))
			return false;
		return true;
	}

}
