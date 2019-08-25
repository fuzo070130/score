package com.score.domain.vo;

import java.sql.Date;

/**
 * @author fuzo070130 이준수
 *
 */
public class UserVO {
	
	private Integer userNumber;
	private String userID;
	private String userName;
	private String userNickName;
	private String userPassWord;
	private String userEmail;
	private String userEmailCheck;
	private String userIntro;
	private Date userRegDate;
	private Date userUpdateDate;
	private Integer userReviewPoint;
	private Integer userBoardPoint;
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserPassWord() {
		return userPassWord;
	}
	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailCheck() {
		return userEmailCheck;
	}
	public void setUserEmailCheck(String userEmailCheck) {
		this.userEmailCheck = userEmailCheck;
	}
	public String getUserIntro() {
		return userIntro;
	}
	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public Date getUserUpdateDate() {
		return userUpdateDate;
	}
	public void setUserUpdateDate(Date userUpdateDate) {
		this.userUpdateDate = userUpdateDate;
	}
	public Integer getUserReviewPoint() {
		return userReviewPoint;
	}
	public void setUserReviewPoint(Integer userReviewPoint) {
		this.userReviewPoint = userReviewPoint;
	}
	public Integer getUserBoardPoint() {
		return userBoardPoint;
	}
	public void setUserBoardPoint(Integer userBoardPoint) {
		this.userBoardPoint = userBoardPoint;
	}
	
}