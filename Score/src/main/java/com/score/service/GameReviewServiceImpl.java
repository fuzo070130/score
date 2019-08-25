package com.score.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.BoardVO;
import com.score.domain.vo.GameReviewVO;
import com.score.domain.vo.GameVO;
import com.score.persistence.BoardDAO;
import com.score.persistence.GameDAO;
import com.score.persistence.GameReviewDAO;

@Service
public class GameReviewServiceImpl implements GameReveiwService {

	@Inject
	GameReviewDAO dao;

	@Override
	public int insert(GameReviewVO vo) {
		return dao.insert(vo);
	}

	@Override
	public List<GameReviewVO> select(int gameNumber) {
		return dao.select(gameNumber);
	}

	@Override
	public int update(GameReviewVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(int gameReviewNumber) {
		return dao.delete(gameReviewNumber);
	}

}
