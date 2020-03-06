package com.score.persistence;

import java.util.List;

import com.score.domain.vo.GameReviewVO;

public interface GameReviewDAO {
	
	public int insert(GameReviewVO vo);

	public List<GameReviewVO> select(Integer gameNumber);
	
	public int update(GameReviewVO vo);
	
	public int delete(Integer gameReviewNumber);
	

}
