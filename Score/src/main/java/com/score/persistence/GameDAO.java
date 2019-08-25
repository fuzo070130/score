package com.score.persistence;

import java.util.List;

import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.GameVO;

public interface GameDAO {
	
	public int insert(GameVO vo);
	
	public List<GameVO> list();
	
	public GameVO readPage(int GameNumber);
	
	public List<GameVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public int modify(GameVO vo);

}
