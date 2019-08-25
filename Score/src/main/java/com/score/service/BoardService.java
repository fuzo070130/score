package com.score.service;

import java.util.List;

import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.BoardVO;

public interface BoardService {
	
	public int insert(BoardVO vo);

	public List<BoardVO> list();
	
	public BoardVO readPage(int boardNumber);
	
	public int modify(BoardVO vo);
	
	public int delete(int boardNumber);
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
