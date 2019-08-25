package com.score.domain.vo;

import java.sql.Date;

public class ReplyVO {
	
	private Integer replyNumber;
	private Integer boardNumber;
	private String userNickName;
	private Integer userNumber;
	private String replyContent;
	private Date replyRegDate;
	private Date replyUpdateDate;
	
	public Integer getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(Integer boardNumber) {
		this.boardNumber = boardNumber;
	}
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public Integer getReplyNumber() {
		return replyNumber;
	}
	public void setReplyNumber(Integer replyNumber) {
		this.replyNumber = replyNumber;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public Date getReplyUpdateDate() {
		return replyUpdateDate;
	}
	public void setReplyUpdateDate(Date replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}
	
}
