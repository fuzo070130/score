package com.score.domain.vo;

import java.sql.Date;

public class BoardVO {
	
	private Integer boardNumber;
	private String boardTitle;
	private String boardImg;
	private String boardContent;
	private String userNickName;
	private Integer userNumber;
	private Date boardRegDate;
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	private Date boardUpdateDate;
	private Integer boardReplyPoint;
	private Integer boardViewPoint;
	private Integer boardGoodPoint;
	
	public Integer getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(Integer boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public Date getBoardRegDate() {
		return boardRegDate;
	}
	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}
	public Date getBoardUpdateDate() {
		return boardUpdateDate;
	}
	public void setBoardUpdateDate(Date boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}
	public Integer getBoardReplyPoint() {
		return boardReplyPoint;
	}
	public void setBoardReplyPoint(Integer boardReplyPoint) {
		this.boardReplyPoint = boardReplyPoint;
	}
	public Integer getBoardViewPoint() {
		return boardViewPoint;
	}
	public void setBoardViewPoint(Integer boardViewPoint) {
		this.boardViewPoint = boardViewPoint;
	}
	public Integer getBoardGoodPoint() {
		return boardGoodPoint;
	}
	public void setBoardGoodPoint(Integer boardGoodPoint) {
		this.boardGoodPoint = boardGoodPoint;
	}
	
}
