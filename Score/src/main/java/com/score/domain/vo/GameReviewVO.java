package com.score.domain.vo;

import java.sql.Date;

public class GameReviewVO {
	
	private Integer gameReviewNumber;
	private Integer gameNumber;
	private Integer userNumber;
	private Integer userNickName;
	private String gameReviewText;
	private Date gameReviewDate;
	
	public Integer getGameReviewNumber() {
		return gameReviewNumber;
	}
	public void setGameReviewNumber(Integer gameReviewNumber) {
		this.gameReviewNumber = gameReviewNumber;
	}
	public Integer getGameNumber() {
		return gameNumber;
	}
	public void setGameNumber(Integer gameNumber) {
		this.gameNumber = gameNumber;
	}
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public Integer getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(Integer userNickName) {
		this.userNickName = userNickName;
	}
	public String getGameReviewText() {
		return gameReviewText;
	}
	public void setGameReviewText(String gameReviewText) {
		this.gameReviewText = gameReviewText;
	}
	public Date getGameReviewDate() {
		return gameReviewDate;
	}
	public void setGameReviewDate(Date gameReviewDate) {
		this.gameReviewDate = gameReviewDate;
	}
	
}
