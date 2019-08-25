package com.score.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.score.domain.vo.ReplyVO;
import com.score.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	ReplyDAO dao;

	@Override
	public int insert(ReplyVO vo) {
		return dao.insert(vo);
	}

	@Override
	public List<ReplyVO> replyList(int boardNumber, int replyPoint) {
		return dao.replyList(boardNumber, replyPoint);
	}

}
