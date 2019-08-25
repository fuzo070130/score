package com.score.service;

import java.util.List;

import com.score.domain.vo.ReplyVO;

public interface ReplyService {
	
	public int insert(ReplyVO vo);
	
	public List<ReplyVO> replyList(int boardNumber,int replyPoint);

}
