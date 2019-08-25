package com.score.domain.vo;

import java.sql.Date;

public class GameReviewVO {
	
	private int gameReviewNumber;
	private int gameNumber;
	private int userNumber;
	private int userNickName;
	private String gameReviewText;
	private Date gameReviewDate;
	
	public int getGameReviewNumber() {
		return gameReviewNumber;
	}
	public void setGameReviewNumber(int gameReviewNumber) {
		this.gameReviewNumber = gameReviewNumber;
	}
	public int getGameNumber() {
		return gameNumber;
	}
	public void setGameNumber(int gameNumber) {
		this.gameNumber = gameNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public int getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(int userNickName) {
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
