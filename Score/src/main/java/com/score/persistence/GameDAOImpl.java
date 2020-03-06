package com.score.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.score.domain.dto.SearchCriteria;
import com.score.domain.vo.GameVO;

@Repository
public class GameDAOImpl implements GameDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.score.mapper.GameMapper";

	@Override
	public int insert(GameVO vo) {
		return session.insert(namespace + ".insert", vo);
	}

	@Override
	public List<GameVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public GameVO readPage(Integer GameNumber) {
		return session.selectOne(namespace + ".readPage", GameNumber);
	}

	@Override
	public List<GameVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public int modify(GameVO vo) {
		return session.update(namespace + ".modify", vo);
	}

}
