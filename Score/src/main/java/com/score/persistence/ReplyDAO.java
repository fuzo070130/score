package com.score.persistence;

import java.util.List;

import com.score.domain.vo.ReplyVO;

public interface ReplyDAO {
	
	public int insert(ReplyVO vo);
	
	public List<ReplyVO> replyList(int boardNumber,int replyPoint);

}
